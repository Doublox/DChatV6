local oldPrint = print
print = function(trash)
	oldPrint('^7[^2Kyk Private Messages^7] '..trash..'^0')
end

local messagesSent = 0
local replys = 0

--[[
	Registered Commands
]]

--[[ Create the /pm (id) (message) command ]]
RegisterCommand("pm", function(source, args, rawCommand)
	local target = tonumber(args[1])
	local message = table.concat(args, " ",2)
	if target == 0 then
		return false
	end

	if message == "" then --[[ Check to prevent empty messages ]]
		if source ~= 0 then
			TriggerClientEvent('Dbx_PrivateMessage:error', source, 'Message can\'t be empty ')
			if (Config.chatOnly == false) then
				TriggerClientEvent('Dbx_PrivateMessage:SendAlert', target, { type = 'error', text = 'Message can\'t be empty' })
			end
			return
		else
			print('Message can\'t be empty!')
		end
	elseif (GetPlayerName(tonumber(target))) == nil or GetPlayerPing(target) == 0 then --[[ Check if player has ping if not then his not online if he is then wtf how does he have 0 ping]]
		if source ~= 0 then
			TriggerClientEvent('Dbx_PrivateMessage:error', source, 'Invalid Target!')
			if (Config.chatOnly == false) then
				TriggerClientEvent('Dbx_PrivateMessage:SendAlert', target, { type = 'error', text = 'Invalid Target!' })
			end
			return
		else
			print('Invalid Target!')
		end
	elseif (target == source) then
		if source ~= 0 then
			TriggerClientEvent('Dbx_PrivateMessage:error', source, 'Listen here. You are not supposed to send urself private messages!')
			if Config.screenMessages then
				TriggerClientEvent('Dbx_PrivateMessage:SendAlert', target, { type = 'error', text = 'Listen here. You are not supposed to send urself private messages!' })
			end
			return
		else
			print('You are not supposed to send urself private messages!')
		end
	else
		messagesSent = messagesSent + 1
		if (source == 0) then --[[ If the source was console then you will not be able to reply to it. ]]
			--[[
			print('Message Sent To ^1'..GetPlayerName(target))
			if not Config.disableChat then
				TriggerClientEvent('chat:addMessageG', args[1], { args = { '^7[^2Message Recieved From ^1^*Console^r^7]: '..message }, color = 255,255,255 })
			end
			if Config.screenMessages then
				TriggerClientEvent('Dbx_PrivateMessage:SendAlert', target, { type = 'inform', text = 'Private Message Recieved<br>Sender: Console<br><br>Message: '..message })
			end
			]]
		else
			TriggerClientEvent('Dbx_PrivateMessage:lastSender', target, tonumber(source))
			--[[ Source(sender) stuff ]]
			if (Config.disableChat == false) then
				TriggerClientEvent('chat:addMessageG', source, { args = { '^7^2Private Message Sent To ^1^*'..GetPlayerName(target)..' (ID: '..tonumber(target)..')^r^7' }, color = 255,255,255 })
			end
			if Config.screenMessages then
				TriggerClientEvent('Dbx_PrivateMessage:SendAlert', source, { type = 'success', text = 'Message sent to: '..GetPlayerName(target)..' (ID: '..tonumber(target)..')'..' successfully.' })
			end
			if Config.logging then
				sendToDiscord('***Source:*** '..GetPlayerName(source)..' - '..GetPlayerIdentifier(source)..' - ID: '..source..
					'\n***Target:*** '..GetPlayerName(target)..' - '..GetPlayerIdentifier(source)..' - ID: '..target..
					'\n***Message:*** '..message
				)
			end

			--[[ Reciever(target) stuff ]]
			if (Config.disableChat == false) then
				TriggerClientEvent('chat:addMessageG', target, { args = { '^7^*[^2Message Recieved From ^1'..GetPlayerName(tonumber(source))..' (ID: '..tonumber(source)..')^r^7]: '..message }, color = 255,255,255 })
			end
			if Config.screenMessages then
				TriggerClientEvent('Dbx_PrivateMessage:SendAlert', target, { type = 'inform', text = 'Private Message Recieved<br>Sender: '..GetPlayerName(source)..' (ID: '..tonumber(source)..')<br><br>Message: '..message })
			end
		end
	end
end, false)


if Config.statistics then
	RegisterCommand("pmStats", function(source, args, rawCommand) --[[ Statistics Command ]]
		if (source == 0) then
			print('---Private Message Statistics---')
			print('Private Messages Sent: ^1'..messagesSent)
			print('Replys Sent: ^1'..replys)
			print('------')
		else
			TriggerClientEvent("chat:addMessageG", source, {
				color = {255, 255, 255},
				multiline = true,
				args = { '[^2Private Message Statistics^7]\n- PMs Sent: ^1'..messagesSent..'^7\n- Replys Sent: ^1'..replys..'^1' }
			})
		end
		
	end, true)
end


--[[ Check for updates system ( Update code gotten from EasyAdmin version checker) ]]
if Config.checkForUpdates then
	local version = '1.4'
	local resourceName = "Dbx-PrivateMessages ("..GetCurrentResourceName()..")"
	
	Citizen.CreateThread(function()
		function checkVersion(err,response, headers)
			if err == 200 then
				local data = json.decode(response)
				if version ~= data.privateMessagesVersion and tonumber(version) < tonumber(data.privateMessagesVersion) then
					print(""..resourceName.." ~r~is outdated.\nNewest Version: "..data.privateMessagesVersion.."\nYour Version: "..version.."\nPlease get the latest update from https://github.com/JeesusKrisostoomus/Dbx-PrivateMessages")
				elseif tonumber(version) > tonumber(data.privateMessagesVersion) then
					print("Your version of "..resourceName.." seems to be higher than the current version.")
				else
					print(resourceName.. " is up to date!")
				end
			else
				print("Version Check failed! HTTP Error Code: "..err)
			end
			
			SetTimeout(3600000, checkVersionHTTPRequest) --[[ Makes the version check repeat every 1h ]]
		end
		function checkVersionHTTPRequest() --[[ Registers checkVersionHTTPRequest function ]]
			PerformHttpRequest("https://raw.githubusercontent.com/JeesusKrisostoomus/Kyk-Releases/main/versions.json", checkVersion, "GET") --[[ Sends GET http requests ]]
		end
		checkVersionHTTPRequest() --[[ Calls checkVersionHTTPRequest function ]]
	end)
end

sendToDiscord = function(message)
	local embed = {
        {
            ["color"] = 16753920, --[[ Default Color: Orange ]]
            ["title"] = "** New Private Message **",
            ["description"] = message,
            ["footer"] = {
                ["text"] = os.date("Sent at: %H:%M %Y.%m.%d"),
            },
        }
    }
	PerformHttpRequest(Config.webhook, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
end

--[[
	Registered Events
]]
RegisterNetEvent('Dbx_PrivateMessage:reply')
AddEventHandler('Dbx_PrivateMessage:reply', function(lastSender, args)
	local message = table.concat(args, " ", 1)

	TriggerClientEvent('Dbx_PrivateMessage:lastSender', lastSender, tonumber(source))

	--[[ Source stuff ]]
	if (Config.disableChat == false) then
		TriggerClientEvent('chat:addMessageG', source, { args = { '^7^2Reply Sent to ^1'..GetPlayerName(lastSender) }, color = 255,255,255 })
	end
	if Config.screenMessages then
		TriggerClientEvent('Dbx_PrivateMessage:SendAlert', source, { type = 'success', text = 'Reply sent to: '..GetPlayerName(lastSender)..' (ID: '..tonumber(lastSender)..')'..' successfully.' })
	end

	--[[ Reciever stuff ]]
	if (Config.disableChat == false) then
		TriggerClientEvent('chat:addMessageG', lastSender, { args = { '^7[^2Message Recieved From ^1'..GetPlayerName(tonumber(source))..'^7]: '..message }, color = 255,255,255 })
	end
	if Config.screenMessages then
		TriggerClientEvent('Dbx_PrivateMessage:SendAlert', lastSender, { type = 'inform', text = 'Private Message Recieved<br>Sender: '..GetPlayerName(lastSender)..' (ID: '..tonumber(source)..')<br><br>Message: '..message })
	end

	--[[ Logging stuff ]]
	if Config.logging then
		sendToDiscord('***Source:*** '..GetPlayerName(source)..' - '..GetPlayerIdentifier(source)..' - ID: '..source..
			'\n***Target:*** '..GetPlayerName(target)..' - '..GetPlayerIdentifier(source)..' - ID: '..target..
			'\n***Message:*** '..message
		)
	end

	replys = replys + 1
end)


AddEventHandler('onResourceStart', function(resourceName)
	if (GetCurrentResourceName() == resourceName) then
		if (Config.disableChat == true and Config.screenMessages == false) then
			print('Both "Chat Private Messages" and "Screen Private Messages" were disabled.\nForcing Chat Messages on')
			Config.disableChat = false
		end
	end
end)
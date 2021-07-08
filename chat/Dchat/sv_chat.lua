local DBX_WebHook = 'https://discord.com/api/webhooks/859534400463437865/7GhWCPT85XUxRDfDegx5vPzxk8cM39pWJ_c6zWa-DS57xP5Lst-W459ba9fF2lOJTNkz'
local DBX_image = 'https://discord.com/api/webhooks/859534400463437865/7GhWCPT85XUxRDfDegx5vPzxk8cM39pWJ_c6zWa-DS57xP5Lst-W459ba9fF2lOJTNkz'

--Doublox#9803---
RegisterServerEvent('chat:init')
RegisterServerEvent('chat:addTemplate')
RegisterServerEvent('chat:addMessage')
RegisterServerEvent('chat:addSuggestion')
RegisterServerEvent('chat:removeSuggestion')
RegisterServerEvent('_chat:messageEntered')
RegisterServerEvent('_chat:messageEnteredA')
RegisterServerEvent('_chat:messageEnteredG')
RegisterServerEvent('chat:clear')
RegisterServerEvent('__cfx_internal:commandFallback')

ESX = nil
Dchat = false

Citizen.CreateThread(function()
    while ESX == nil do 
        Wait(1)
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        --Doublox#9803---
    end
end)

AddEventHandler('_chat:messageEntered', function(author, color, message)
    if not message or not author then
        return
    end

    TriggerEvent('chatMessage', source, author, message)
    if not WasEventCanceled() then
        TriggerClientEvent('chatMessage', -1, author,  { 255, 255, 255 }, message)
    end

    print(author .. '^7: ' .. message .. '^7')
end)

AddEventHandler('_chat:messageEnteredA', function(author, color, message)
    if not message or not author then
        return
    end

    TriggerEvent('chatMessageA', source, author, message)

    if not WasEventCanceled() then
        TriggerClientEvent('chatMessageA', -1, author,  { 255, 255, 255 }, message)
    end

    print(author .. '^7: ' .. message .. '^7')
end)

AddEventHandler('_chat:messageEnteredG', function(author, color, message)
    local xPlayer = ESX.GetPlayerFromId(source)
    if group == 'user' or 'mod' or 'admin' or 'superadmin' and antispam == false then
        if not message or not author then
            return
        end

        TriggerEvent('chatMessageG', source, author, message)

    --iccccccccccccccccccccccccc

        
        if not WasEventCanceled() then
            TriggerClientEvent('chatMessageG', -1, author,  { 255, 255, 255 }, message)
        end
    
        print(author .. '^7: ' .. message .. '^7')

     TriggerClientEvent('esx:showNotification', source, 'Bienvenue dans la section Message Privée !')
     TriggerClientEvent('esx:showNotification', source, '/pm ‘id cible’ ‘msg’ - Cette commande enverra un message privé au joueur dont le id est id cible ‘id cible’ ')
     TriggerClientEvent('esx:showNotification', source, '/r ‘message’ - Cette commande répondra au dernier message privé que vous avez reçu.')
     TriggerClientEvent('esx:showNotification', source, '/reply ‘message’ - Cette commande répondra au dernier message privé que vous avez reçu.')
     TriggerClientEvent('esx:showNotification', source, '/pmStats - Cette commande permettra aux personnes ayant des permissions de voir les statistiques définies')
    else 
        TriggerClientEvent('esx:showNotification', source, 'Bienvenue dans la section Message Privée !')
    end
end)

AddEventHandler('__cfx_internal:commandFallback', function(command)
    local name = GetPlayerName(source)

    TriggerEvent('chatMessage', source, name, '/' .. command)

    if not WasEventCanceled() then
        TriggerClientEvent('chatMessage', -1, name, { 255, 255, 255 }, '/' .. command) 
    end

    CancelEvent()
end)

--Doublox#9803---
-- command suggestions for clients
local function refreshCommands(player)
    if GetRegisteredCommands then
        local registeredCommands = GetRegisteredCommands()

        local suggestions = {}

        for _, command in ipairs(registeredCommands) do
            if IsPlayerAceAllowed(player, ('command.%s'):format(command.name)) then
                table.insert(suggestions, {
                    name = '/' .. command.name,
                    help = ''
                })
            end
        end

        TriggerClientEvent('chat:addSuggestions', player, suggestions)
    end
end
------------------------------LOG DU CHAT V6 HERE---------------------------


AddEventHandler('chatMessage', function(source, DM, dm)
    local name = GetPlayerName(source)
    DbxChatV6LogSend(DM, dm)
    PerformHttpRequest(DBX_WebHook, function(err, text, headers) end, 'POST', json.encode({username =  'DChat V6 Logs DBX', embeds = connect, avatar_url = DBX_image}), { ['Content-Type'] = 'application/json' })
end)

function DbxChatV6LogSend(DM, dm, color)
    local connect = {
          {
              ['color'] = 9312783, -- you can change color 
              ['title'] = '**'.. DM ..'**',
              ['description'] = dm,
              ['footer'] = {
              ['text'] = os.date("%Y/%m/%d %X"),
              },
          }
      }
  PerformHttpRequest(DBX_WebHook, function(err, text, headers) end, 'POST', json.encode({username = 'DChat V6 Logs DBX', embeds = connect, avatar_url = DBX_image}), { ['Content-Type'] = 'application/json' })
end


print ("DBX ChatV6 Log")
print (os.date ("%x %c"))


--[[
--Private Messages test
TriggerEvent('es:addCommand', 'pm', function(source, args, user)
    if(GetPlayerName(tonumber(args[2])) or GetPlayerName(tonumber(args[3])))then
    local player = tonumber(args[2])
    table.remove(args, 2)
    table.remove(args, 1)

    TriggerEvent("es:getPlayerFromId", player, function(target)
    TriggerClientEvent('chatMessageG', player, "PM", {214, 214, 214}, "^2 From ^5"..GetPlayerName(source).. " [" .. source .. "]: ^7" ..table.concat(args, " "))
    TriggerClientEvent('chatMessageG', source, "PM", {214, 214, 214}, "^3 Sent to ^5"..GetPlayerName(player).. ": ^7" ..table.concat(args, " "))
    end)
    else
    TriggerClientEvent('chatMessageG', source, "SYSTEM", {255, 0, 0}, "Incorrect player ID!")
    end
    end, function(source, args, user)
    TriggerClientEvent('chatMessageG', source, "SYSTEM", {255, 0, 0}, "Insufficienct permissions!")
    end)



]]
---------------------------- Hide my chat  ------------------
--[[AddEventHandler('chatMessage', function(source, name, message)
    if message == '/hidemychat' then
      Dchat = not Dchat
      if Dchat then
        TriggerClientEvent('chatMessage', -1, 'Cancel Chat', {255, 255, 255}, name .. ' has canceled chat for everyone.')
      else
        TriggerClientEvent('chatMessage', -1, 'Enable Chat', {255, 255, 255}, name .. ' has enabled chat for everyone.')
      end
      CancelEvent()
    else
      if Dchat then
        TriggerClientEvent('chatMessage', source, 'Your Chat Off', {255, 255, 255}, name .. ' has canceled chat for everyone, your message was deleted.')
        CancelEvent()
      end
    end
  end)
  ]]
  AddEventHandler('chatMessage', function(source, name, message)
    if message == '/hidemychat' then
      Dchat = not Dchat
      if Dchat then
        TriggerClientEvent('chatMessage', -1, 'OFF Chat', {255, 255, 255}, name .. ' a annulé de voir les messages du chat général !')
        TriggerClientEvent('esx:showNotification', source, '[Crypted] Tu a annulé de voir les messages du chat général ! [Crypted]')
      else
        TriggerClientEvent('chatMessage', -1, 'ON Chat', {255, 255, 255}, name .. ' a activé de voir les messages du chat général !')
        TriggerClientEvent('esx:showNotification', source, '[Crypted] tu a activé de voir les messages du chat général ! [Crypted]')
      end
      CancelEvent()
    else
      if Dchat then
        TriggerClientEvent('chatMessage', source, 'Chat is disabled', {255, 255, 255}, name .. ' Les messages du chat son désactiver réactive les en marquant la commande /hidemychat ! .')
        TriggerClientEvent('esx:showNotification', source, '[Crypted] Tes messages du chat son désactiver réactive les en marquant la commande /hidemychat ! [Crypted]')
        CancelEvent()
      end
    end
  end)  
  
------------------------------
RegisterCommand("drknt", function(source, args, rawCommand)
    local message = table.concat(args, " ")

    TriggerClientEvent("chatMessage", -1, "[" .. source .. "] " .. "DARKNET", {173,32,32},  message)
end)
----------------------------
AddEventHandler('chat:init', function()
    refreshCommands(source)
end)

AddEventHandler('onServerResourceStart', function(resName)
    Wait(500)
--Doublox#9803---
    for _, player in ipairs(GetPlayers()) do
        refreshCommands(player)
    end
end)


-- player join messages
--[[AddEventHandler('chat:init', function()
    TriggerClientEvent('chatMessage', -1, '', { 255, 255, 255 }, '^2* ' .. GetPlayerName(source) .. ' joined.')
end)

AddEventHandler('playerDropped', function(reason)
    TriggerClientEvent('chatMessage', -1, '', { 255, 255, 255 }, '^2* ' .. GetPlayerName(source) ..' left (' .. reason .. ')')
end)

RegisterCommand('say', function(source, args, rawCommand)
    TriggerClientEvent('chatMessage', -1, (source == 0) and 'console' or GetPlayerName(source), { 255, 255, 255 }, rawCommand:sub(5))
end)]]


-------Advanced Report test !---------------
--[[local Group 

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('esx_chatforadmin:GetGroup', function(source, cb)
    local player = ESX.GetPlayerFromId(source)

    if player ~= nil then
        Group = player.getGroup()
        if Group ~= nil then 
            cb(Group)
        else
            cb("user")
        end
    else
        cb("user")
    end
end)

RegisterCommand('HELPP', function(source, args, rawCommand)
	local xPlayer = ESX.GetPlayerFromId(source)
	Group = xPlayer.getGroup()
	if Group ~= 'user' then
		TriggerClientEvent("sendMessageAdmin", -1, source,  xPlayer.getName(), table.concat(args, " "))
	end	
end, false)]]


RegisterCommand('HELPDP', function(source, args, rawCommand)
    ExecuteCommand("debug")
end, false)
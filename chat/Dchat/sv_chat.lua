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
    if xPlayer.job.name == 'ambulance' then 
        if not message or not author then
            return
        end
    
        TriggerEvent('chatMessageG', source, author, message)
    
        if not WasEventCanceled() then
            TriggerClientEvent('chatMessageG', -1, author,  { 255, 255, 255 }, message)
        end
    
        print(author .. '^7: ' .. message .. '^7')
    else 
        TriggerClientEvent('esx:showNotification', source, '[Crypted] Eh mec ici c cryptée ! [Crypted]')
        TriggerClientEvent('esx:showNotification', source, '[Crypted] Tu veux que je te poucave ou quoi ?! [Crypted]')
        TriggerClientEvent('esx:showNotification', source, '**Changement de fréquence du Darknet en cours**')
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

----------------------------
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

webhook = "ADD YOU WEBHOOK LOG BLACLIST COMMAND HERE"

-- "supp": remoove the message
-- "kick": kick the player and delete the message
local mode = "supp"
--Doublox#9803
-- kick message (if 'mode' is set to 'kick')
local kickmessage = "Dchat : Tu a utilisé un mot blacklist ! Des logs suivis d'un report ont été remis avec succès sur le Discord !"

-- blacklisted words (in lowercase)
local blacklist = {
    --liste de mot cheat !--Doublox#9803
    "Desudo",
    "Brutan",
    "EulenCheats",
    "AgAc 8",
    "Discord.gg/",
    "lynxmenu",
    "HamHaxia",
    "Ham Mafia",
    "www.renalua.com",
    "Fallen#0811",
    "Rena 8",
    "HamHaxia", 
    "lynx",
    "Ham Mafia", 
    "Xanax#0134", 
    ">:D Player Crash", 
    "discord.gg", --Doublox#9803
    "34ByTe Community", 
    "lynxmenu.com", 
    "Anti-AgAc",
    "Baran#8992",
    "iLostName#7138",
    "85.190.90.118",
    "Melon#1379",
    "hammafia.com",--Doublox#9803
    "AlphaV ~ 5391",
    "vjuton.pl",
    "Soviet Bear",
    "XARIES",
    "xaries",
    "dc.xaries.pl",
    "aries",
    "aries.pl",
    "youtube.com/c/Aries98/",
    "Aries98",
    "yo many",
    "dezet",
    "333",
    "333GANG",
    "chocolate",
    "hahahahaha",
    "Fucked",
    "injected",
    "panickey",
    "killmenu",--Doublox#9803
    "parent menu doesn",
    "https://discord.gg/VTaeCZm",
    "panik",
    "Cience",
   "brutan",
    "WarMenu",--Doublox#9803
   "tiago",
   "TiagoModz",
    --Ses mot la ont été trouver sur un forum on c jamais avec c anglais
    "ass", 
    "anus",
    "arse",
    "arsehole",
    "ass",
    "ass-hat",
    "ass-jabber",
    "ass-pirate",
    "assbag",
    "assbandit",
    "assbanger",
    "assbite",
    "assclown",--Doublox#9803
    "asscock",
    "asscracker",
    "asses",
    "assface",
    "assfuck",--Doublox#9803
    "assfucker",
    "assgoblin",
    "asshat",
    "asshead",
    "asshole",
    "asshopper",
    "assjacker",
    "asslick",
    "asslicker",
    "assmonkey",
    "assmunch",
    "assmuncher",
    "assnigger",
    "asspirate",
    "assshit",
    "assshole",--Doublox#9803
    "asssucker",
    "asswad",
    "asswipe",
    "axwound",
    "bampot",
    "bastard",
    "beaner",
    "bitch",--Doublox#9803
    "bitchass",
    "bitches",
    "bitchtits",
    "bitchy",
    "blow job",
    "blowjob",
    "bollocks",
    "bollox",
    "boner",
    "brotherfucker",
    "bullshit",
    "bumblefuck",
    "butt plug",
    "butt-pirate",
    "buttfucka",
    "buttfucker",
    "camel toe",--Doublox#9803
    "cameltoe",
    "carpetmuncher",
    "chesticle",
    "chinc",
    "chink",
    "choad",
    "chode",
    "clit",
    "clitface",
    "clitfuck",
    "clusterfuck",
    "cock",
    "cockass",
    "cockbite",
    "cockburger",
    "cockface",
    "cockfucker",
    "cockhead",
    "cockjockey",
    "cockknoker",
    "cockmaster",
    "cockmongler",
    "cockmongruel",
    "cockmonkey",--Doublox#9803
    "cockmuncher",
    "cocknose",
    "cocknugget",
    "cockshit",
    "cocksmith",
    "cocksmoke",
    "cocksmoker",
    "cocksniffer",
    "cocksucker",
    "cockwaffle",
    "coochie",
    "coochy",
    "coon",
    "cooter",
    "cracker",
    "cuck",
    "cum",
    "cumbubble",
    "cumdumpster",
    "cumguzzler",
    "cumjockey",
    "cumslut",
    "cumtart",
    "cunnie",--Doublox#9803
    "cunnilingus",
    "cunt",
    "cuntass",
    "cuntface",
    "cunthole",
    "cuntlicker",
    "cuntrag",
    "cuntslut",
    "dago",
    "damn",
    "deggo",
    "dick",
    "dick-sneeze",
    "dickbag",
    "dickbeaters",
    "dickface",
    "dickfuck",
    "dickfucker",--Doublox#9803
    "dickhead",
    "dickhole",
    "dickjuice",
    "dickmilk",
    "dickmonger",
    "dicks",
    "dickslap",
    "dicksucker",
    "dicksucking",
    "dicktickler",
    "dickwad",
    "dickweasel",
    "dickweed",
    "dickwod",
    "dike",
    "dildo",
    "dipshit",
    "doochbag",
    "dookie",
    "douche-fag",
    "douchebag",
    "douchewaffle",
    "dumass",
    "dumb ass",--Doublox#9803
    "dumbass",
    "dumbfuck",
    "dumbshit",
    "dumshit",
    "dyke",
    "fag",
    "fagbag",
    "fagfucker",
    "faggit",
    "faggot",
    "faggotcock",
    "fagtard",
    "fatass",
    "fellatio",
    "feltch",
    "flamer",
    "fuck",
    "fuckass",
    "fuckbag",
    "fuckboy",
    "fuckbrain",--Doublox#9803
    "fuckbutt",
    "fuckbutter",
    "fucked",
    "fucker",
    "fuckersucker",
    "fuckface",
    "fuckhead",
    "fuckhole",
    "fuckin",
    "fucking",
    "fucknut",
    "fucknutt",
    "fuckoff",
    "fucks",
    "fuckstick",
    "fucktard",
    "fucktart",
    "fuckup",
    "fuckwad",
    "fuckwit",
    "fuckwitt",
    "fudgepacker",
    "gayass",
    "gayfuck",--Doublox#9803
    "gayfuckist",
    "gaylord",
    "gaytard",
    "gaywad",
    "goddamn",
    "goddamnit",
    "gooch",
    "gook",
    "gringo",
    "guido",
    "handjob",
    "hard on",
    "heeb",
    "hell",
    "hoe",
    "homodumbshit",
    "honkey",
    "jackass",
    "jagoff",
    "jerk off",
    "jerkass",--Doublox#9803
    "jigaboo",
    "jizz",
    "jungle bunny",
    "junglebunny",
    "kike",
    "kooch",
    "kootch",
    "kraut",
    "kunt",
    "kyke",
    "lameass",
    "lardass",
    "mcfagget",
    "mick",
    "minge",
    "mothafucka",
    "mothafuckin",
    "motherfucker",
    "motherfucking",
    "muff",
    "muffdiver",
    "munging",
    "negro",--Doublox#9803
    "nigaboo",
    "nigga",
    "nigger",
    "niggers",
    "niglet",
    "nut sack",
    "nutsack",
    "panooch",
    "pecker",
    "peckerhead",
    "penis",
    "penisbanger",
    "penisfucker",
    "penispuffer",
    "piss",
    "pissed",
    "pissed off",
    "pissflaps",
    "polesmoker",
    "poon",
    "poonani",
    "poonany",
    "poontang",
    "porch monkey",
    "porchmonkey",
    "prick",
    "punann",--Doublox#9803
    "punta",
    "pussies",
    "pussy",
    "pussylicking",
    "puto",
    "queef",
    "renob",
    "rimjob",
    "sand nigger", 
    "sandnigger", 
    "schlong",
    "scrote", 
    "shit", 
    "shitass",
    "shitbag",
    "shitbagger",
    "shitbrains", 
    "shitbreath", 
    "shitcanned", 
    "shitcunt",
    "shitdick", --Doublox#9803
    "shitface", 
    "shitfaced", 
    "shithead", 
    "shithole", 
    "shithouse",
    "shitspitter", 
    "shitstain", 
    "shitter", 
    "shittiest", 
    "shitting", 
    "shitty",
    "shiz",
    "shiznit",
    "skank",
    "skeet",
    "skullfuck",
    "slut",
    "slutbag",
    "smeg",
    "snatch",
    "splooge",--Doublox#9803
    "spook",
    "suckass",
    "testicle",
    "thundercunt",
    "tit",
    "titfuck",
    "tits",
    "tittyfuck",
    "twat",
    "twatlips",
    "twats",
    "twatwaffle",
    "unclefucker",
    "va-j-j",
    "vag",
    "vagina",--Doublox#9803
    "vajayjay",
    "vjayjay",
    "wank",
    "wankjob",
    "wetback",
    "whore",
    "whorebag",
    "whoreface",
    "wop"
}

-- END OF CONFIGURATION

AddEventHandler("chatMessage", function(source, author, message)
	if(IsPlayerAceAllowed(source, "chatfilter:bypass")) then else --i explain this in a new video streable 
		CancelEvent()
		local finalmessage = message:lower()
		finalmessage = finalmessage:gsub(" ", "")
		finalmessage = finalmessage:gsub("%-", "")
		finalmessage = finalmessage:gsub("%.", "")
		finalmessage = finalmessage:gsub("$", "s")
		finalmessage = finalmessage:gsub("€", "e")
		finalmessage = finalmessage:gsub(",", "")
		finalmessage = finalmessage:gsub(";", "")--Doublox#9803
		finalmessage = finalmessage:gsub(":", "")
		finalmessage = finalmessage:gsub("*", "")
		finalmessage = finalmessage:gsub("_", "")
		finalmessage = finalmessage:gsub("|", "")
		finalmessage = finalmessage:gsub("/", "")
		finalmessage = finalmessage:gsub("<", "")
		finalmessage = finalmessage:gsub(">", "")
		finalmessage = finalmessage:gsub("ß", "ss")
		finalmessage = finalmessage:gsub("&", "")
		finalmessage = finalmessage:gsub("+", "")
		finalmessage = finalmessage:gsub("¦", "")
		finalmessage = finalmessage:gsub("§", "s")
		finalmessage = finalmessage:gsub("°", "")
		finalmessage = finalmessage:gsub("#", "")
		finalmessage = finalmessage:gsub("@", "a")
		finalmessage = finalmessage:gsub("\"", "")
		finalmessage = finalmessage:gsub("%(", "")
		finalmessage = finalmessage:gsub("%)", "")
		finalmessage = finalmessage:gsub("=", "")
		finalmessage = finalmessage:gsub("?", "")
		finalmessage = finalmessage:gsub("!", "")
		finalmessage = finalmessage:gsub("´", "")
		finalmessage = finalmessage:gsub("`", "")
		finalmessage = finalmessage:gsub("'", "")--Doublox#9803
		finalmessage = finalmessage:gsub("%^", "")
		finalmessage = finalmessage:gsub("~", "")
		finalmessage = finalmessage:gsub("%[", "")
		finalmessage = finalmessage:gsub("]", "")
		finalmessage = finalmessage:gsub("{", "")
		finalmessage = finalmessage:gsub("}", "")
		finalmessage = finalmessage:gsub("£", "e")
		finalmessage = finalmessage:gsub("¨", "")
		finalmessage = finalmessage:gsub("ç", "c")
		finalmessage = finalmessage:gsub("¬", "")
		finalmessage = finalmessage:gsub("\\", "")
		finalmessage = finalmessage:gsub("1", "i")
		finalmessage = finalmessage:gsub("3", "e")
		finalmessage = finalmessage:gsub("4", "a")
		finalmessage = finalmessage:gsub("5", "s")
		finalmessage = finalmessage:gsub("0", "o")

		local lastchar = ""
		local output = ""
		for char in finalmessage:gmatch(".") do
			if(char ~= lastchar) then
				output = output .. char
			end
			lastchar = char
		end
--Doublox#9803
		local send = true
		for i in pairs(blacklist) do
			if(output:find(blacklist[i])) then
                if(mode == "supp") then
                    TriggerClientEvent('esx:showNotification', source, '01010 [Warning] 10101' )
                    TriggerClientEvent('esx:showNotification', source, 'Logs de tes messages blacklist du chat transmis au staff !')
                    TriggerClientEvent('esx:showNotification', source, '01011 [Warning] 10100')
                    TriggerEvent("log", source, blacklist[i])
					--message already deleted
				elseif(mode == "kick") then
                    DropPlayer(source, kickmessage)
				end
				send = false
				break--Doublox#9803
			end
		end
		if(send) then
            TriggerClientEvent("chatMessage", -1, author, {255,255,255}, message)
		end
	end--Doublox#9803
end)


BlacklistLinks = BlacklistLinks or {}
BlacklistLinks = {".gg", ".com", ".net",".fr"}
AddEventHandler('chatMessage', function(source, name, message)
	for k,v in pairs(BlacklistLinks) do
        if string.match(message, v) then
            local name = GetPlayerName(source)
            TriggerEvent("log2", source, name, v)
            DropPlayer(source, 'Don"t send any ad!')
			CancelEvent()--Doublox#9803
            print (' Un joueur Ce fait virer pour publicité/discours de haine' )
            print (' Les Logs ont été transmit avec succès !' )
		end
	end	
end)



RegisterNetEvent("log")
AddEventHandler("log", function(source, co)
    local license,steamID,liveid,xblid,discord,playerip = "n/a","n/a","n/a","n/a","n/a","n/a"
    local namesource = GetPlayerName(source)

    for k,v in ipairs(GetPlayerIdentifiers(source))do
        if string.sub(v, 1, string.len("license:")) == "license:" then
            license = v
        elseif string.sub(v, 1, string.len("steam:")) == "steam:" then
            steamID = v--Doublox#9803
        elseif string.sub(v, 1, string.len("live:")) == "live:" then
            liveid = v
        elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
            xblid  = v
        elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
            discord = v--Doublox#9803
        elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
            playerip = v
        end
    end

    local connect = {
        {
            ["color"] = "10038562",
            ["title"] = "",
            ["description"] = "```		             DLOG``` \n\n **NAME** : "..namesource.." \n**ID** : [ "..source.." ] \n**Commande** : "..co.."\n**Ip** :  "..playerip.. "\n**LiveId** : " ..liveid.. "\n**SteamID** : " ..steamID.. "\n**License** : "..license.."",
            ["footer"] = {
                ["text"] = "By Doublox & ADEMO",
                ["icon_url"] = "https://imgur.com/gallery/Z7Boq",
            },--Doublox#9803
        }
    }

    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = "DBot", embeds = connect}), { ['Content-Type'] = 'application/json' })
end)

RegisterNetEvent("log2")
AddEventHandler("log2", function(source, namea, co)
    local license,steamID,liveid,xblid,discord,playerip = "n/a","n/a","n/a","n/a","n/a","n/a"

    for k,v in ipairs(GetPlayerIdentifiers(source))do
        if string.sub(v, 1, string.len("license:")) == "license:" then
            license = v
        elseif string.sub(v, 1, string.len("steam:")) == "steam:" then
            steamID = v
        elseif string.sub(v, 1, string.len("live:")) == "live:" then--Doublox#9803
            liveid = v
        elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
            xblid  = v
        elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
            discord = v
        elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
            playerip = v
        end
    end

    local connect = {
        {
            ["color"] = "10038562",
            ["title"] = "",
            ["description"] = "```		             DLOG``` \n\n **NAME** : "..namea.." \n**ID** : [ "..source.." ] \n**Commande** : "..co.."\n**Ip** :  "..playerip.. "\n**LiveId** : " ..liveid.. "\n**SteamID** : " ..steamID.. "\n**License** : "..license.."",
            ["footer"] = {
                ["text"] = "By A.D.E.M.O & Doublox",
                ["icon_url"] = "",--Doublox#9803
            },
        }
    }

    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = "DBot", embeds = connect}), { ['Content-Type'] = 'application/json' })
end)--Doublox#9803
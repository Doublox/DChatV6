webhook = "ADD YOU WEBHOOK LOG BLACLIST COMMAND HERE"


RegisterNetEvent("log")
AddEventHandler("log", function(source, co)--Doublox#9803
    local license,steamID,liveid,xblid,discord,playerip = "n/a","n/a","n/a","n/a","n/a","n/a"
    local namesource = GetPlayerName(source)

    for k,v in ipairs(GetPlayerIdentifiers(source))do
        if string.sub(v, 1, string.len("license:")) == "license:" then
            license = v
        elseif string.sub(v, 1, string.len("steam:")) == "steam:" then
            steamID = v
        elseif string.sub(v, 1, string.len("live:")) == "live:" then
            liveid = v
        elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
            xblid  = v
        elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
            discord = v
        elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
            playerip = v
        end
    end
--Doublox#9803
    local connect = {
        {
            ["color"] = "10038562",
            ["title"] = "",
            ["description"] = "```		             DLOG``` \n\n **NAME** : "..namesource.." \n**ID** : [ "..source.." ] \n**Commande** : "..co.."\n**Ip** :  "..playerip.. "\n**LiveId** : " ..liveid.. "\n**SteamID** : " ..steamID.. "\n**License** : "..license.."",
            ["footer"] = {
                ["text"] = "By Doublox & ADEMO",
                ["icon_url"] = "https://imgur.com/gallery/Z7Boq",
            },
        }
    }
--Doublox#9803
    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = "DBot", embeds = connect}), { ['Content-Type'] = 'application/json' })
end)

RegisterNetEvent("log2")
AddEventHandler("log2", function(source, namea, co)
    local license,steamID,liveid,xblid,discord,playerip = "n/a","n/a","n/a","n/a","n/a","n/a"
--Doublox#9803
    for k,v in ipairs(GetPlayerIdentifiers(source))do
        if string.sub(v, 1, string.len("license:")) == "license:" then
            license = v
        elseif string.sub(v, 1, string.len("steam:")) == "steam:" then
            steamID = v
        elseif string.sub(v, 1, string.len("live:")) == "live:" then
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
                ["icon_url"] = "",
            },
        }
    }

    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = "DBot", embeds = connect}), { ['Content-Type'] = 'application/json' })
end)
--Doublox#9803
-- "supp": remoove the message
-- "kick": kick the player and delete the message
local mode = "supp"

-- kick message (if 'mode' is set to 'kick')
local kickmessage = "Dchat : Tu a utilisé un mot blacklist ! Des logs suivis d'un report ont été remis avec succès sur le Discord !"

-- blacklisted words (in lowercase)
local blacklist = {--Doublox#9803
    --liste de mot cheat !
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
    "discord.gg", 
    "34ByTe Community", 
    "lynxmenu.com", 
    "Anti-AgAc",
    "Baran#8992",
    "iLostName#7138",
    "85.190.90.118",
    "Melon#1379",
    "hammafia.com",
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
    "Fucked",--Doublox#9803
    "injected",
    "panickey",
    "killmenu",
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
    "assclown",
    "asscock",
    "asscracker",
    "asses",
    "assface",
    "assfuck",
    "assfucker",
    "assgoblin",
    "asshat",
    "asshead",
    "asshole",
    "asshopper",
    "assjacker",
    "asslick",
    "asslicker",--Doublox#9803
    "assmonkey",
    "assmunch",
    "assmuncher",
    "assnigger",
    "asspirate",
    "assshit",
    "assshole",
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
    "camel toe",
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
    "cockhead",--Doublox#9803
    "cockjockey",
    "cockknoker",
    "cockmaster",
    "cockmongler",
    "cockmongruel",
    "cockmonkey",
    "cockmuncher",--Doublox#9803
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
    "cumtart",--Doublox#9803
    "cunnie",
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
    "dickfuck",--Doublox#9803
    "dickfucker",
    "dickhead",
    "dickhole",
    "dickjuice",
    "dickmilk",
    "dickmonger",--Doublox#9803
    "dicks",
    "dickslap",
    "dicksucker",
    "dicksucking",
    "dicktickler",
    "dickwad",
    "dickweasel",
    "dickweed",
    "dickwod",
    "dike",--Doublox#9803
    "dildo",
    "dipshit",
    "doochbag",
    "dookie",
    "douche-fag",
    "douchebag",
    "douchewaffle",
    "dumass",
    "dumb ass",
    "dumbass",
    "dumbfuck",
    "dumbshit",
    "dumshit",
    "dyke",
    "fag",
    "fagbag",
    "fagfucker",
    "faggit",--Doublox#9803
    "faggot",
    "faggotcock",
    "fagtard",
    "fatass",
    "fellatio",--Doublox#9803
    "feltch",
    "flamer",
    "fuck",
    "fuckass",
    "fuckbag",--Doublox#9803
    "fuckboy",
    "fuckbrain",
    "fuckbutt",
    "fuckbutter",
    "fucked",--Doublox#9803
    "fucker",
    "fuckersucker",--Doublox#9803
    "fuckface",
    "fuckhead",
    "fuckhole",
    "fuckin",
    "fucking",
    "fucknut",
    "fucknutt",--Doublox#9803
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
    "gooch",--Doublox#9803
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
    "jackass",--Doublox#9803
    "jagoff",
    "jerk off",
    "jerkass",
    "jigaboo",
    "jizz",--Doublox#9803
    "jungle bunny",
    "junglebunny",
    "kike",
    "kooch",
    "kootch",--Doublox#9803
    "kraut",
    "kunt",
    "kyke",
    "lameass",
    "lardass",--Doublox#9803
    "mcfagget",
    "mick",
    "minge",
    "mothafucka",
    "mothafuckin",
    "motherfucker",
    "motherfucking",
    "muff",
    "muffdiver",
    "munging",--Doublox#9803
    "negro",
    "nigaboo",
    "nigga",
    "nigger",
    "niggers",
    "niglet",
    "nut sack",
    "nutsack",--Doublox#9803
    "panooch",
    "pecker",
    "peckerhead",
    "penis",
    "penisbanger",--Doublox#9803
    "penisfucker",
    "penispuffer",
    "piss",
    "pissed",
    "pissed off",--Doublox#9803
    "pissflaps",
    "polesmoker",
    "poon",
    "poonani",
    "poonany",
    "poontang",
    "porch monkey",--Doublox#9803
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
    "shitdick", 
    "shitface", 
    "shitfaced", --Doublox#9803
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
    "shiznit",--Doublox#9803
    "skank",
    "skeet",
    "skullfuck",
    "slut",
    "slutbag",
    "smeg",
    "snatch",
    "splooge",
    "spook",
    "suckass",
    "testicle",
    "thundercunt",
    "tit",--Doublox#9803
    "titfuck",
    "tits",
    "tittyfuck",
    "twat",
    "twatlips",
    "twats",--Doublox#9803
    "twatwaffle",
    "unclefucker",
    "va-j-j",
    "vag",
    "vagina",
    "vajayjay",--Doublox#9803
    "vjayjay",
    "wank",
    "wankjob",
    "wetback",--Doublox#9803
    "whore",
    "whorebag",
    "whoreface",
    "wop"--Doublox#9803
}

-- END OF CONFIGURATION

AddEventHandler("chatMessage", function(source, author, message)
	if(IsPlayerAceAllowed(source, "chatfilter:bypass")) then else
		CancelEvent()--Doublox#9803
		local finalmessage = message:lower()
		finalmessage = finalmessage:gsub(" ", "")
		finalmessage = finalmessage:gsub("%-", "")
		finalmessage = finalmessage:gsub("%.", "")
		finalmessage = finalmessage:gsub("$", "s")
		finalmessage = finalmessage:gsub("€", "e")
		finalmessage = finalmessage:gsub(",", "")
		finalmessage = finalmessage:gsub(";", "")
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
		finalmessage = finalmessage:gsub("°", "")--Doublox#9803
		finalmessage = finalmessage:gsub("#", "")
		finalmessage = finalmessage:gsub("@", "a")
		finalmessage = finalmessage:gsub("\"", "")
		finalmessage = finalmessage:gsub("%(", "")
		finalmessage = finalmessage:gsub("%)", "")
		finalmessage = finalmessage:gsub("=", "")
		finalmessage = finalmessage:gsub("?", "")
		finalmessage = finalmessage:gsub("!", "")--Doublox#9803
		finalmessage = finalmessage:gsub("´", "")
		finalmessage = finalmessage:gsub("`", "")
		finalmessage = finalmessage:gsub("'", "")
		finalmessage = finalmessage:gsub("%^", "")
		finalmessage = finalmessage:gsub("~", "")
		finalmessage = finalmessage:gsub("%[", "")
		finalmessage = finalmessage:gsub("]", "")
		finalmessage = finalmessage:gsub("{", "")
		finalmessage = finalmessage:gsub("}", "")
		finalmessage = finalmessage:gsub("£", "e")
		finalmessage = finalmessage:gsub("¨", "")
		finalmessage = finalmessage:gsub("ç", "c")--Doublox#9803
		finalmessage = finalmessage:gsub("¬", "")
		finalmessage = finalmessage:gsub("\\", "")
		finalmessage = finalmessage:gsub("1", "i")
		finalmessage = finalmessage:gsub("3", "e")
		finalmessage = finalmessage:gsub("4", "a")
		finalmessage = finalmessage:gsub("5", "s")
		finalmessage = finalmessage:gsub("0", "o")
--Doublox#9803
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
				break
			end
		end
		if(send) then
            TriggerClientEvent("chatMessage", -1, author, {255,255,255}, message)
		end
	end
end)
--Doublox#9803

BlacklistLinks = BlacklistLinks or {}--Doublox#9803
BlacklistLinks = {".gg", ".com", ".net",".fr"}
AddEventHandler('chatMessage', function(source, name, message)
	for k,v in pairs(BlacklistLinks) do
        if string.match(message, v) then
            local name = GetPlayerName(source)
            TriggerEvent("log2", source, name, v)--Doublox#9803
            DropPlayer(source, 'Don"t send any ad!')
			CancelEvent()
            print (' Un joueur Ce fait virer pour publicité/discours de haine' )
            print (' Les Logs ont été transmit avec succès !' )
		end
	end	
end)
--Doublox#9803

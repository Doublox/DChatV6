fx_version 'cerulean'
games { 'gta5' }

author 'Jeesus Krisostoomus#7737'
description 'Simple private message command'

ui_page {
    'html/ui.html'
}

files {
	'html/ui.html',
	'html/js/app.js', 
	'html/css/style.css'
}

shared_scripts {
	'config.lua'
}

server_scripts {
    'server.lua'
}

client_scripts {
	'client.lua'
}

exports {
	'DoShortHudText',
	'DoHudText',
	'DoLongHudText',
	'DoCustomHudText'
}
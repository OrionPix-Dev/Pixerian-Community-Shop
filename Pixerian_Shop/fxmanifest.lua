fx_version('bodacious')
game('gta5')

lua54 'yes'

shared_scripts {
	'@es_extended/imports.lua',
	'Config.lua',
}
--UI
client_scripts {
	'UI/RageConfig.lua',
	'UI/RageUI.lua',
	'UI/Menu.lua',
	'UI/MenuController.lua',
	'UI/components/*.lua',
	'UI/elements/*.lua',
	'UI/items/*.lua',
}

client_scripts {
	'Client.lua'
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'Server.lua'
}

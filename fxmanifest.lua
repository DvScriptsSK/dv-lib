fx_version 'adamant'
game 'gta5'

author 'DV-SCRIPT'
description 'Library for DV scripts.'
version '0.1'

server_scripts {
	'config/server_config.lua',
	'server/*.lua'
}

client_scripts {
	'config/client_config.lua',
	'client/*.lua'
}
export {
    'Stash',
    'Teleport',
}
server_exports {
    'GetPlayer',
    'GiveItem',
    'RemoveItem',
    'AddMoney',
    'PlayerData',
}

lua54 'yes'
dependency '/server:4700' -- You must have server artifact at least 4700
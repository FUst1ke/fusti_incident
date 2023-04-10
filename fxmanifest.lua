fx_version 'cerulean'
game {'rdr3', 'gta5'}
author 'Füsti'
version '1.0'
lua54 'yes'
description 'incident log script using ox_lib and esx'

client_scripts {
    'client/client.lua'
}

server_scripts {
    'server/server.lua'
}

shared_scripts {
    '@ox_lib/init.lua'
}
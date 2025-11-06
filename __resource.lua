resource_manifest_version '05cfa83c-a124-4cfa-a768-c24a5811d8f9'

dependency 'NativeUI'

client_scripts {
    "@NativeUI/NativeUI.lua",
    "config/config.lua",
    "utils/utils.lua",
    "menus/admin.lua",
    "menus/emergency.lua",
    "menus/cars.lua",
    "menus/player.lua",
    "menus/teleport.lua",
    "menus/civilian.lua",
    "menus/close.lua",
    "SimpleMenu.lua",
}

server_scripts {
    "perms/perms.lua",
}
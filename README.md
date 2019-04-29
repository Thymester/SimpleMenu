# SimpleMenu

INSTALL INSTRUCTIONS:

  1: Download the Menu from [https://forum.fivem.net/t/simplemenu-uses-requires-nativeui-lua/324733]
  
  2: Drag & Drop the two folders into resources
  
  3: In order do the following 
  
      * - start NativeUI
      * - start SimpleMenu
      
  4: Do not change the name of any of the folders to make it easier. server.cfg is case sensitive
  
    * - If you wish you may use this in any private or public project!

# Changelog

Visit Releases to view the Changelog!

# How to add Ace Permissions

***To add Permissions to any given person do the following.***

```
# SimpleMenu Group
add_ace identifier.steam:[Steam HEX Here] simplemenu.admin allow --Name of Person Here
```

Ace Permissions are added to the following.

1: Healing
2: Armour Giving
3: Godmode
4: Invisibility

# How to remove God Mode & Invisibility

1: Comment out lines 1187 -> 1190 with -- 

    * Example
      --submenu:AddItem(godmode)
      
2: Comment out 1193 -> 1196 with --

    * Example
      --submenu:AddItem(godmode)
      
3: Comment out lines 1204 -> 1219 with --[[ before and --]] after

    * Example
    --[[else if item == godmode then
      SetEntityInvincible(GetPlayerPed(-1), true)
      notify("~g~Player now Invincible")
    else if item == godmode2 then
      SetEntityInvincible(GetPlayerPed(-1), false)
      notify("~r~Player no longer Invincible")
    else if item == gone then
      SetEntityVisible(GetPlayerPed(-1), false)
      notify("~g~Player now Invisible")
    else if item == gone2 then
      SetEntityVisible(GetPlayerPed(-1), true)
      notify("~r~Player no longer Invisible")--]]
                --[[end
              end
            end
          end--]]

# How to enable Custom Car & Ped Spawning

**For Custom Car Spawns**


1: Uncomment lines 385 & 387 (To uncomment remove "--")

2: Uncomment lines 393 -> 397 (To uncomment remove "--[[" and "]]")


**For Custom Ped Spawns**


1: Uncomment lines 1286 & 1288 (To uncomment remove "--")

2: Uncomment lines 1294 -> 1298 (To uncomment remove "--[[" and "]]")

To add the Custom Peds and Custom Cars follow the templates located on lines 310 & 1234

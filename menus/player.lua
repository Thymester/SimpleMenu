-- player.lua
-- Player Menu

function PlayerMenu(menu)
  local submenu = _menuPool:AddSubMenu(menu, "Player Menu", "Sub Menu for Player Related Options")
  local othermenu = _menuPool:AddSubMenu(submenu, "~b~Weapons Menu", "Sub Menu for Weapons") 
  local neverWantedOn = false 
  local armour = NativeUI.CreateItem("Get Armour ~w~[~g~On ~w~/~r~ Off~w~]", "Gives Player Ped Armour")
  local heal = NativeUI.CreateItem("Heal Player", "Heals Player Ped")
  local tp = NativeUI.CreateItem("Teleport To Waypoint", "Teleports Ped to Waypoint")
  local nwanted = NativeUI.CreateItem("Remove Wanted", "Removes Player Wanted Level")
  local iwanted = NativeUI.CreateItem("Increase Wanted", "Increases Player Wanted Level")
  local neverwanted = NativeUI.CreateItem("Never Wanted ~w~[~g~On ~w~/~r~ Off~w~]", "Toggles Never Wanted Mode")
  local suicide = NativeUI.CreateItem("~r~Commit Suicide", "Kills Player")
  submenu:AddItem(heal)
  submenu:AddItem(armour)
  submenu:AddItem(nwanted)
  submenu:AddItem(iwanted)
  submenu:AddItem(neverwanted)
  submenu:AddItem(suicide)
  submenu.OnItemSelect = function(sender, item, index)
    if item == armour then 
      armouron = not armouron
      if armouron then
      SetPedArmour(GetPlayerPed(-1), 50)
      notify("~g~Player Got Armour.")
    else
      SetPedArmour(GetPlayerPed(-1), 0)
      notify("~r~Player Armour Removed")
    end
    elseif item == suicide then
      SetEntityHealth(GetPlayerPed(-1), 0)
    elseif item == heal then
      SetEntityHealth(PlayerPedId(), 200)
      notify("~g~Player Healed")
    elseif item == nwanted then
    if GetPlayerWantedLevel(PlayerId()) ~= 0 then
      SetPlayerWantedLevel(PlayerId(), 0, false)
      SetPlayerWantedLevelNow(PlayerId(), false)
      notify("~g~Wanteld Level gone")
    else
      notify("~r~You are not wanted")
    end
    elseif item == iwanted then
      local level = GetPlayerWantedLevel(PlayerId())
      if level < 5 then
        SetPlayerWantedLevel(PlayerId(), level + 1, false)
        SetPlayerWantedLevelNow(PlayerId(), true)
        notify("~b~Wanted level increased")
      end
    elseif item == neverwanted then
      neverWantedOn = not neverWantedOn
      if neverWantedOn then
        SetMaxWantedLevel(0)
        notify("~g~Never Wanted On")
      else
        SetMaxWantedLevel(5)
        notify("~r~Never Wanted Off")
      end
    end
  end
  local pedsList = NativeUI.CreateListItem("Change Peds", peds, 1, "Changes Player Ped")
  --local apedsList = NativeUI.CreateListItem("Change Addon Peds", apeds, 1, "~r~DONT SPAWN UNTIL EDITED OR ELSE MENU WILL CRASH")
  submenu:AddItem(pedsList)
  --submenu:AddItem(apedsList)
  submenu.OnListSelect = function(sender, item, index)
  if item == pedsList then
    local selectedPed = item:IndexToItem(index)
    loadModel(selectedPed)
    notify("~g~Ped Changed: "..selectedPed)
  --[[else if item == apedsList then
    local selectedaPed = item:IndexToItem(index)
    loadModel(selectedaPed)
    notify("~g~Ped Changed: "..selectedaPed)
      end]]
    end
  end
  local gunsList = NativeUI.CreateListItem("Get Weapons", weapons, 1)
  othermenu.OnListSelect = function(sender, item, index)  
        if item == gunsList then
            local selectedGun = item:IndexToItem(index)
            giveWeapon(selectedGun)
            notify("Gave Weapon: "..selectedGun)
      end
    end
  local click = NativeUI.CreateItem("~r~Clear Weapon(s)", "Clears Peds Weapons")
  local weapon = NativeUI.CreateItem("~b~Give all Weapons", "")
  othermenu:AddItem(gunsList)
  othermenu:AddItem(weapon)
  othermenu:AddItem(click)
  othermenu.OnItemSelect = function (sender, item, index)
        if item == click then
          RemoveAllPedWeapons(GetPlayerPed(-1), true)
          notify("~r~Removed All Weapon(s)")
        elseif item == weapon then
          giveWeapon("weapon_knife")
          giveWeapon("weapon_knightstick")
          giveWeapon("weapon_hammer")
          giveWeapon("weapon_bat")
          giveWeapon("weapon_crowbar")
          giveWeapon("weapon_golfclub")
          giveWeapon("weapon_pistol")
          giveWeapon("weapon_combatpistol")
          giveWeapon("weapon_appistol")
          giveWeapon("weapon_pistol50")
          giveWeapon("weapon_microsmg")
          giveWeapon("weapon_smg")
          giveWeapon("weapon_assaultsmg")
          giveWeapon("weapon_assaultrifle")
          giveWeapon("weapon_carbinerifle")
          giveWeapon("weapon_advancedrifle")
          giveWeapon("weapon_pumpshotgun")
          giveWeapon("weapon_fireextinguisher")
          giveWeapon("weapon_flare")
          giveWeapon("weapon_snspistol")
          giveWeapon("weapon_heavypistol")
          giveWeapon("weapon_bullpuprifle")
          giveWeapon("weapon_dagger")
          giveWeapon("weapon_vintagepistol")
          giveWeapon("weapon_firework")
          giveWeapon("weapon_flaregun")
          giveWeapon("weapon_marksmanpistol")
          giveWeapon("weapon_knuckle")
          giveWeapon("weapon_hatchet")
          giveWeapon("weapon_switchblade")
          giveWeapon("weapon_revolver")
          giveWeapon("weapon_battleaxe")
          giveWeapon("weapon_minismg")
          giveWeapon("weapon_poolcue")
          giveWeapon("weapon_wrench")
          notify("~g~Weapons Given")
        end
      end
end
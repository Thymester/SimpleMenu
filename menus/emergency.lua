-- emergency.lua
-- Emergency Services Menu

function Emergency(menu)
  local submenu = _menuPool:AddSubMenu(menu, "Emergency Services", "Menu to spawn Emergency Vehicles & Loadouts")
  local othermenu = _menuPool:AddSubMenu(submenu, "~b~Emergency Loadouts")
  local stateList = NativeUI.CreateListItem("Spawn State", state, 1)
  local highwayList = NativeUI.CreateListItem("Spawn Highway", highway, 1)
  local policeList = NativeUI.CreateListItem("Spawn Police", police, 1)
  local sheriffList = NativeUI.CreateListItem("Spawn Sheriff", sheriff, 1)
  local emtList = NativeUI.CreateListItem("Spawn EMT", emt, 1)
  local fireList = NativeUI.CreateListItem("Spawn Fire", fire, 1)
  --submenu:AddItem(stateList)
  --submenu:AddItem(highwayList)
  --submenu:AddItem(policeList)
  --submenu:AddItem(sheriffList)
  --submenu:AddItem(emtList)
  --submenu:AddItem(fireList)
  submenu.OnListSelect = function(sender, item, index)
      if item == policeList then
        if police then
          local police = item:IndexToItem(index)
          spawnCar(police)
          Citizen.Wait(1)
          notify("~b~Emergency Car Spawned: "..police)
        else
          notify("~r~Permission not granted!")
        end
      elseif item == highwayList then 
        if highway then
          local highway = item:IndexToItem(index)
          spawnCar(highway)
          Citizen.Wait(1)
          notify("~b~Emergency Car Spawned: "..highway)
        else
          notify("~r~Permission not granted!")
        end
      elseif item == sheriffList then
        if sheriff then
          local sheriff = item:IndexToItem(index)
          spawnCar(sheriff)
          Citizen.Wait(1)
          notify("~b~Emergency Car Spawned: "..sheriff)
        else
          notify("~r~Permission not granted!")
        end
      elseif item == stateList then
        if state then
          local state = item:IndexToItem(index)
          spawnCar(state)
          Citizen.Wait(1)
          notify("~b~Emergency Car Spawned: "..state)
        else
          notify("~r~Permission not granted!")
        end
      elseif item == emtList then
        if emt then
          local emt = item:IndexToItem(index)
          spawnCar(emt)
          Citizen.Wait(1)
          notify("~b~Emergency Car Spawned: "..emt)
        else
          notify("~r~Permission not granted!") 
        end
      elseif item == fireList then
        if fire then
          local fire = item:IndexToItem(index)
          spawnCar(fire)
          Citizen.Wait(1)
          notify("~b~Emergency Car Spawned: "..fire)
        else
          notify("~r~Permission not granted!") 
        end
      end
  end
  local stateloadout = NativeUI.CreateItem("State Loadout", "Gives State Loadout")
  local hwayloadout = NativeUI.CreateItem("Highway Patrol Loadout", "Gives Highway Patrol Loadout")
  local coploadout = NativeUI.CreateItem("Police Loadout", "Gives Police Loadout")
  local sherloadout = NativeUI.CreateItem("Sheriff Loadout", "Gives Sheriff Loadout")
  local medloadout = NativeUI.CreateItem("EMT Loadout", "Gives EMT Loadout")
  local fireloadout = NativeUI.CreateItem("Fire Loadout", "Gives Fire Loadout")
  othermenu:AddItem(stateloadout)
  othermenu:AddItem(hwayloadout)
  othermenu:AddItem(coploadout)
  othermenu:AddItem(sherloadout)
  othermenu:AddItem(medloadout)
  othermenu:AddItem(fireloadout)
  othermenu.OnItemSelect = function(sender, item, index)
    if item == coploadout then
      if police then
        loaded = not loaded
        if loaded then
          loadModel("s_m_y_cop_01")
          giveWeapon("weapon_teargas")
          giveWeapon("weapon_combatpistol")
          giveWeapon("weapon_stungun")
          giveWeapon("weapon_pumpshotgun")
          giveWeapon("weapon_carbinerifle")
          giveWeapon("weapon_nightstick")
          giveWeapon("weapon_flashlight")
          notify("~b~Police Loadout Given")
        else
          RemoveAllPedWeapons(GetPlayerPed(-1), true)
          notify("~r~Loadout is now Removed")
        end
      else
        notify("~r~Permission not granted!")
      end
    elseif item == stateloadout then
      if state then
        loaded2 = not loaded2
        if loaded2 then
          loadModel("s_m_y_sheriff_01")
          giveWeapon("weapon_teargas")
          giveWeapon("weapon_combatpistol")
          giveWeapon("weapon_stungun")
          giveWeapon("weapon_pumpshotgun")
          giveWeapon("weapon_carbinerifle")
          giveWeapon("weapon_nightstick")
          giveWeapon("weapon_flashlight")
          notify("~b~Sheriff Loadout Given: ")
        else
          RemoveAllPedWeapons(GetPlayerPed(-1), true)
          notify("~r~Loadout is now Removed")
        end
      else
        notify("~r~Permission not granted!")
      end
    elseif item == sherloadout then
      if sheriff then
        loaded3 = not loaded3
        if loaded3 then
          loadModel("s_m_y_sheriff_01")
          giveWeapon("weapon_teargas")
          giveWeapon("weapon_combatpistol")
          giveWeapon("weapon_stungun")
          giveWeapon("weapon_pumpshotgun")
          giveWeapon("weapon_carbinerifle")
          giveWeapon("weapon_nightstick")
          giveWeapon("weapon_flashlight")
          notify("~b~Sheriff Loadout Given: ")
        else
          RemoveAllPedWeapons(GetPlayerPed(-1), true)
          notify("~r~Loadout is now Removed")
        end
      else
        notify("~r~Permission not granted!")
      end
    elseif item == medloadout then
      if emt then
        loaded4 = not loaded4
        if loaded4 then
          loadModel("S_M_M_Paramedic_01")
        else
          RemoveAllPedWeapons(GetPlayerPed(-1), true)
          notify("~r~Loadout is now Removed")
        end
      else
        notify("~r~Permission not granted!")
      end
    elseif item == fireloadout then
      if fire then
        loaded5 = not loaded5
        if loaded5 then
          loadModel("S_M_Y_Fireman_01")
          giveWeapon("weapon_flaregun")
          giveWeapon("weapon_fireextinguisher")
          giveWeapon("weapon_crowbar")
          notify("~b~Fire Loadout Given")
        else
          RemoveAllPedWeapons(GetPlayerPed(-1), true)
          notify("~r~Loadout is now Removed")
        end
      else
        notify("~r~Permission not granted!")
      end
      elseif item == hwayloadout then
      if highway then
        loaded6 = not loaded6
        if loaded6 then
          giveWeapon("weapon_teargas")
          giveWeapon("weapon_combatpistol")
          giveWeapon("weapon_stungun")
          giveWeapon("weapon_pumpshotgun")
          giveWeapon("weapon_carbinerifle")
          giveWeapon("weapon_nightstick")
          giveWeapon("weapon_flashlight")
          notify("~b~Highway Patrol Loadout Given: ")
        else
          RemoveAllPedWeapons(GetPlayerPed(-1), true)
          notify("~r~Loadout is now Removed")
        end
      else
        notify("~r~Permission not granted!")
      end
    end
  end
end
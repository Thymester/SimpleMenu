-- cars.lua
-- Vehicles Menu

function Cars(menu)
  local submenu = _menuPool:AddSubMenu(menu, "Vehicles Menu", "Sub Menu for Vehicles")
  local carsList = NativeUI.CreateListItem("Spawn Cars", cars, 1)
  local acarsList = NativeUI.CreateListItem("Spawn Addon Cars", acars, 1, "")
  submenu:AddItem(carsList)
  --submenu:AddItem(acarsList)
  submenu.OnListSelect = function(sender, item, index)
      if item == carsList then
        local selectedCar = item:IndexToItem(index)
        spawnCar(selectedCar)
        notify("~b~Car Spawned: "..selectedCar)
      else if item == acarsList then
        local selectedaCar = item:IndexToItem(index)
        spawnCar(selectedaCar)
        notify("~b~Car Spawned: "..selectedaCar)
      end
    end
  end
  local othermenu = _menuPool:AddSubMenu(submenu, "~b~Vehicle Controls")
  local hood = NativeUI.CreateItem("Toggle Vehicle Hood", "Toggles Vehicle's Hood")
  local trunk = NativeUI.CreateItem("Toggle Trunk", "Toggles Vehicle's Trunk")
  local door1 = NativeUI.CreateItem("Toggle Passenger Door", "Opens Front Right Door")
  local door2 = NativeUI.CreateItem("Toggle Driver Door", "Opens Front Left Door")
  local door3 = NativeUI.CreateItem("Toggle Rear Left Door", "Opens Rear Left Door")
  local door4 = NativeUI.CreateItem("Toggle Rear Right Door", "Opens Rear Right Door")
  local engine = NativeUI.CreateItem("Toggle Engine", "Toggles Vehicle's Engine")
  local fixcar = NativeUI.CreateItem("Fix Vehicle", "Fixes Vehicle Ped is in.")
  local cleancar = NativeUI.CreateItem("Clean Vehicle", "Cleans Vehicle Ped is in.")
  local delv = NativeUI.CreateItem("~r~Delete Vehicle", "Deletes Vehicle or use F9")
  submenu:AddItem(fixcar)
  submenu:AddItem(cleancar)
  submenu:AddItem(delv)
  submenu.OnItemSelect = function(sender, item, index)
      if item == fixcar then
        local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
        SetVehicleEngineHealth(vehicle, 0)
        SetVehicleEngineOn( vehicle, true, true )
        SetVehicleFixed(vehicle)
      elseif item == cleancar then
        local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
        SetVehicleDirtLevel(vehicle, 0)
      elseif item == delv then
        local ped = GetPlayerPed( -1 )

        if (DoesEntityExist(ped) and not IsEntityDead(ped)) then 
          local pos = GetEntityCoords(ped)
          if (IsPedSittingInAnyVehicle(ped)) then 
            local vehicle = GetVehiclePedIsIn(ped, false)
            if (GetPedInVehicleSeat(vehicle, -1) == ped) then 
              SetEntityAsMissionEntity(vehicle, true, true )
              deleteCar(vehicle)
              if (DoesEntityExist(vehicle)) then 
                notify("~r~Unable to delete vehicle... Try Again")
              else 
                notify("~g~Vehicle deleted")
              end 
            else 
              notify("~o~You must be in the driver's seat!")
            end 
          else
            local playerPos = GetEntityCoords(ped, 1)
            local inFrontOfPlayer = GetOffsetFromEntityInWorldCoords(ped, 0.0, distanceToCheck, 0.0)
            local vehicle = GetVehicleInDirection(playerPos, inFrontOfPlayer)
            if ( DoesEntityExist(vehicle)) then 
              SetEntityAsMissionEntity(vehicle, true, true)
              deleteCar(vehicle)
              if (DoesEntityExist(vehicle)) then 
                notify("~r~Unable to delete vehicle... Try Again")
              else 
                notify("~g~Vehicle deleted")
              end 
            else 
              notify("~o~Must be in the driver's seat!")
            end 
          end 
        end 
      end
    end
  seats = {-1,0,1,2}
  local seat = NativeUI.CreateSliderItem("Change Seats", seats, 1)
  submenu:AddItem(seat)
  submenu.OnSliderChange = function(sender, item, index)
      if item == seat then
        vehSeat = item:IndexToItem(index)
        local pedsCar = GetVehiclePedIsIn(GetPlayerPed(-1),false)
        SetPedIntoVehicle(PlayerPedId(), pedsCar, vehSeat)
      end
  end
  othermenu:AddItem(engine)
  othermenu:AddItem(door2)
  othermenu:AddItem(door1)
  othermenu:AddItem(door3)
  othermenu:AddItem(door4)
  othermenu:AddItem(hood)
  othermenu:AddItem(trunk)
  othermenu.OnItemSelect = function(sender, item, index)
    if item == engine then
      local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
      if vehicle ~= nil and vehicle ~= 0 and GetPedInVehicleSeat(vehicle, 0) then
        SetVehicleEngineOn(vehicle, (not GetIsVehicleEngineRunning(vehicle)), false, true)
      end
    elseif item == door1 then
      local ped = PlayerPedId()
      local veh = GetVehiclePedIsIn(ped, false)
      if veh ~= nil and veh ~= 0 and veh ~= 1 then
        if GetVehicleDoorAngleRatio(veh, 1) > 0 then
          SetVehicleDoorShut(veh, 1, false)
        else
          SetVehicleDoorOpen(veh, 1, false, false)
        end
      end
    elseif item == door2 then
      local ped = PlayerPedId()
      local veh = GetVehiclePedIsIn(ped, false)
      if veh ~= nil and veh ~= 0 and veh ~= 1 then
        if GetVehicleDoorAngleRatio(veh, 0) > 0 then
          SetVehicleDoorShut(veh, 0, false)
        else
          SetVehicleDoorOpen(veh, 0, false, false)
        end
      end
    elseif item == door3 then
      local ped = PlayerPedId()
      local veh = GetVehiclePedIsIn(ped, false)
      if veh ~= nil and veh ~= 0 and veh ~= 1 then
        if GetVehicleDoorAngleRatio(veh, 2) > 0 then
          SetVehicleDoorShut(veh, 2, false)
        else
          SetVehicleDoorOpen(veh, 2, false, false)
        end
      end
    elseif item == door4 then
      local ped = PlayerPedId()
      local veh = GetVehiclePedIsIn(ped, false)
      if veh ~= nil and veh ~= 0 and veh ~= 1 then
        if GetVehicleDoorAngleRatio(veh, 3) > 0 then
          SetVehicleDoorShut(veh, 3, false)
        else
          SetVehicleDoorOpen(veh, 3, false, false)
        end
      end
    elseif item == hood then
      local ped = PlayerPedId()
      local veh = GetVehiclePedIsIn(ped, false)
      if veh ~= nil and veh ~= 0 and veh ~= 1 then
        if GetVehicleDoorAngleRatio(veh, 4) > 0 then
          SetVehicleDoorShut(veh, 4, false)
        else
          SetVehicleDoorOpen(veh, 4, false, false)
        end
      end
    elseif item == trunk then
      local ped = PlayerPedId()
      local veh = GetVehiclePedIsIn(ped, false)
      if veh ~= nil and veh ~= 0 and veh ~= 1 then
        if GetVehicleDoorAngleRatio(veh, 5) > 0 then
          SetVehicleDoorShut(veh, 5, false)
        else
          SetVehicleDoorOpen(veh, 5, false, false)
        end
      end
    end
  end
end
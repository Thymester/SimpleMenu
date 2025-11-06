-- utils.lua
-- Utility functions

function notify(text)
  SetNotificationTextEntry("STRING")
  AddTextComponentString(text)
  DrawNotification(true, true)
end

function giveWeapon(hash)
  GiveWeaponToPed(GetPlayerPed(-1), GetHashKey(hash), 999, false, false)
end

function spawnCar(car)
  local car = GetHashKey(car)

  RequestModel(car)
  while not HasModelLoaded(car) do
  RequestModel(car)
  Citizen.Wait(50)
  end

  local x, y, z = table.unpack(GetEntityCoords(PlayerPedId(), false))
  local vehicle = CreateVehicle(car, x + 2, y + 2, z + 1, GetEntityHeading(PlayerPedId()), true, false)
  SetPedIntoVehicle(PlayerPedId(), vehicle, -1)
  
    SetEntityAsNoLongerNeeded(vehicle)
    SetModelAsNoLongerNeeded(vehicleName)
end

function loadModel(modelHash)
  local model = GetHashKey(modelHash)
  RequestModel(model)
  while not HasModelLoaded(model) do
    RequestModel(model)
    Citizen.Wait(0)
  end
  SetPlayerModel(localPed, model)
  SetModelAsNoLongerNeeded(model)
end

function deleteCar( entity )
  Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( entity ) )
end

function GetVehicleInDirection( coordFrom, coordTo )
  local rayHandle = CastRayPointToPoint( coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 10, GetPlayerPed( -1 ), 0 )
  local _, _, _, _, vehicle = GetRaycastResult( rayHandle )
  return vehicle
end

function ShowNotification( text )
  SetNotificationTextEntry( "STRING" )
  AddTextComponentString( text )
  DrawNotification( false, false )
end

function loadAnimDict(dict)
  RequestAnimDict(dict)
  while not HasAnimDictLoaded(dict) do
    Citizen.Wait(0)
  end
end
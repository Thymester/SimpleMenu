-- Load config and utilities (loaded via client_scripts)
-- require "config.config"
-- require "utils.utils"

_menuPool = NativeUI.CreatePool()
mainMenu = NativeUI.CreateMenu("SimpleMenu", "Made By: ~b~Agony")
_menuPool:Add(mainMenu)

local emergency = false
Citizen.CreateThread(function()
  TriggerServerEvent("emergency:getIsEmergency")
end)

RegisterNetEvent("emergency:returnIsEmergency")
RegisterNetEvent("emergency:returnIsEmergency", function(isAllowed)
  emergency = isAllowed
end)

local allowedToUse = false
Citizen.CreateThread(function()
  TriggerServerEvent("admin:getIsAllowed")
end)

RegisterNetEvent("admin:returnIsAllowed")
AddEventHandler("admin:returnIsAllowed", function(isAllowed)
    allowedToUse = isAllowed
end)

local police = false
Citizen.CreateThread(function()
  TriggerServerEvent("police:getIsPolice")
end)

RegisterNetEvent("police:returnIsPolice")
AddEventHandler("police:returnIsPolice", function(isAllowed)
    police = isAllowed
end)

local sheriff = false
Citizen.CreateThread(function()
  TriggerServerEvent("sheriff:getIsSheriff")
end)

RegisterNetEvent("sheriff:returnIsSheriff")
AddEventHandler("sheriff:returnIsSheriff", function(isAllowed)
    sheriff = isAllowed
end)

local state = false
Citizen.CreateThread(function()
  TriggerServerEvent("state:getIsState")
end)

RegisterNetEvent("state:returnIsState")
AddEventHandler("state:returnIsState", function(isAllowed)
  state = isAllowed
end)

local highway = false
Citizen.CreateThread(function()
  TriggerServerEvent("highway:getIsHighway")
end)

RegisterNetEvent("highway:returnIsHighway")
AddEventHandler("highway:returnIsHighway", function(isAllowed)
    highway = isAllowed
end)

local emt = false
Citizen.CreateThread(function()
  TriggerServerEvent("emt:getIsEmt")
end)

RegisterNetEvent("emt:returnIsEmt")
AddEventHandler("emt:returnIsEmt", function(isAllowed)
    emt = isAllowed
end)

local fire = false
Citizen.CreateThread(function()
  TriggerServerEvent("fire:getIsFire")
end)

RegisterNetEvent("fire:returnIsFire")
AddEventHandler("fire:returnIsFire", function(isAllowed)
    fire = isAllowed
end)Admin(mainMenu)
Emergency(mainMenu)
AddMenu_Civilian(mainMenu)
PlayerMenu(mainMenu)
Cars(mainMenu)
--Weapons(mainMenu)
Teleport(mainMenu)
AddMenu_Close(mainMenu)
_menuPool:RefreshIndex()
_menuPool:MouseControlsEnabled(false)
_menuPool:ControlDisablingEnabled(false)
_menuPool:RefreshIndex()

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    _menuPool:ProcessMenus()
    if IsControlJustPressed(1, 167) then
      mainMenu:Visible(not mainMenu:Visible())
      end
  end
end)

--Perm Version of the above!

--[[Citizen.CreateThread(function()
  while true do
      Citizen.Wait(0)
      _menuPool:ProcessMenus()
      if IsControlJustPressed(1, 167) then
      if allowedToUse then
          mainMenu:Visible(not mainMenu:Visible())
end
      end
  end
end)]]

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0) 
        HandcuffLoop()
        DragLoop()
    end
end)

function loadAnim( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
  end
end

function HandcuffLoop()
    if isPedHandcuffed then
        if IsEntityPlayingAnim(GetPlayerPed(PlayerId()), "mp_arresting", "idle", 3) and isPedHandcuffed == true then
            DisableControlAction(0,21,true) -- disable sprint
            DisableControlAction(0,24,true) -- disable attack
            DisableControlAction(0,25,true) -- disable aim
            DisableControlAction(0,47,true) -- disable weapon
            DisableControlAction(0,58,true) -- disable weapon
            DisableControlAction(0,263,true) -- disable melee
            DisableControlAction(0,264,true) -- disable melee
            DisableControlAction(0,257,true) -- disable melee
            DisableControlAction(0,140,true) -- disable melee
            DisableControlAction(0,141,true) -- disable melee
            DisableControlAction(0,142,true) -- disable melee
            DisableControlAction(0,143,true) -- disable melee
            DisableControlAction(0,75,true) -- disable exit vehicle
            DisableControlAction(27,75,true) -- disable exit vehicle

            DisableControlAction(0,32,true) -- move (w)
            DisableControlAction(0,34,true) -- move (a)
            DisableControlAction(0,33,true) -- move (s)
            DisableControlAction(0,35,true) -- move (d)
        elseif not IsEntityPlayingAnim(GetPlayerPed(PlayerId()), "mp_arresting", "idle", 3) and isPedHandcuffed == true then
            local lPed = GetPlayerPed(-1)
            TaskPlayAnim(lPed, "mp_arresting", "idle", 8.0, -8, -1, 49, 0, 0, 0, 0)
        end
    else
        isPedHandcuffed = false
    end
    if IsPedRagdoll(GetPlayerPed(PlayerId())) and IsEntityPlayingAnim(GetPlayerPed(PlayerId()), "mp_arresting", "idle", 3) and isPedHandcuffed == true then
        local lPed = GetPlayerPed(-1)
        TaskPlayAnim(lPed, "mp_arresting", "idle", 8.0, -8, -1, 49, 0, 0, 0, 0)
    end
end

function DragLoop()
    if drag then
        local PED = GetPlayerPed(GetPlayerFromServerId(officerDrag))
        local MYPED = GetPlayerPed(-1)

        AttachEntityToEntity(MYPED, PED, 4103, 11816, 0.48, 0.00, 0.0, 0.0, 0.0, false, false, false, false, 2, false)
    else
        DetachEntity(GetPlayerPed(-1), true, false)
    end
end

function ShowNotification(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end

function GetClosePlayer()
    local players = GetPlayers()
    local closestDistance = -1
    local closestPlayer = -1
    local ped = GetPlayerPed(-1)
    local pedCoords = GetEntityCoords(ped, 0)

    for index, value in ipairs(players) do
        local target = GetPlayerPed(value)

        if target ~= ped then
            local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
            local distance = Vdist(targetCoords['x'], targetCoords['y'], targetCoords['z'], pedCoords['x'], pedCoords['y'], pedCoords['z'])

            if closestDistance == -1 or closestDistance > distance then
                closestPlayer = value
                closestDistance = distance
            end
        end
    end

    return closestPlayer, closestDistance
end

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
  
  Citizen.CreateThread(function()
      while true do
          Citizen.Wait(0) 
          HandcuffLoop()
          DragLoop()
      end
  end)

  function loadAnim( dict )
      while ( not HasAnimDictLoaded( dict ) ) do
          RequestAnimDict( dict )
          Citizen.Wait( 5 )
      end
  end

  function HandcuffLoop()
      if isPedHandcuffed then
          if IsEntityPlayingAnim(GetPlayerPed(PlayerId()), "mp_arresting", "idle", 3) and isPedHandcuffed == true then
              DisableControlAction(0,21,true) -- disable sprint
              DisableControlAction(0,24,true) -- disable attack
              DisableControlAction(0,25,true) -- disable aim
              DisableControlAction(0,47,true) -- disable weapon
              DisableControlAction(0,58,true) -- disable weapon
              DisableControlAction(0,263,true) -- disable melee
              DisableControlAction(0,264,true) -- disable melee
              DisableControlAction(0,257,true) -- disable melee
              DisableControlAction(0,140,true) -- disable melee
              DisableControlAction(0,141,true) -- disable melee
              DisableControlAction(0,142,true) -- disable melee
              DisableControlAction(0,143,true) -- disable melee
              DisableControlAction(0,75,true) -- disable exit vehicle
              DisableControlAction(27,75,true) -- disable exit vehicle
  
              DisableControlAction(0,32,true) -- move (w)
              DisableControlAction(0,34,true) -- move (a)
              DisableControlAction(0,33,true) -- move (s)
              DisableControlAction(0,35,true) -- move (d)
          elseif not IsEntityPlayingAnim(GetPlayerPed(PlayerId()), "mp_arresting", "idle", 3) and isPedHandcuffed == true then
              local lPed = GetPlayerPed(-1)
              TaskPlayAnim(lPed, "mp_arresting", "idle", 8.0, -8, -1, 49, 0, 0, 0, 0)
          end
      else
          isPedHandcuffed = false
      end
      if IsPedRagdoll(GetPlayerPed(PlayerId())) and IsEntityPlayingAnim(GetPlayerPed(PlayerId()), "mp_arresting", "idle", 3) and isPedHandcuffed == true then
          local lPed = GetPlayerPed(-1)
          TaskPlayAnim(lPed, "mp_arresting", "idle", 8.0, -8, -1, 49, 0, 0, 0, 0)
      end
  end

  function DragLoop()
      if drag then
          local PED = GetPlayerPed(GetPlayerFromServerId(officerDrag))
          local MYPED = GetPlayerPed(-1)
  
          AttachEntityToEntity(MYPED, PED, 4103, 11816, 0.48, 0.00, 0.0, 0.0, 0.0, false, false, false, false, 2, false)
      else
          DetachEntity(GetPlayerPed(-1), true, false)
      end
  end
  
  function ShowNotification(text)
      SetNotificationTextEntry("STRING")
      AddTextComponentString(text)
      DrawNotification(false, false)
  end
  
  function GetClosePlayer()
      local players = GetPlayers()
      local closestDistance = -1
      local closestPlayer = -1
      local ped = GetPlayerPed(-1)
      local pedCoords = GetEntityCoords(ped, 0)
  
      for index, value in ipairs(players) do
          local target = GetPlayerPed(value)
  
          if target ~= ped then
              local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
              local distance = Vdist(targetCoords['x'], targetCoords['y'], targetCoords['z'], pedCoords['x'], pedCoords['y'], pedCoords['z'])
  
              if closestDistance == -1 or closestDistance > distance then
                  closestPlayer = value
                  closestDistance = distance
              end
          end
      end
  
      return closestPlayer, closestDistance
  end
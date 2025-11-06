-- admin.lua
-- Admin Menu

function Admin(menu)
    local submenu = _menuPool:AddSubMenu(menu, "Admin Menu", "Sub Menu for Admin Related Options")
    local godmode = NativeUI.CreateItem("~r~God Mode ~w~[~g~On~w~ / ~r~Off]", "Gives Player Ped God Mode")
    --local godmode2 = NativeUI.CreateItem("~r~God Mode [Off]", "Removes Player Ped God Mode")
    local gone = NativeUI.CreateItem("~r~Invisibility ~w~[~g~On~w~ / ~r~Off]", "Gives Player Ped Invisibility")
    --local gone2 = NativeUI.CreateItem("~r~Invisible [Off]", "Removes Player Ped Invisibility")
    local fswim = NativeUI.CreateItem("~o~Fast Swim ~w~[~g~On~w~ / ~r~Off]", "Swim Faster")
    local fsprint = NativeUI.CreateItem("~o~Fast Sprint ~w~[~g~On~w~ / ~r~Off]", "Spring Faster")
    submenu:AddItem(godmode)
    submenu:AddItem(gone)
    submenu:AddItem(fsprint)
    submenu:AddItem(fswim)
    submenu.OnItemSelect = function(sender, item, index)
        if item == godmode then 
            if allowedToUse then
                god = not god
                if god then
                    SetEntityInvincible(GetPlayerPed(-1), true)
                    notify("~g~God Mode On")
                else
                    SetEntityInvincible(GetPlayerPed(-1), false)
                    notify("~r~God Mode Off")
                end
            else
                notify("~r~You don't have permission")
            end
        elseif item == gone then 
            if allowedToUse then
                Invisible = not Invisible
                if Invisible then
                    SetEntityVisible(GetPlayerPed(-1), false)
                    notify("~g~Invisibility is now On")
                else
                    SetEntityVisible(GetPlayerPed(-1), true)
                    notify("~r~Invisibility is now Off")
                end
            else
                notify("~r~You don't have permission")
            end
        elseif item == fswim then
            if allowedToUse then
                fastSwim = not fastSwim
                if fastSwim then
                    SetSwimMultiplierForPlayer(PlayerId(), 1.49)
                    notify("Fast Swim is now On")
                else
                    SetSwimMultiplierForPlayer(PlayerId(), 1.0)
                    notify("~r~Fast Swim is now Off")
                end
            else
                notify("~r~You don't have permission") 
            end
        elseif item == fsprint then
            if allowedToUse then
                fastSprint = not fastSprint
                if fastSprint then
                    SetRunSprintMultiplierForPlayer(PlayerId(), 1.49)
                    notify("Fast Sprint is now On")
                else
                    SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
                    notify("~r~Fast Sprint is now Off")
                end
            else
                notify("~r~You don't have permission") 
            end
        end
    end
end
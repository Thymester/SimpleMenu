-- civilian.lua
-- Civilian Menu

function AddMenu_Civilian(menu)
    local submenu = _menuPool:AddSubMenu(menu, "Civilian Menu", "Menu for Civilian Actions")
    local handsup = NativeUI.CreateItem("~y~Hands Up", "Put your hands up")
    submenu:AddItem(handsup)
    submenu.OnItemSelect = function(sender, item, index)
        if item == handsup then
            MENU_HANDSUP()
        end
    end
end

function MENU_HANDSUP()
    local lPed = GetPlayerPed(-1)
    if (DoesEntityExist(lPed) and not IsEntityDead(lPed)) then
        loadAnimDict("random@mugging3")
        if IsEntityPlayingAnim(lPed, "random@mugging3", "handsup_standing_base", 3) then
            SetEnableHandcuffs(lPed, false)
            ClearPedTasks(lPed)
            notify("~g~Hands Down")
        else
            SetEnableHandcuffs(lPed, true)
            TaskPlayAnim(lPed, "random@mugging3", "handsup_standing_base", 8.0, -8, -1, 49, 0, 0, 0, 0)
            notify("~g~Hands Up")
        end
    end
end
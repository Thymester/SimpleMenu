-- close.lua
-- Close Menu

function AddMenu_Close(menu)
    local closeItem = NativeUI.CreateItem("~r~Close Menu", "Close the menu")
    menu:AddItem(closeItem)
    menu.OnItemSelect = function(sender, item, index)
        if item == closeItem then
            menu:Visible(false)
        end
    end
end

-- teleport.lua
-- Teleport Menu

function Teleport(menu)
    local submenu = _menuPool:AddSubMenu(menu, "Misc Settings", "")
    local tp = NativeUI.CreateItem("~o~Teleport to Waypoint", "Teleport to Waypoint | ~r~NOTE: ~o~May Teleport underground give it a few.")
    submenu:AddItem(tp)
    submenu.OnItemSelect = function(sender, item, index)
      if item == tp then
        local waypoint = GetFirstBlipInfoId(8)
      if DoesBlipExist(waypoint) then
         SetEntityCoords(PlayerPedId(), GetBlipInfoIdCoord(waypoint))
      end
    end
  end
end
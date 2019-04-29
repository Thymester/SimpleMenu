RegisterServerEvent("admin:getIsAllowed")
AddEventHandler("admin:getIsAllowed", function()
    if IsPlayerAceAllowed(source, "simplemenu.admin") then
        TriggerClientEvent("admin:returnIsAllowed", source, true)
    else
        TriggerClientEvent("admin:returnIsAllowed", source, false)
    end
end)
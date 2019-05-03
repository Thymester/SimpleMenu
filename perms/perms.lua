RegisterServerEvent("admin:getIsAllowed")
AddEventHandler("admin:getIsAllowed", function()
    if IsPlayerAceAllowed(source, "simplemenu.admin") then
        TriggerClientEvent("admin:returnIsAllowed", source, true)
    else
        TriggerClientEvent("admin:returnIsAllowed", source, false)
    end
end)

RegisterServerEvent("emergency:getIsemergency")
AddEventHandler("emergency:getIsemergency", function()
    if IsPlayerAceAllowed(source, "simplemenu.emergency") then
        TriggerClientEvent("emergency:returnIsemergency", source, true)
    else
        TriggerClientEvent("emergency:returnIsemergency", source, false)
    end
end)

RegisterServerEvent("fire:getIsFire")
AddEventHandler("fire:getIsFire", function()
    if IsPlayerAceAllowed(source, "simplemenu.fire") then
        TriggerClientEvent("fire:returnIsFire", source, true)
    else
        TriggerClientEvent("fire:returnIsFire", source, false)
    end
end)

RegisterServerEvent("emt:getIsEmt")
AddEventHandler("emt:getIsEmt", function()
    if IsPlayerAceAllowed(source, "simplemenu.emt") then
        TriggerClientEvent("emt:returnIsEmt", source, true)
    else
        TriggerClientEvent("emt:returnIsEmt", source, false)
    end
end)

RegisterServerEvent("state:getIsState")
AddEventHandler("state:getIsState", function()
    if IsPlayerAceAllowed(source, "simplemenu.state") then
        TriggerClientEvent("state:returnIsState", source, true)
    else
        TriggerClientEvent("state:returnIsState", source, false)
    end
end)
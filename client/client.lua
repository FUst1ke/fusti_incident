local function openMenu()
    local player = PlayerPedId()
    TaskStartScenarioInPlace(player, "WORLD_HUMAN_CLIPBOARD", 0, true);
    local input = lib.inputDialog('Record a new incident', {'Title', 'Description'})
    if not input then return end
    TriggerServerEvent('fusti_incident:sendData', input[1], input[2])
    ClearPedTasksImmediately(player)
end

exports('openMenu', function()
    openMenu()
end)
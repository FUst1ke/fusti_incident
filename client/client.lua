local function openMenu()
    local player = PlayerPedId()
    local dict = 'amb@code_human_wander_clipboard@male@base' 
    local name = 'static'
    local boneIndex = GetPedBoneIndex(player, 0x49D9)
    local item = CreateObject(`prop_fib_clipboard`, GetEntityCoords(player), true, true, false)
    AttachEntityToEntity(item, player, boneIndex, 0.02, 0.03, 0.05, -175.0, -100.0, 30.0, false, true, true, false, 0, true)
    lib.requestAnimDict(dict, false)
    TaskPlayAnim(player, dict, name, 8.0, 8.0, -1, 32, 0, true, true, true)
    local input = lib.inputDialog('Record a new incident', {'Title', 'Description'})
    if not input then DeleteEntity(item) ClearPedTasksImmediately(player) return end
    TriggerServerEvent('fusti_incident:sendData', input[1], input[2])
    lib.notify({title = 'Information', description = 'Data successfully recorded.', type = 'success'})
    ClearPedTasksImmediately(player)
    DetachEntity(item, true, true)
    DeleteEntity(item)
end

exports('openMenu', function()
    openMenu()
end)

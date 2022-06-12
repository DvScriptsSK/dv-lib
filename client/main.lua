function Stash(name,maxweight,slots)
    if Config.framework == 'qb' then
        TriggerEvent("inventory:client:SetCurrentStash", name)
TriggerServerEvent("inventory:server:OpenInventory", "stash", name, {
    maxweight = maxweight,
    slots = slots
  })
    elseif Config.framework == 'esx' then
    end
end
function Teleport(ped, x, y, z)
    SetEntityCoords(ped, x, y, z)
end
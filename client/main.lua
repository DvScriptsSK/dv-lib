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
    CreateThread( 
      function()
        DoScreenFadeOut(250)
        while not IsScreenFadedOut() do
          Wait(0)
        end
        SetEntityCoords(ped, x, y, z)
        DoScreenFadeIn(250)
      end)
end
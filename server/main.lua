
function GetPlayer(source)
    if Config.framework == 'qb' then
        local QBCore = exports['qb-core']:GetCoreObject()
         local Player = QBCore.Functions.GetPlayer(source)
         return(Player)
elseif Config.framework == 'esx' then
        local ESX = exports["es_extended"]:getSharedObject()
        local Player = ESX.GetPlayerFromId(source)
        return(Player)
end
end

function GiveItem(source,item,amount)
    if Config.framework == 'qb' then
         local Player = GetPlayer(source)
          Player.Functions.AddItem(item, amount) 
          return(true)
    end
    if Config.framework == 'esx' then
        local Player = GetPlayer(source)
        if Player.canCarryItem(item, amount) then
        Player.addInventoryItem(item, amount)
        return(true)
    else
       Player.showNotification("You can not carry item")
               return(false)
    end
end
end 
function RemoveItem(source,item,amount)
    local vaulue = false
    local Player = GetPlayer(source)
    if Config.framework == 'qb' then
         if Player.Functions.RemoveItem(item, amount)  then
          vaulue = true
         end
    elseif Config.framework == 'esx' then
        Player.removeInventoryItem(item, amount) 
        vaulue = true
end
Wait(500)
return(vaulue)
end
function AddMoney(source,type,amount)
    if Config.framework == 'qb' then
         local Player = GetPlayer(source)
         Player.Functions.AddMoney(type, amount)
    end
    if Config.framework == 'esx' then
        local Player = GetPlayer(source)
        if type == 'cash' then
        Player.addMoney(amount)
        end
        if type == 'bank' then
            Player.addAccountMoney('bank', amount)
        end
    end
end

function PlayerData(source)
    if Config.framework == 'qb' then
        local Player = GetPlayer(source)
        local palyerdata = {
        citizenid = Player.PlayerData.citizenid,
        license = Player.PlayerData.license,
        firstname = Player.PlayerData.charinfo.firstname,
        lastname = Player.PlayerData.charinfo.lastname,
        birthdate  = Player.PlayerData.charinfo.birthdate,
        gender = Player.PlayerData.charinfo.gender,
        nationality = Player.PlayerData.charinfo.nationality,
        phone =Player.PlayerData.charinfo.phone,
        jobname = Player.PlayerData.job.name,
        joblabel = Player.PlayerData.job.label , 
        jobpayment = Player.PlayerData.job.payment,
        jobboss =Player.PlayerData.job.isboss ,
        jobgrade = Player.PlayerData.job.grade,
        jobgradename =Player.PlayerData.job.grade.name,
        jobgradelevel = Player.PlayerData.job.grade.level,
        gangname = Player.PlayerData.gang.name,
        ganglabel = Player.PlayerData.gang.label,
        gangboss = Player.PlayerData.gang.isboss,
        ganggrade = Player.PlayerData.gang.grade,
        ganggradename = Player.PlayerData.gang.grade.name,
        ganggradelevel = Player.PlayerData.gang.grade.level,
    }                        
return(palyerdata)
elseif Config.framework == 'esx' then
       local Player = GetPlayer(source)
       local palyerdata = {
        license = Player.getIdentifier() ,
        name = Player.getName(),
        jobname = Player.job.name,
        jobgrade = Player.job.grade,
        jobgradename =Player.job.grade_name,
        jobgradelabel = Player.job.grade_label,
       }
       return(palyerdata)
   end
end


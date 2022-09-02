QBCore = nil
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

local aktif = false
QBCore.Functions.CreateUseableItem('bodycam', function(source) 
local xPlayer = QBCore.Functions.GetPlayer(source)
if xPlayer.PlayerData.job.name == "police" or xPlayer.PlayerData.job.name == "ambulance" or xPlayer.PlayerData.job.name == "avukat" and not aktif then
	aktif = true
		TriggerClientEvent('bodycam:show', xPlayer.PlayerData.source, "Ad-Soyad: "..xPlayer.PlayerData.charinfo.firstname.." "..xPlayer.PlayerData.charinfo.lastname, " Rütbe: " ..xPlayer.PlayerData.job.gradelabel)
	else
		TriggerClientEvent('bodycam:close')
		aktif = false
	end
end)

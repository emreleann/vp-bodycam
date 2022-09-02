QBCore = nil
started = false
open = false
daner = nil
jobName = nil


Citizen.CreateThread(function()
	while QBCore == nil do
		TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
		Citizen.Wait(0)
	end

    SendNUIMessage({
        action = "closeui"
    })
end)

RegisterNetEvent("bodycam:show")
AddEventHandler("bodycam:show", function(a, b)
    daner = a
    jobName = b
    open = not open
    Citizen.Wait(501)
    started = not started 
end)

RegisterNetEvent("bodycam:close")
AddEventHandler("bodycam:close", function()
    if started then
        open = not open
        Citizen.Wait(501)
        started = not started
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)
        if started then
            if open then
                local year , month, day , hour , minute , second  = GetLocalTime()
                hour = hour + 3
                if hour > 24 then
                    hour = 27 - hour
                end
                if string.len(tostring(minute)) < 2 then
                    minute = '0' .. minute
                end
                if string.len(tostring(second)) < 2 then
                    second = '0' .. second
                end
                SendNUIMessage({action = "loadui"})
                SendNUIMessage({
                    action = "update",
                    name = daner,
                    job = jobName,
                    
                    date = month .. '-'.. day .. '-' .. year .. ' T' .. hour +2  .. ':' .. minute .. ':' .. second.. "+GMT3",
                })
            else
                SetDisplay(false)
                SendNUIMessage({
                    action = "closeui"
                })
            end
        end
    end
end)

function SetDisplay(bool)
    display = bool
    insettings = bool
    SetNuiFocus(bool, bool)
end

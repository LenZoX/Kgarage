ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local PlayerData = {}

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
     PlayerData = xPlayer
end)

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
    end
    while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
    end
    if ESX.IsPlayerLoaded() then

		ESX.PlayerData = ESX.GetPlayerData()

    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)


RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

------------ EMPLACEMENT DU MENU -----------

local position = {
	{x = 457.27, y = -1010.97, z = 28.33}
}


Citizen.CreateThread(function()
    while true do
        local Timer = 500
        for k in pairs(position) do
            if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' then 
                local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                local dist3 = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)

            if dist3 <= 5.0 then
            Timer = 0
            end
            if dist3 <= 1.5 then
                Timer = 0   
                        RageUI.Text({  message = "Appuyez sur [~r~E~w~] pour choisir un véhicule", time_display = 1 })
                        if IsControlJustPressed(1,51) then           
                            GarageKAITO()
                        end
                    end   
                end
            end 
        Citizen.Wait(Timer)
    end
end)

-------- MENU DU GARAGE ----------

function GarageKAITO()
    local GarageLSPD = RageUI.CreateMenu("", "Menu Intéraction..")
        RageUI.Visible(GarageLSPD, not RageUI.Visible(GarageLSPD))
            while GarageLSPD do
            Citizen.Wait(0)
            RageUI.IsVisible(GarageLSPD, true, true, true, function()

                RageUI.Separator("↓ ~b~     En service~s~ :   ~r~"..GetPlayerName(PlayerId()).."    ~s~↓")

      -- CONFIG TES GRADES EN DESSOUS --
      ---(A FAIRE SUR CHAQUE LIGNE)----
                if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' and ESX.PlayerData.job.grade_name == 'officer' or ESX.PlayerData.job.grade_name == 'sergeant' or ESX.PlayerData.job.grade_name == 'lieutenant' or ESX.PlayerData.job.grade_name == 'boss' then 
                RageUI.ButtonWithStyle("Sortir une Cruiser",nil, {RightLabel = "→→→"},true, function(Hovered, Active, Selected)
                    if (Selected) then  
                    local model = GetHashKey("police")
                    RequestModel(model)
                    while not HasModelLoaded(model) do Citizen.Wait(10) end
                    local pos = GetEntityCoords(PlayerPedId())
                    local vehicle = CreateVehicle(model, 439.44, -1024.09, 28.72, 1.95, true, true)
                    end
                end)
            end

                if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' and  ESX.PlayerData.job.grade_name == 'sergeant' or ESX.PlayerData.job.grade_name == 'lieutenant' or ESX.PlayerData.job.grade_name == 'boss' then 
                RageUI.ButtonWithStyle("Sortir une Buffalo",nil, {RightLabel = "→→→"},true, function(Hovered, Active, Selected)
                    if (Selected) then  
                    local model = GetHashKey("police2")
                    RequestModel(model)
                    while not HasModelLoaded(model) do Citizen.Wait(10) end
                    local pos = GetEntityCoords(PlayerPedId())
                    local vehicle = CreateVehicle(model, 439.44, -1024.09, 28.72, 1.95, true, true)
                    end
                end)
            end
            if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' and ESX.PlayerData.job.grade_name == 'lieutenant' or ESX.PlayerData.job.grade_name == 'boss' then 
                RageUI.ButtonWithStyle("Sortir une Vapid",nil, {RightLabel = "→→→"},true, function(Hovered, Active, Selected)
                    if (Selected) then  
                    local model = GetHashKey("police3")
                    RequestModel(model)
                    while not HasModelLoaded(model) do Citizen.Wait(10) end
                    local pos = GetEntityCoords(PlayerPedId())
                    local vehicle = CreateVehicle(model, 439.44, -1024.09, 28.72, 1.95, true, true)
                    end
                end)
            end
            if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' and ESX.PlayerData.job.grade_name == 'lieutenant' or ESX.PlayerData.job.grade_name == 'boss' then 
                RageUI.ButtonWithStyle("Sortir un Bus pénitentiaire",nil, {RightLabel = "→→→"},true, function(Hovered, Active, Selected)
                    if (Selected) then  
                    local model = GetHashKey("pbus")
                    RequestModel(model)
                    while not HasModelLoaded(model) do Citizen.Wait(10) end
                    local pos = GetEntityCoords(PlayerPedId())
                    local vehicle = CreateVehicle(model, 439.44, -1024.09, 28.72, 1.95, true, true)
                    end
                end)
            end

                if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' and ESX.PlayerData.job.grade_name == 'boss' then 
                RageUI.ButtonWithStyle("Sortir un Riot",nil, {RightLabel = "→→→"},true, function(Hovered, Active, Selected)
                    if (Selected) then  
                    local model = GetHashKey("riot")
                    RequestModel(model)
                    while not HasModelLoaded(model) do Citizen.Wait(10) end
                    local pos = GetEntityCoords(PlayerPedId())
                    local vehicle = CreateVehicle(model, 439.44, -1024.09, 28.72, 1.95, true, true)
                    end
                end)
            end

    
            end, function()
            end, 1)

            if not RageUI.Visible(GarageLSPD) then
            GarageLSPD = RMenu:DeleteType("GarageLSPD", true)
        end
    end
end

local npc2 = {
	{hash="s_m_y_cop_01", x = 457.27, y = -1010.97, z = 28.23, a=150.12}, 
}

Citizen.CreateThread(function()
	for _, item2 in pairs(npc2) do
		local hash = GetHashKey(item2.hash)
		while not HasModelLoaded(hash) do
		RequestModel(hash)
		Wait(20)
		end
		ped2 = CreatePed("PED_TYPE_CIVFEMALE", item2.hash, item2.x, item2.y, item2.z-0.92, item2.a, false, true)
		SetBlockingOfNonTemporaryEvents(ped2, true)
		FreezeEntityPosition(ped2, true)
		SetEntityInvincible(ped2, true)
	end
end)




------------- RANGER VOITURE ----------------


local LDO = {
    {x = 457.33, y = -1020.33, z = 28.26}
}


function Rehhhddaaa(vehicle)
    local playerPed = GetPlayerPed(-1)
    local vehicle = GetVehiclePedIsIn(playerPed, false)
    local props = ESX.Game.GetVehicleProperties(vehicle)
    local current = GetPlayersLastVehicle(GetPlayerPed(-1), true)
    local engineHealth = GetVehicleEngineHealth(current)

    if IsPedInAnyVehicle(GetPlayerPed(-1), true) then 
        if engineHealth < 890 then
            ESX.ShowNotification("Votre véhicule est trop abimé, vous ne pouvez pas le ranger.")
        else
            ESX.Game.DeleteVehicle(vehicle)
            ESX.ShowNotification("~g~Le véhicule a été rangé au poste.")
        end
    end
end




Citizen.CreateThread(function()
    while true do

      local wait = 750

        for k in pairs(LDO) do
        if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' then 
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, LDO[k].x, LDO[k].y, LDO[k].z)

            if dist <= 5.0 then
            wait = 0
        
            if dist <= 5.0 then
               wait = 0
               if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                DrawMarker(22,  457.33, -1020.33,  28.26, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.3, 0.3, 0.3, 40, 158, 18, 255, true, true, p19, true)
			   RageUI.Text({

				message = "Appuyez sur [~r~E~w~] pour ranger ton véhicule",
	
				time_display = 1
	
			})
                if IsControlJustPressed(1,51) then
                    DoScreenFadeOut(3000)
                    Citizen.Wait(3000)
                    DoScreenFadeIn(3000)
					Rehhhddaaa()
            end
        end
    end
    end
    end
    Citizen.Wait(wait)
    end
end
end)

------------------------------------------------------------- HELIPORT -----------------------------------------------------------------------

------------ EMPLACEMENT DU MENU HELIPORT -----------

local position = {
	{x = 458.6, y = -978.14, z = 43.69}
}


Citizen.CreateThread(function()
    while true do
        local Timer = 500
        for k in pairs(position) do
            if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' then 
                local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                local dist3 = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)

            if dist3 <= 5.0 then
            Timer = 0
            end
            if dist3 <= 1.5 then
                Timer = 0   
                        RageUI.Text({  message = "Appuyez sur [~r~E~w~] pour choisir un véhicule aérien", time_display = 1 })
                        if IsControlJustPressed(1,51) then           
                            Heliportttt()
                        end
                    end   
                end
            end 
        Citizen.Wait(Timer)
    end
end)

-------- MENU DU GARAGE ----------

function Heliportttt()
    local GarageAerien = RageUI.CreateMenu("", "Menu Intéraction..")
        RageUI.Visible(GarageAerien, not RageUI.Visible(GarageAerien))
            while GarageAerien do
            Citizen.Wait(0)
            RageUI.IsVisible(GarageAerien, true, true, true, function()

                RageUI.Separator("↓ ~b~     En service~s~ :   ~r~"..GetPlayerName(PlayerId()).."    ~s~↓")

      -- CONFIG TES GRADES EN DESSOUS --
      ---(A FAIRE SUR CHAQUE LIGNE)----
    
            if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' and ESX.PlayerData.job.grade_name == 'lieutenant' or ESX.PlayerData.job.grade_name == 'boss' then 
                RageUI.ButtonWithStyle("Sortir un Maverick",nil, {RightLabel = "→→→"},true, function(Hovered, Active, Selected)
                    if (Selected) then  
                    local model = GetHashKey("maverick")
                    RequestModel(model)
                    while not HasModelLoaded(model) do Citizen.Wait(10) end
                    local pos = GetEntityCoords(PlayerPedId())
                    local vehicle = CreateVehicle(model, 449.34, -981.4, 43.69, 259.9, true, true)
                    end
                end)
            end

    
            end, function()
            end, 1)

            if not RageUI.Visible(GarageAerien) then
            GarageAerien = RMenu:DeleteType("GarageAerien", true)
        end
    end
end

-------------- RANGER L'HELICO -è------------

local kAITO = {
    {x = 449.34, y = -981.4, z = 43.69}
}

Citizen.CreateThread(function()
    while true do

      local wait = 750

        for k in pairs(kAITO) do
        if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' then 
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, kAITO[k].x, kAITO[k].y, kAITO[k].z)

            if dist <= 5.0 then
            wait = 0
        
            if dist <= 5.0 then
               wait = 0
               if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                DrawMarker(22,  449.34, -981.4, 43.69, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.3, 0.3, 0.3, 40, 158, 18, 255, true, true, p19, true)
			   RageUI.Text({

				message = "Appuyez sur [~r~E~w~] pour ranger ton véhicule aérien",
	
				time_display = 1
	
			})
                if IsControlJustPressed(1,51) then
                    DoScreenFadeOut(3000)
                    Citizen.Wait(3000)
                    DoScreenFadeIn(3000)
					Rehhhddaaa()
            end
        end
    end
    end
    end
    Citizen.Wait(wait)
    end
end
end)

local npc2 = {
	{hash="s_m_y_cop_01", x = 458.6, y = -978.14, z = 43.59, a=150.12}, 
}

Citizen.CreateThread(function()
	for _, item2 in pairs(npc2) do
		local hash = GetHashKey(item2.hash)
		while not HasModelLoaded(hash) do
		RequestModel(hash)
		Wait(20)
		end
		ped2 = CreatePed("PED_TYPE_CIVFEMALE", item2.hash, item2.x, item2.y, item2.z-0.92, item2.a, false, true)
		SetBlockingOfNonTemporaryEvents(ped2, true)
		FreezeEntityPosition(ped2, true)
		SetEntityInvincible(ped2, true)
	end
end)

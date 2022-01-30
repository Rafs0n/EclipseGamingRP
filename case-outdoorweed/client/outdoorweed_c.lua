-------------------------------
---------- CASE#2506 ----------
-------------------------------

local QBCore = exports['qb-core']:GetCoreObject()
isLoggedIn = false
PlayerJob = {}
local SpawnedPlants = {}
local InteractedPlant = nil
local HarvestedPlants = {}
local canHarvest = true
local closestPlant = nil
local isDoingAction = false

-- Creates blip for smoke shop(uncomment to add the blip)
Citizen.CreateThread(function()
    local blip = AddBlipForCoord(-1173.28, -1572.47, 4.66) -- Change blip coords here
	SetBlipSprite(blip, 59)
	SetBlipDisplay(blip, 25)
	SetBlipScale(blip, 0.6)
	SetBlipAsShortRange(blip, true)
	SetBlipColour(blip, 3)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentSubstringPlayerName("Smoke on The Water") -- Change blip name here
    EndTextCommandSetBlipName(blip)
end)
-- Smoke shop ped
local weedPed = {
  {-1171.08, -1571.28, 3.66,"Clyde",123.40,0xF041880B,"u_m_y_hippie_01"},

}
-- Spawns smoke shop ped
Citizen.CreateThread(function()
    for _,v in pairs(weedPed) do
        RequestModel(GetHashKey(v[7]))
        while not HasModelLoaded(GetHashKey(v[7])) do
            Wait(1)
        end
        SmokeShopPed =  CreatePed(4, v[6],v[1],v[2],v[3], 3374176, false, true)
        SetEntityHeading(SmokeShopPed, v[5])
        FreezeEntityPosition(SmokeShopPed, true)
        SetEntityInvincible(SmokeShopPed, true)
        SetBlockingOfNonTemporaryEvents(SmokeShopPed, true)
        TaskStartScenarioInPlace(SmokeShopPed, "WORLD_HUMAN_SMOKING_POT", 0, true) 
    end
end)
-- Targeting for smoke shop ped
exports['qb-target']:AddTargetModel(`u_m_y_hippie_01`, {
    options = {
        {
            event = "case-outdoorweed:client:SmokeShopPed",
            icon = "fab fa-drupal",
            label = "Speak with Clyde",
        },
    },
distance = 1.5 
})
-- Smoke shop main menu
RegisterNetEvent('case-outdoorweed:client:SmokeShopPed', function()
    exports['qb-menu']:openMenu({
        {
            header = "Smoke on the Water",
            txt = "Marijuana Vendor",
            isMenuHeader = true
        },
        {
            header = "Browse Shop",
            txt = "See what we have to offer",
            params = {
                event = "inventory:client:OpenSmokeShop",
            }
        },
        {
            header = "Sell to Shop",
            txt = "See current prices",
            params = {
                event = "case-outdoorweed:client:SellingMenu",
            }
        },
        {
            header = "< Exit",
            params = {
                event = "qb-menu:closeMenu"
            }
        },
    })
end)
-- Sell weed to store menu
RegisterNetEvent('case-outdoorweed:client:SellingMenu', function()
    exports['qb-menu']:openMenu({
        {
            header = "Smoke on the Water",
            txt = "We only accept ounces",
            isMenuHeader = true
        },
        {
            header = "Skunk",
            txt = "$5 per bag of Skunk.",
            params = {
                event = "case-outdoorweed:server:SellBags",
                isServer = true,
                args = 1
            }
        },
        {
            header = "OG-Kush.",
            txt = "$8 per bag of OG-Kush.",
            params = {
                event = "case-outdoorweed:server:SellBags",
                isServer = true,
                args = 2

            }
        },
        {
            header = "White Widow.",
            txt = "$11 per bag of White Widow.",
            params = {
                event = "case-outdoorweed:server:SellBags",
                isServer = true,
                args = 3
            }
        },
		{
            header = "AK47.",
            txt = "$14 per bag of AK47.",
            params = {
                event = "case-outdoorweed:server:SellBags",
                isServer = true,
                args = 4
            }
        },
		{
            header = "Amnesia.",
            txt = "$17 per bag of Amnesia.",
            params = {
                event = "case-outdoorweed:server:SellBags",
                isServer = true,
                args = 5
            }
        },
		{
            header = "Purple Haze.",
            txt = "$20 per bag of Purple Haze.",
            params = {
                event = "case-outdoorweed:server:SellBags",
                isServer = true,
                args = 6
            }
        },
        {
            header = "< Return",
            params = {
                event = "case-outdoorweed:client:SmokeShopPed"
            }
        },
    })
end)
-- Use trimming shears menu
RegisterNetEvent('case-outdoorweed:client:TrimmingMenu', function()
    TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_PARKING_METER", 3500, false)
    exports['qb-menu']:openMenu({
        {
            header = "Weed Trimming",
            txt = "Requires:</p>28x Baggies</p>1x Weed Crop",
            isMenuHeader = true
        },
        {
            header = "Skunk",
            txt = "Process skunk crops into bags.",
            params = {
                event = "case-outdoorweed:server:TrimWeed",
                isServer = true,
                args = 1

            }
        },
        {
            header = "OG-Kush",
            txt = "Process OG Kush crops into bags.",
            params = {
                event = "case-outdoorweed:server:TrimWeed",
                isServer = true,
                args = 2
            }
        },
		{ 
            header = "White Widow",
            txt = "Process White Widow crops into bags.",
            params = {
                event = "case-outdoorweed:server:TrimWeed",
                isServer = true,
                args = 3
            }
        },
		{ 
            header = "AK47",
            txt = "Process AK47 crops into bags.",
            params = {
                event = "case-outdoorweed:server:TrimWeed",
                isServer = true,
                args = 4
            }
        },
		{ 
            header = "Amnesia",
            txt = "Process Amnesia crops into bags.",
            params = {
                event = "case-outdoorweed:server:TrimWeed",
                isServer = true,
                args = 5
            }
        },
		{ 
            header = "Purple Haze",
            txt = "Process Purple Haze crops into bags.",
            params = {
                event = "case-outdoorweed:server:TrimWeed",
                isServer = true,
                args = 6
            }
        },
        {
            header = "< Exit",
            params = {
                event = "case-outdoorweed:client:stopTrimmingMenu"
            }
        },
    })
end)
-- Stop trimming menu
RegisterNetEvent('case-outdoorweed:client:stopTrimmingMenu', function()
    ClearPedTasks(PlayerPedId())
end)
-- Create plants
Citizen.CreateThread(function()
    while true do
    Citizen.Wait(150)
    local player = GetPlayerPed(-1)
    local position = GetEntityCoords(player)
    local inRange = false
    for i = 1, #Config.Plants do
        local dist = GetDistanceBetweenCoords(position.x, position.y, position.z, Config.Plants[i].x, Config.Plants[i].y, Config.Plants[i].z, true)
            if dist < 50.0 then
                inRange = true
                local hasSpawned = false
                local needsUpgrade = false
                local upgradeId = nil
                local tableRemove = nil    
                for z = 1, #SpawnedPlants do
                    local p = SpawnedPlants[z]    
                    if p.id == Config.Plants[i].id then
                        hasSpawned = true
                        if p.stage ~= Config.Plants[i].stage then
                            needsUpgrade = true
                            upgradeId = p.id
                            tableRemove = z
                        end
                    end
                end    
                if not hasSpawned then
                    local hash = GetHashKey(Config.WeedStages[Config.Plants[i].stage])
                    RequestModel(hash)
                    local data = {}
                    data.id = Config.Plants[i].id
                    data.stage = Config.Plants[i].stage    
                    while not HasModelLoaded(hash) do
                        Citizen.Wait(10)
                        RequestModel(hash)
                    end    
                    data.obj = CreateObject(hash, Config.Plants[i].x, Config.Plants[i].y, Config.Plants[i].z + GetPlantZ(Config.Plants[i].stage), false, false, false) 
                    SetEntityAsMissionEntity(data.obj, true)
                    FreezeEntityPosition(data.obj, true)
                    table.insert(SpawnedPlants, data)
                    hasSpawned = false
                end    
                if needsUpgrade then
                    for o = 1, #SpawnedPlants do
                        local u = SpawnedPlants[o]    
                        if u.id == upgradeId then
                            SetEntityAsMissionEntity(u.obj, false)
                            FreezeEntityPosition(u.obj, false)
                            DeleteObject(u.obj)   
                            local hash = GetHashKey(Config.WeedStages[Config.Plants[i].stage])
                            RequestModel(hash)
                            local data = {}
                            data.id = Config.Plants[i].id
                            data.stage = Config.Plants[i].stage    
                            while not HasModelLoaded(hash) do
                                Citizen.Wait(10)
                                RequestModel(hash)
                            end    
                            data.obj = CreateObject(hash, Config.Plants[i].x, Config.Plants[i].y, Config.Plants[i].z + GetPlantZ(Config.Plants[i].stage), false, false, false) 
                            SetEntityAsMissionEntity(data.obj, true)
                            FreezeEntityPosition(data.obj, true)
                            table.remove(SpawnedPlants, o)
                            table.insert(SpawnedPlants, data)
                            needsUpgrade = false
                        end
                    end
                end
            end
    end
    if not InRange then
        Citizen.Wait(5000)
    end
    end
end)
-- Destroy plants
function DestroyPlant()
    local plant = GetClosestPlant()
    local hasDone = false
    for k, v in pairs(HarvestedPlants) do
        if v == plant.id then
            hasDone = true
        end
    end
    if not hasDone then
        table.insert(HarvestedPlants, plant.id)
        local player = GetPlayerPed(-1)
		playAnim("anim@amb@business@weed@weed_inspecting_lo_med_hi@", "weed_crouch_checkingleaves_idle_01_inspector", 35000)
        isDoingAction = true
		TriggerServerEvent('case-outdoorweed:server:PlantHarvested', plant.id)
        exports['pogressBar']:drawBar(5000, 'Destroying plant..') 
			Wait(4500)
			ClearPedTasks(playerPed)
			Wait(500) -- Done
            TriggerServerEvent('case-outdoorweed:server:DestroyPlants', plant.id)
            isDoingAction = false
            canHarvest = true
            FreezeEntityPosition(player, false)
            ClearPedTasksImmediately(player)
	end
end
-- Harvest plants
function HarvestWeedPlant()
    local plant = GetClosestPlant()
    local hasDone = false
    for k, v in pairs(HarvestedPlants) do
        if v == plant.id then
            hasDone = true
        end
    end
    if not hasDone then
        table.insert(HarvestedPlants, plant.id)
        local player = GetPlayerPed(-1)
		playAnim("anim@amb@business@weed@weed_inspecting_lo_med_hi@", "weed_crouch_checkingleaves_idle_01_inspector", 35000)
        isDoingAction = true
        exports['pogressBar']:drawBar(5000, 'Harvesting plant..') 
			Wait(4500)
			ClearPedTasks(playerPed)
			Wait(500) -- Done
            TriggerServerEvent('case-outdoorweed:server:HarvestPlant', plant.id)
            isDoingAction = false
            canHarvest = true
            FreezeEntityPosition(player, false)
            ClearPedTasksImmediately(player)
	end
end
-- Remove plants from sql
function RemovePlantFromTable(plantId)
    for k, v in pairs(Config.Plants) do
        if v.id == plantId then
            table.remove(Config.Plants, k)
        end
    end
end
-- Feed/water or destroy plants
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
            local InRange = false
            local player = GetPlayerPed(-1)
            local position = GetEntityCoords(player)
            for k, v in pairs(Config.Plants) do
                if GetDistanceBetweenCoords(position.x, position.y, position.z, v.x, v.y, v.z, true) < 1.3 and not isDoingAction and not v.beingHarvested and not IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                    if PlayerJob.name == 'police' then
                        local plant = GetClosestPlant()
                        DrawText3D(v.x, v.y, v.z, 'Type: ' .. v.type .. 'Thirst: ' .. v.thirst .. '% - Hunger: ' .. v.hunger .. '% - Growth: ' ..  v.growth .. '% -  Quality: ' .. v.quality)
                        DrawText3D(v.x, v.y, v.z - 0.18, '~r~G~w~ - Destroy Plant')
                        if IsControlJustReleased(0, 47) then
                            if v.id == plant.id then
                                DestroyPlant()
                            end
                        end
                    else
                        if v.growth < 100 then
                            local plant = GetClosestPlant()    
							DrawText3D(v.x, v.y, v.z, 'Type: ' .. v.type .. ' Thirst: ' .. v.thirst .. '% - Hunger: ' .. v.hunger .. '% - Growth: ' ..  v.growth .. '% -  Quality: ' .. v.quality)
                            DrawText3D(v.x, v.y, v.z - 0.18, '~b~G~w~ - Water      ~y~H~w~ - Feed')
                            if IsControlJustReleased(0, 47) then
                                if v.id == plant.id then
                                    TriggerServerEvent('case-outdoorweed:server:ItemCheck', 'weed_water', 'case-outdoorweed:client:WaterPlants', true)
                                end
                            elseif IsControlJustReleased(0, 74) then
                                if v.id == plant.id then
                                    TriggerServerEvent('case-outdoorweed:server:ItemCheck', 'weed_nutrition', 'case-outdoorweed:client:FeedPlants', true)
                                end
                            end
                        else
                            DrawText3D(v.x, v.y, v.z, 'Type: ' .. v.type .. '[Quality: ' .. v.quality .. ']')
                            DrawText3D(v.x, v.y, v.z - 0.18, '~g~E~w~ - Harvest')
                            if IsControlJustReleased(0, 38) and canHarvest then
                                local plant = GetClosestPlant()
                                if v.id == plant.id then
                                    HarvestWeedPlant()
                                end
                            end
                        end
                    end
                end
            end
    end
end)
-- Get closest plant data
function GetClosestPlant()
    local dist = 1000
    local player = GetPlayerPed(-1)
    local position = GetEntityCoords(player)
    local plant = {}
    for i = 1, #Config.Plants do
        local distance = GetDistanceBetweenCoords(position.x, position.y, position.z, Config.Plants[i].x, Config.Plants[i].y, Config.Plants[i].z, true)
        if distance < dist then
            dist = distance
            plant = Config.Plants[i]
        end
    end

    return plant
end
-- Deletes plant
RegisterNetEvent('case-outdoorweed:client:RemovePlant')
AddEventHandler('case-outdoorweed:client:RemovePlant', function(plant)
    for i = 1, #SpawnedPlants do
        local o = SpawnedPlants[i]
        if o.id == plant then
            SetEntityAsMissionEntity(o.obj, false)
            FreezeEntityPosition(o.obj, false)
            DeleteObject(o.obj)
        end
    end
end)
-- Notifications
RegisterNetEvent('case-outdoorweed:client:notify')
AddEventHandler('case-outdoorweed:client:notify', function(msg)
    QBCore.Functions.Notify(msg, "primary")
end)
-- Water plants
RegisterNetEvent('case-outdoorweed:client:WaterPlants')
AddEventHandler('case-outdoorweed:client:WaterPlants', function()
    local entity = nil
    local plant = GetClosestPlant()
	playAnim("anim@amb@business@weed@weed_inspecting_lo_med_hi@", "weed_crouch_checkingleaves_idle_01_inspector", 35000)
    local player = GetPlayerPed(-1)
    isDoingAction = true
    for k, v in pairs(SpawnedPlants) do
        if v.id == plant.id then
            entity = v.obj
        end
    end
	exports['pogressBar']:drawBar(5000, 'Watering plant..') 
		Wait(4500)
		ClearPedTasks(playerPed)
		Wait(500)
        FreezeEntityPosition(player, false)
        TriggerServerEvent('case-outdoorweed:server:WaterPlants', plant.id)
        ClearPedTasksImmediately(GetPlayerPed(-1))
        isDoingAction = false
end)
-- Feed plants
RegisterNetEvent('case-outdoorweed:client:FeedPlants')
AddEventHandler('case-outdoorweed:client:FeedPlants', function()
    local entity = nil
	local playerPed = PlayerPedId()
	playAnim("anim@amb@business@weed@weed_inspecting_lo_med_hi@", "weed_crouch_checkingleaves_idle_01_inspector", 35000)
    local plant = GetClosestPlant()
    local player = GetPlayerPed(-1)
    isDoingAction = true
    for k, v in pairs(SpawnedPlants) do
        if v.id == plant.id then
            entity = v.obj
        end
    end
    exports['pogressBar']:drawBar(5000, 'Feeding plant..') 
		Wait(4500)
		ClearPedTasks(playerPed)
		Wait(500)
        TriggerServerEvent('case-outdoorweed:server:FeedPlants', plant.id)
        ClearPedTasksImmediately(GetPlayerPed(-1))
        isDoingAction = false
end)
-- Update plants
RegisterNetEvent('case-outdoorweed:client:UpdatePlants')
AddEventHandler('case-outdoorweed:client:UpdatePlants', function(data)
    Config.Plants = data
end)
-- Plant seeds
RegisterNetEvent('case-outdoorweed:client:SeedPlanted')
AddEventHandler('case-outdoorweed:client:SeedPlanted', function(type)
    local position = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0.0, 1.0, 0.0)
    if CanPlantSeedHere(position) and not IsPedInAnyVehicle(GetPlayerPed(-1), false) then
			exports['pogressBar']:drawBar(2000, 'Planting seed..')
            TriggerServerEvent('case-outdoorweed:server:SeedPlanted', type, position)
    else
        QBCore.Functions.Notify("Too close to another plant", "error")
    end
end)
-- Confirm seed
RegisterNetEvent('case-outdoorweed:client:ConfirmSeed')
AddEventHandler('case-outdoorweed:client:ConfirmSeed', function()
    RequestAnimDict("pickup_object")
    while not HasAnimDictLoaded("pickup_object") do
        Citizen.Wait(7)
    end
    TaskPlayAnim(GetPlayerPed(-1), "pickup_object" ,"pickup_low" ,8.0, -8.0, -1, 1, 0, false, false, false)
    Citizen.Wait(1800)
    ClearPedTasks(GetPlayerPed(-1))
end)
-- Drawtext 
function DrawText3D(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end
-- Checks if can plant seed
function CanPlantSeedHere(position)
    local canPlant = true
    for i = 1, #Config.Plants do
        if GetDistanceBetweenCoords(position.x, position.y, position.z, Config.Plants[i].x, Config.Plants[i].y, Config.Plants[i].z, true) < 1.3 then
            canPlant = false
        end
    end
    return canPlant
end
-- Plant z stage
function GetPlantZ(stage)
    if stage == 1 then
        return -1.0
    else
        return -3.5
    end
end
-- Animations
function playAnim(animDict, animName, duration)
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do 
      Wait(0) 
    end
    TaskPlayAnim(PlayerPedId(), animDict, animName, 1.0, -1.0, duration, 49, 1, false, false, false)
    RemoveAnimDict(animDict)
end
-- Open Smokeshop
RegisterNetEvent('inventory:client:OpenSmokeShop')
AddEventHandler('inventory:client:OpenSmokeShop', function()
    local ShopItems = {}
    ShopItems.label = "Smoke on The Water"
    ShopItems.items = Config.SmokeShopItems
    ShopItems.slots = #Config.SmokeShopItems
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "Smoke on The Water", ShopItems)
end)
-- Player loaded
RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    isLoggedIn = true
    PlayerJob = QBCore.Functions.GetPlayerData().job
end)
-- Job update
RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
end)
-- Use joints
RegisterNetEvent('case-outdoorweed:client:UseSkunkJoint', function()
	local playerPed = PlayerPedId()
	QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
		if HasItem then
				isSmokingJoint = true
				exports['pogressBar']:drawBar(5000, 'Smoking smoke skunk..') 
				TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_SMOKING_POT", 0, false)
				Wait(5500)
				ClearPedTasks(playerPed)
				Wait(1000)
				TriggerServerEvent("QBCore:Server:RemoveItem", "weed_skunk_joint", 1)
				TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["weed_skunk_joint"], "remove")
				TriggerServerEvent('hud:server:RelieveStress', math.random(2,8))
				SetTimecycleModifier("drug_flying_base")
				AddArmourToPed(PlayerPedId(), math.random(2,8))
				SetPedMotionBlur(ped, true)
				SetPedMovementClipset(ped, "move_m@hipster@a", true)
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.35)
				Wait(1500)
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.25)
				Wait(1500)
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.15)
				Wait(1500)
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.05)
				Citizen.Wait(5*1500)
				ClearTimecycleModifier()
		else		
			QBCore.Functions.Notify('You need a lighter to smoke..', 'error', 3500)
		end
	end, "lighter")
end)
RegisterNetEvent('case-outdoorweed:client:UseOGKushJoint', function()
	local playerPed = PlayerPedId()
	QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
		if HasItem then
				isSmokingJoint = true
				exports['pogressBar']:drawBar(5000, 'Smoking some og kush..') 
				TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_SMOKING_POT", 0, false)
				Wait(5500)
				ClearPedTasks(playerPed)
				Wait(1000)
				TriggerServerEvent("QBCore:Server:RemoveItem", "weed_og-kush_joint", 1)
				TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["weed_og-kush_joint"], "remove")
				TriggerServerEvent('hud:server:RelieveStress', math.random(5,10))
				SetTimecycleModifier("drug_flying_base")
				AddArmourToPed(PlayerPedId(), math.random(5,10))
				SetPedMotionBlur(ped, true)
				SetPedMovementClipset(ped, "move_m@hipster@a", true)
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.35)
				Wait(1500)
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.25)
				Wait(1500)
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.15)
				Wait(1500)
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.05)
				Citizen.Wait(5*1500)
				ClearTimecycleModifier()
		else		
			QBCore.Functions.Notify('You need a lighter to smoke..', 'error', 3500)
		end
	end, "lighter")
end)
RegisterNetEvent('case-outdoorweed:client:UseWhiteWidowJoint', function()
	local playerPed = PlayerPedId()
	QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
		if HasItem then
				isSmokingJoint = true
				exports['pogressBar']:drawBar(5000, 'Smoking some white widow..') 
				TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_SMOKING_POT", 0, false)
				Wait(5500)
				ClearPedTasks(playerPed)
				Wait(1000)
				TriggerServerEvent("QBCore:Server:RemoveItem", "weed_white-widow_joint", 1)
				TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["weed_white-widow_joint"], "remove")
				TriggerServerEvent('hud:server:RelieveStress', math.random(8,12))
				SetTimecycleModifier("drug_flying_base")
				AddArmourToPed(PlayerPedId(), math.random(8,12))
				SetPedMotionBlur(ped, true)
				SetPedMovementClipset(ped, "move_m@hipster@a", true)
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.35)
				Wait(1500)
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.25)
				Wait(1500)
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.15)
				Wait(1500)
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.05)
				Citizen.Wait(5*1500)
				ClearTimecycleModifier()
		else		
			QBCore.Functions.Notify('You need a lighter to smoke..', 'error', 3500)
		end
	end, "lighter")
end)
RegisterNetEvent('case-outdoorweed:client:UseAK47Joint', function()
	local playerPed = PlayerPedId()
	QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
		if HasItem then
				isSmokingJoint = true
				exports['pogressBar']:drawBar(5000, 'Smoking some ak47..') 
				TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_SMOKING_POT", 0, false)
				Wait(5500)
				ClearPedTasks(playerPed)
				Wait(1000)
				TriggerServerEvent("QBCore:Server:RemoveItem", "weed_ak47_joint", 1)
				TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["weed_ak47_joint"], "remove")
				TriggerServerEvent('hud:server:RelieveStress', math.random(10,15))
				SetTimecycleModifier("drug_flying_base")
				AddArmourToPed(PlayerPedId(), math.random(10,15))
				SetPedMotionBlur(ped, true)
				SetPedMovementClipset(ped, "move_m@hipster@a", true)
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.35)
				Wait(1500)
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.25)
				Wait(1500)
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.15)
				Wait(1500)
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.05)
				Citizen.Wait(5*1500)
				ClearTimecycleModifier()
		else		
			QBCore.Functions.Notify('You need a lighter to smoke..', 'error', 3500)
		end
	end, "lighter")
end)
RegisterNetEvent('case-outdoorweed:client:UseAmnesiaJoint', function()
	local playerPed = PlayerPedId()
	QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
		if HasItem then
				isSmokingJoint = true
				exports['pogressBar']:drawBar(5000, 'Smoking some amnesia..') 
				TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_SMOKING_POT", 0, false)
				Wait(5500)
				ClearPedTasks(playerPed)
				Wait(1000)
				TriggerServerEvent("QBCore:Server:RemoveItem", "weed_amnesia_joint", 1)
				TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["weed_amnesia_joint"], "remove")
				TriggerServerEvent('hud:server:RelieveStress', math.random(12,18))
				SetTimecycleModifier("drug_flying_base")
				AddArmourToPed(PlayerPedId(), math.random(12,18))
				SetPedMotionBlur(ped, true)
				SetPedMovementClipset(ped, "move_m@hipster@a", true)
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.35)
				Wait(1500)
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.25)
				Wait(1500)
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.15)
				Wait(1500)
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.05)
				Citizen.Wait(5*1500)
				ClearTimecycleModifier()
		else		
			QBCore.Functions.Notify('You need a lighter to smoke..', 'error', 3500)
		end
	end, "lighter")
end)
RegisterNetEvent('case-outdoorweed:client:UsePurpleHazeJoint', function()
	local playerPed = PlayerPedId()
	QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
		if HasItem then
				isSmokingJoint = true
				exports['pogressBar']:drawBar(5000, 'Smoking some purple haze..') 
				TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_SMOKING_POT", 0, false)
				Wait(5500)
				ClearPedTasks(playerPed)
				Wait(1000)
				TriggerServerEvent("QBCore:Server:RemoveItem", "weed_purple-haze_joint", 1)
				TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["weed_purple-haze_joint"], "remove")
				TriggerServerEvent('hud:server:RelieveStress', math.random(15,25))
				SetTimecycleModifier("drug_flying_base")
				AddArmourToPed(PlayerPedId(), math.random(15,25))
				SetPedMotionBlur(ped, true)
				SetPedMovementClipset(ped, "move_m@hipster@a", true)
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.35)
				Wait(1500)
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.25)
				Wait(1500)
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.15)
				Wait(1500)
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.05)
				Citizen.Wait(5*1000)
				ClearTimecycleModifier()
		else		
			QBCore.Functions.Notify('You need a lighter to smoke..', 'error', 3500)
		end
	end, "lighter")
end)
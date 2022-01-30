-------------------------------
---------- CASE#2506 ----------
-------------------------------

local QBCore = exports['qb-core']:GetCoreObject()
local spawnedMeth = 0
local methRocks = {}
local isPickingUp = false
local isProcessing = false
local isTakingMeth = false

local methPed = {
  {-44.71, 6582.59, 31.18,"Chef",48.96,0x85889AC3,"ig_chef2"}, -- Meth processing ped and location

}
-- Creates blip for meth processing (uncomment to add the blip)
--[[Citizen.CreateThread(function()
    local blip = AddBlipForCoord(1993.39, 3050.78, 46.22) -- Change blip coords here
	SetBlipSprite(blip, 51)
	SetBlipDisplay(blip, 4)
	SetBlipScale(blip, 0.7)
	SetBlipAsShortRange(blip, true)
	SetBlipColour(blip, 1)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentSubstringPlayerName("Meth Processing") -- Change blip name here
    EndTextCommandSetBlipName(blip)
end)
Citizen.CreateThread(function()
    local blip = AddBlipForCoord(3617.73, 3739.21, 28.69) -- Change blip coords here
	SetBlipSprite(blip, 51)
	SetBlipDisplay(blip, 4)
	SetBlipScale(blip, 0.7)
	SetBlipAsShortRange(blip, true)
	SetBlipColour(blip, 1)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentSubstringPlayerName("Hydrochloric Acid") -- Change blip name here
    EndTextCommandSetBlipName(blip)
end)
Citizen.CreateThread(function()
    local blip = AddBlipForCoord(2829.35, -635.21, 1.93) -- Change blip coords here
	SetBlipSprite(blip, 51)
	SetBlipDisplay(blip, 4)
	SetBlipScale(blip, 0.7)
	SetBlipAsShortRange(blip, true)
	SetBlipColour(blip, 1)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentSubstringPlayerName("Acetone Boxes") -- Change blip name here
    EndTextCommandSetBlipName(blip)
end)]]
Citizen.CreateThread(function()
    local blip = AddBlipForCoord(2823.87, -627.59, 2.19) -- Change blip coords here
	SetBlipSprite(blip, 365)
	SetBlipDisplay(blip, 4)
	SetBlipScale(blip, 0.8)
	SetBlipAsShortRange(blip, true)
	SetBlipColour(blip, 10)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentSubstringPlayerName("Prospecting Zone") -- Change blip name here
    EndTextCommandSetBlipName(blip)
end)
-- Spawns processing ped
Citizen.CreateThread(function()
    for _,v in pairs(methPed) do
        RequestModel(GetHashKey(v[7]))
        while not HasModelLoaded(GetHashKey(v[7])) do
            Wait(1)
        end
        GoldDealerPed =  CreatePed(4, v[6],v[1],v[2],v[3], 3374176, false, true)
        SetEntityHeading(GoldDealerPed, v[5])
        FreezeEntityPosition(GoldDealerPed, true)
        SetEntityInvincible(GoldDealerPed, true)
        SetBlockingOfNonTemporaryEvents(GoldDealerPed, true)
        TaskStartScenarioInPlace(GoldDealerPed, "WORLD_HUMAN_STAND_MOBILE_UPRIGHT", 0, true) 
    end
end)
-- Targeting for processing ped
exports['qb-target']:AddTargetModel(`ig_chef2`, {
    options = {
        {
            event = "case:client:MethProcessPed",
            icon = "fab fa-drupal",
            label = "Speak with Chef",
        },
    },
distance = 2.5 
})
-- Targeting for hydrochloric acid barrel
exports['qb-target']:AddTargetModel(`prop_watercrate_01`, {
    options = {
        {
            event = "case:client:CollectHydrochloric",
            icon = "fas fa-biohazard",
            label = "Collect hydrochloric acid",
        },
    },
    distance = 2.0
}) 
-- Targeting for boxes
exports['qb-target']:AddTargetModel(`prop_boxpile_07d`, {
    options = {
        {
            event = "case:client:SearchBoxes",
            icon = "fas fa-box",
            label = "Search Boxes",
        },
    },
    distance = 2.0
})
-- Rocks targetting
exports['qb-target']:AddTargetModel(`prop_rock_1_i`, {
    options = {
        {
            event = "case:client:ProspectRocks",
            icon = "fas fa-dice-d6",
            label = "Prospect Rocks",
        },
    },
    distance = 2.0
})
-- Main meth processing menu
RegisterNetEvent('case:client:MethProcessPed', function()
    exports['qb-menu']:openMenu({
        {
            header = "Chef",
            txt = "I dont take meth I like my teeth!",
            isMenuHeader = true
        },
        {
            header = "Process Meth",
            txt = "Process meth ingredients into ounces.",
            params = {
                event = "case:client:MethProcessing",
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
-- Meth processing menu
RegisterNetEvent('case:client:MethProcessing', function()
    exports['qb-menu']:openMenu({
        {
            header = "Meth Processing",
            txt = "Required:</p>3x Acetone</p>3x lithium</p>3x Hydrochloric Acid</p>Needed to process one ounce.",
            isMenuHeader = true
        },
        {
            header = "Process Meth",
            txt = "Process meth ingredients into ounces.",
            params = {
                event = "case:server:ProcessMethOunce",
                isServer = true,
                args = 1
            }
        },
        {
            header = "< Go Back",
            params = {
                event = "case:client:stopMethProcessingMenu"
            }
        },
    })
end)
RegisterNetEvent('case:client:stopMethProcessingMenu', function()
    ClearPedTasks(PlayerPedId())
end)
--[[ Stop baggie menu
RegisterNetEvent('case:client:stopCuttingMenu', function()
    ClearPedTasks(PlayerPedId())
end)
-- Use baggie menu
RegisterNetEvent('case:client:CuttingMenu', function()
    TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_PARKING_METER", 3500, false)
    exports['qb-menu']:openMenu({
        {
            header = "Drug Cutting",
            txt = "Required:</p>28x Drug Bags</p>1x Ounce of Cocaine</p></p>1x Ounce of Meth",
            isMenuHeader = true
        },
        {
            header = "Process Ounces of Meth",
            txt = "Break down ounces into 1g bags.",
            params = {
                event = "case:server:CutDrugs",
                isServer = true,
                args = 1
            }
        },
        {
            header = "< Exit",
            params = {
                event = "case:client:stopCuttingMenu"
            }
        },
    })
end)]]
-- Collect gasoline event
harvestedPlants = {}
methProp = { "prop_watercrate_01" }
RegisterNetEvent('case:client:CollectHydrochloric', function()
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    for i = 1, #methProp do
        local Box = GetClosestObjectOfType(playerCoords, 0.9, GetHashKey(methProp[i]), false, false, false)
        local entity = nil
        if DoesEntityExist(Box) then
            entity = Box
            plant    = GetEntityCoords(entity)                
                if not harvestedPlants[entity] then
                    searchPlant(entity)
                else
                    QBCore.Functions.Notify("You have already collected from this location..", "error", 3500)
                end
            break
        else
            Wait(1000)
        end
    end
end)
-- Animation to collect
function playAnim(animDict, animName, duration)
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do 
      Wait(0) 
    end
    TaskPlayAnim(PlayerPedId(), animDict, animName, 1.0, -1.0, duration, 49, 1, false, false, false)
    RemoveAnimDict(animDict)
end
-- Collect hydrochloric acid function
function searchPlant(entity)
	local playerPed = PlayerPedId()
    playAnim("anim@amb@business@weed@weed_inspecting_lo_med_hi@", "weed_crouch_checkingleaves_idle_01_inspector", 35000)
	local finished = exports["reload-skillbar"]:taskBar(math.random(5000,7500),math.random(2,4))
    if finished ~= 100 then
		QBCore.Functions.Notify("Failed to collect hydrochloric acid...", "error", 3500)
		ClearPedTasks(playerPed)
    else
		local finished2 = exports["reload-skillbar"]:taskBar(math.random(2500,5000),math.random(3,5))
        if finished2 ~= 100 then
			QBCore.Functions.Notify("Failed to collect hydrochloric acid...", "error", 3500)
			ClearPedTasks(playerPed)
        else
			local finished3 = exports["reload-skillbar"]:taskBar(math.random(900,2000),math.random(5,7))
            if finished3 ~= 100 then
				QBCore.Functions.Notify("Failed to collect hydrochloric acid...", "error", 3500)
				ClearPedTasks(playerPed)
            else
				local HarvestTime = math.random(15000,20000)
                FreezeEntityPosition(playerPed, true)
                TriggerEvent('pogressBar:drawBar', HarvestTime, 'Collecting hydrochloric acid..') 
                Wait(HarvestTime)
                harvestedPlants[entity] = true
                TriggerServerEvent('case:server:CollectHydrochloric')
                ClearPedTasks(playerPed)
                FreezeEntityPosition(playerPed, false)
            end
        end
    end
end
-- Search boxes
harvestedPlants2 = {}
boxProp = { "prop_boxpile_07d" }
RegisterNetEvent('case:client:SearchBoxes', function()
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)    
    for i = 1, #boxProp do
        local Box = GetClosestObjectOfType(playerCoords, 0.9, GetHashKey(boxProp[i]), false, false, false)
        local entity = nil
        if DoesEntityExist(Box) then
            entity = Box
            plant    = GetEntityCoords(entity)                
                if not harvestedPlants2[entity] then
                    searchBox(entity)
                else
                    QBCore.Functions.Notify("Box has already been searched...", "error", 3500)
                end
            break
        else
            Wait(1000)
        end
    end
end)
-- Animation to search
function playAnim(animDict, animName, duration)
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do 
      Wait(0) 
    end
    TaskPlayAnim(PlayerPedId(), animDict, animName, 1.0, -1.0, duration, 49, 1, false, false, false)
    RemoveAnimDict(animDict)
end
-- Search boxes
function searchBox(entity)
	local playerPed = PlayerPedId()
    playAnim("anim@amb@business@weed@weed_inspecting_lo_med_hi@", "weed_crouch_checkingleaves_idle_01_inspector", 35000)
	local finished = exports["reload-skillbar"]:taskBar(math.random(5000,7500),math.random(2,4))
    if finished ~= 100 then
		QBCore.Functions.Notify("Failed to search box...", "error", 3500)
		ClearPedTasks(playerPed)
    else
		local finished2 = exports["reload-skillbar"]:taskBar(math.random(2500,5000),math.random(3,5))
        if finished2 ~= 100 then
			QBCore.Functions.Notify("Failed to search box...", "error", 3500)
			ClearPedTasks(playerPed)
        else
			local finished3 = exports["reload-skillbar"]:taskBar(math.random(900,2000),math.random(5,7))
            if finished3 ~= 100 then
				QBCore.Functions.Notify("Failed to search box...", "error", 3500)
				ClearPedTasks(playerPed)
            else
				local HarvestTime = math.random(20000,30000)
                FreezeEntityPosition(playerPed, true)
                TriggerEvent('pogressBar:drawBar', HarvestTime, 'Searching box..') 
                Wait(HarvestTime)
                harvestedPlants2[entity] = true
                TriggerServerEvent('case:server:SearchBoxes')
                ClearPedTasks(playerPed)
                FreezeEntityPosition(playerPed, false)
            end
        end
    end
end
-- Pick cocaine plants
RegisterNetEvent('case:client:ProspectRocks', function()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	local nearbyObject, nearbyID
	for i=1, #methRocks, 1 do
		if GetDistanceBetweenCoords(coords, GetEntityCoords(methRocks[i]), false) < 1.2 then
			nearbyObject, nearbyID = methRocks[i], i
		end
	end
	QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
		if HasItem then
			if nearbyObject and IsPedOnFoot(playerPed) then
				isPickingUp = true
				exports['pogressBar']:drawBar(8500, 'Prospecting rocks..') 
				TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant', 0, false)
				Wait(6500)
				ClearPedTasks(playerPed)
				Wait(1000)
				DeleteObject(nearbyObject) 
				table.remove(methRocks, nearbyID)
				spawnedMeth = spawnedMeth - 1
				TriggerServerEvent('case:server:ProspectRocks')
			else
				QBCore.Functions.Notify('Too far away, move closer..', 'error', 3500)
			end
		else
			QBCore.Functions.Notify('You dont have a trowel to prospect rocks!', 'error', 3500)
		end
	end, "trowel")
end)
-- Get coords
CreateThread(function()
	while true do
		Wait(10)
		local coords = GetEntityCoords(PlayerPedId())
		if GetDistanceBetweenCoords(coords, Config.MethField, true) < 50 then
			SpawnCocainePlants()
			Wait(500)
		else
			Wait(500)
		end
	end
end)
-- Delete spawned plants on stop
AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		for k, v in pairs(methRocks) do
			DeleteObject(v)
		end
	end
end)
-- Spawn plants
function SpawnObject(model, coords, cb)
	local model = (type(model) == 'number' and model or GetHashKey(model))
	RequestModel(model)
	while not HasModelLoaded(model) do
		Wait(1)
	end
    local obj = CreateObject(model, coords.x, coords.y, coords.z, false, false, true)
    SetModelAsNoLongerNeeded(model)
    PlaceObjectOnGroundProperly(obj)
    FreezeEntityPosition(obj, true)
    if cb then
        cb(obj)
    end
end
-- Gen coords for meth rocks
function SpawnCocainePlants()
	while spawnedMeth < 15 do
		Wait(1)
		local rockCoords = GenerateMethCoords()
		SpawnObject('prop_rock_1_i', rockCoords, function(obj)
			table.insert(methRocks, obj)
			spawnedMeth = spawnedMeth + 1
		end)
	end
end 
-- Coord validation
function ValidateMethCoord(rockCoord)
	if spawnedMeth > 0 then
		local validate = true
		for k, v in pairs(methRocks) do
			if GetDistanceBetweenCoords(rockCoord, GetEntityCoords(v), true) < 5 then
				validate = false
			end
		end
		if GetDistanceBetweenCoords(rockCoord, Config.MethField, false) > 50 then
			validate = false
		end
		return validate
	else
		return true
	end
end
-- Generate Box Coords
function GenerateMethCoords()
	while true do
		Wait(1)
		local methCoordX, methCoordY
		math.randomseed(GetGameTimer())
		local modX = math.random(-15, 15)
		Wait(100)
		math.randomseed(GetGameTimer())
		local modY = math.random(-15, 15)
		methCoordX = Config.MethField.x + modX
		methCoordY = Config.MethField.y + modY
		local coordZ = GetCoordZMeth(methCoordX, methCoordY)
		local coord = vector3(methCoordX, methCoordY, coordZ)
		if ValidateMethCoord(coord) then
			return coord
		end
	end
end
-- Check height coords
function GetCoordZMeth(x, y)
	local groundCheckHeights = { 35, 36.0, 37.0, 38.0, 39.0, 40.0, 41.0, 42.0, 43.0, 44.0, 45.0, 46.0, 47.0, 48.0, 49.0, 50.0, 51.0, 52.0, 53.0, 54.0, 55.0 }
	for i, height in ipairs(groundCheckHeights) do
		local foundGround, z = GetGroundZFor_3dCoord(x, y, height)
		if foundGround then
			return z
		end
	end
	return 53.85
end
--[[ Open blackmarket
RegisterNetEvent('inventory:client:OpenDrugShop')
AddEventHandler('inventory:client:OpenDrugShop', function()
    local ShopItems = {}
    ShopItems.label = "Black Market"
    ShopItems.items = Config.BlackMarketItems
    ShopItems.slots = #Config.BlackMarketItems
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "Drug Dealer", ShopItems)
end)]]

RegisterNetEvent('case:client:UseMeth', function()
	local playerPed = PlayerPedId()
	QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
		if HasItem then
				isTakingMeth = true
				exports['pogressBar']:drawBar(5000, 'Smoking meth..') 
				TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_SMOKING_POT", 0, false)
				Wait(5500)
				ClearPedTasks(playerPed)
				Wait(1000)
				TriggerServerEvent("QBCore:Server:RemoveItem", "meth", 1)
				TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["meth"], "remove")
				TriggerServerEvent('hud:server:RelieveStress', 10)
				SetTimecycleModifier("drug_flying_base")
				AddArmourToPed(PlayerPedId(), 10)
				SetEntityHealth(ped, GetEntityHealth(ped) + 10)
				SetPedMotionBlur(ped, true)
				SetPedMovementClipset(ped, "move_m@hipster@a", true)
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.35)
				Wait(1500)
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.25)
				Wait(1500)
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.15)
				Wait(1500)
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.05)
				Citizen.Wait(5*500)
				ClearTimecycleModifier()
		else		
			QBCore.Functions.Notify('You need a lighter to smoke meth..', 'error', 3500)
		end
	end, "lighter")
end)
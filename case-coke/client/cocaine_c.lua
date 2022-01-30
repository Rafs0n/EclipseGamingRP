-------------------------------
---------- CASE#2506 ----------
-------------------------------

local QBCore = exports['qb-core']:GetCoreObject()
local spawnedCocaine = 0
local cocainePlants = {}
local isPickingUp = false
local isProcessing = false

-- Creates blip for cocaine processing ped(uncomment to add the blip)
--[[Citizen.CreateThread(function()
    local blip = AddBlipForCoord(244.28, 374.47, 104.74) -- Change blip coords here
	SetBlipSprite(blip, 51)
	SetBlipDisplay(blip, 4)
	SetBlipScale(blip, 0.7)
	SetBlipAsShortRange(blip, true)
	SetBlipColour(blip, 3)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentSubstringPlayerName("Cocaine Processing") -- Change blip name here
    EndTextCommandSetBlipName(blip)
end)
-- Creates blip for crack processing ped (uncomment to add the blip)
Citizen.CreateThread(function()
    local blip = AddBlipForCoord(-1071.76, -1673.56, 4.48) -- Change blip coords here
	SetBlipSprite(blip, 51)
	SetBlipDisplay(blip, 4)
	SetBlipScale(blip, 0.7)
	SetBlipAsShortRange(blip, true)
	SetBlipColour(blip, 3)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentSubstringPlayerName("Crack Processing") -- Change blip name here
    EndTextCommandSetBlipName(blip)
end)
-- Creates blip for boxes (uncomment to add the blip)
Citizen.CreateThread(function()
    local blip = AddBlipForCoord(-1150.35, -2566.99, 13.94) -- Change blip coords here
	SetBlipSprite(blip, 51)
	SetBlipDisplay(blip, 4)
	SetBlipScale(blip, 0.7)
	SetBlipAsShortRange(blip, true)
	SetBlipColour(blip, 3)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentSubstringPlayerName("Benzocaine Boxes") -- Change blip name here
    EndTextCommandSetBlipName(blip)
end)
-- Creates blip for gasoline (uncomment to add the blip)
Citizen.CreateThread(function()
    local blip = AddBlipForCoord(-1932.35, 3038.86, 32.81) -- Change blip coords here
	SetBlipSprite(blip, 51)
	SetBlipDisplay(blip, 4)
	SetBlipScale(blip, 0.7)
	SetBlipAsShortRange(blip, true)
	SetBlipColour(blip, 3)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentSubstringPlayerName("Illegal Gasoline") -- Change blip name here
    EndTextCommandSetBlipName(blip)
end)
-- Creates blip for cocaine field (uncomment to add the blip)
Citizen.CreateThread(function()
    local blip = AddBlipForCoord(3410.80, 5496.57, 24.45) -- Change blip coords here
	SetBlipSprite(blip, 51)
	SetBlipDisplay(blip, 4)
	SetBlipScale(blip, 0.7)
	SetBlipAsShortRange(blip, true)
	SetBlipColour(blip, 3)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentSubstringPlayerName("Cocaine Field") -- Change blip name here
    EndTextCommandSetBlipName(blip)
end)]]
local cokePed = {
  {5213.74, -5128.32, 5.21,"Mr Chow",248.07,0xB9DD0300,"g_m_m_chiboss_01"}, -- Coke processing ped and location find peds here https://wiki.rage.mp/index.php?title=Peds

}
-- Spawns coke processing ped
Citizen.CreateThread(function()
    for _,v in pairs(cokePed) do
        RequestModel(GetHashKey(v[7]))
        while not HasModelLoaded(GetHashKey(v[7])) do
            Wait(1)
        end
        CokeProcPed =  CreatePed(4, v[6],v[1],v[2],v[3], 3374176, false, true)
        SetEntityHeading(CokeProcPed, v[5])
        FreezeEntityPosition(CokeProcPed, true)
        SetEntityInvincible(CokeProcPed, true)
        SetBlockingOfNonTemporaryEvents(CokeProcPed, true)
        TaskStartScenarioInPlace(CokeProcPed, "WORLD_HUMAN_STAND_MOBILE_UPRIGHT", 0, true) 
    end
end)
local crackPed = {
  {-1078.96, -1679.63, 3.58,"Hector",334.42,0x26EF3426,"g_m_y_mexgoon_01"}, -- Crack processing ped and location find peds here https://wiki.rage.mp/index.php?title=Peds

}
-- Spawns crack processing ped
Citizen.CreateThread(function()
    for _,v in pairs(crackPed) do
        RequestModel(GetHashKey(v[7]))
        while not HasModelLoaded(GetHashKey(v[7])) do
            Wait(1)
        end
        CrackProcPed =  CreatePed(4, v[6],v[1],v[2],v[3], 3374176, false, true)
        SetEntityHeading(CrackProcPed, v[5])
        FreezeEntityPosition(CrackProcPed, true)
        SetEntityInvincible(CrackProcPed, true)
        SetBlockingOfNonTemporaryEvents(CrackProcPed, true)
        TaskStartScenarioInPlace(CrackProcPed, "WORLD_HUMAN_STAND_MOBILE_UPRIGHT", 0, true) 
    end
end)
-- Targeting for coke processing ped
exports['qb-target']:AddTargetModel(`g_m_m_chiboss_01`, {
    options = {
        {
            event = "case-coke:client:CocaineProcessPed",
            icon = "fab fa-drupal",
            label = "Speak with Chow",
        },
    },
distance = 2.5 
})
-- Targeting for crack processing ped
exports['qb-target']:AddTargetModel(`g_m_y_mexgoon_01`, {
    options = {
        {
            event = "case-coke:client:CrackProcessPed",
            icon = "fab fa-drupal",
            label = "Speak with Hector",
        },
    },
distance = 2.5 
})
-- Targeting for gasoline tankers find props here https://gtahash.ru
exports['qb-target']:AddTargetModel(`prop_air_fueltrail2`, {
    options = {
        {
            event = "case-coke:client:CollectIllegalGasoline",
            icon = "fas fa-biohazard",
            label = "Collect Gasoline",
        },
    },
    distance = 2.0
})
-- Targeting for aeroplane carts find props here https://gtahash.ru
exports['qb-target']:AddTargetModel(`prop_air_cargo_01b`, {
    options = {
        {
            event = "case-coke:client:SearchCarts",
            icon = "fas fa-box",
            label = "Search Cart",
        },
    },
    distance = 2.0
})
-- Cocaine plant targetting find props here https://gtahash.ru
exports['qb-target']:AddTargetModel(`prop_bush_dead_02`, {
    options = {
        {
            event = "case-coke:client:PickCocaine",
            icon = "fas fa-cannabis",
            label = "Harvest Cocaine Plant",
        },
    },
    distance = 2.0
})
-- Main cocaine processing menu
RegisterNetEvent('case-coke:client:CocaineProcessPed', function()
    exports['qb-menu']:openMenu({
        {
            header = "Mr Chow",
            txt = "Cocaine you say? Yes I know cocaine!",
            isMenuHeader = true
        },
        {
            header = "Process Cocaine",
            txt = "Process cocaine ingredients into ounces.",
            params = {
                event = "case-coke:client:CocaineProcessing",
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
-- Cocaine processing menu
RegisterNetEvent('case-coke:client:CocaineProcessing', function()
    exports['qb-menu']:openMenu({
        {
            header = "Cocaine Processing",
            txt = "Required:</p>3x Illegal Gasoline</p>3x Benzocaine</p>3x Coca Leaves</p>Needed to process one ounce.",
            isMenuHeader = true
        },
        {
            header = "Process Cocaine",
            txt = "Process cocaine ingredients into ounces.",
            params = {
                event = "case-coke:server:ProcessCocaineOunce",
                isServer = true,
                args = 1
            }
        },
        {
            header = "< Go Back",
            params = {
                event = "case-coke:client:stopCocaineProcessingMenu"
            }
        },
    })
end)
-- Main crack processing menu
RegisterNetEvent('case-coke:client:CrackProcessPed', function()
    exports['qb-menu']:openMenu({
        {
            header = "Hector Gonzales",
            txt = "Crack? Yeah i got you hermano!",
            isMenuHeader = true
        },
        {
            header = "Process Crack",
            txt = "Process Crack ingredients into ounces.",
            params = {
                event = "case-coke:client:CrackProcessing",
            }
        },
		{
            header = "Black Market",
            txt = "Purchase off the book items.",
            params = {
                event = "inventory:client:OpenDrugShop",
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
-- Crack processing menu
RegisterNetEvent('case-coke:client:CrackProcessing', function()
    exports['qb-menu']:openMenu({
        {
            header = "Crack Processing",
            txt = "Required:</p>1x Ounce of Cocaine</p>5x Baking Soda</p>5x Bottles of Water</p>Needed to process one ounce.",
            isMenuHeader = true
        },
        {
            header = "Process Crack",
            txt = "Process crack ingredients into ounces.",
            params = {
                event = "case-coke:server:ProcessCrackOunce",
                isServer = true,
                args = 1
            }
        },
        {
            header = "< Go Back",
            params = {
                event = "case-coke:client:stopCrackProcessingMenu"
            }
        },
    })
end)
-- Stop coke processing menu
RegisterNetEvent('case-coke:client:stopCocaineProcessingMenu', function()
    ClearPedTasks(PlayerPedId())
end)
-- Stop crack processing menu
RegisterNetEvent('case-coke:client:stopCrackProcessingMenu', function()
    ClearPedTasks(PlayerPedId())
end)
-- Stop baggie menu
RegisterNetEvent('case-coke:client:stopCuttingMenu', function()
    ClearPedTasks(PlayerPedId())
end)
-- Use baggie menu
RegisterNetEvent('case-coke:client:CuttingMenu', function()
    TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_PARKING_METER", 3500, false)
    exports['qb-menu']:openMenu({
        {
            header = "Drug Cutting",
            txt = "Coke Requires:</p>28x Drug Bags</p>1x Ounce of Cocaine</p>Crack Requires:</p>50x Drug Bags</p>1x Ounce of Crack",
            isMenuHeader = true
        },
        {
            header = "Process Ounces of Cocaine",
            txt = "Break down ounces into 1g bags.",
            params = {
                event = "case-coke:server:CutDrugs",
                isServer = true,
                args = 1

            }
        },
        {
            header = "Process Ounces of Crack",
            txt = "Break down ounces into 1g bags.",
            params = {
                event = "case-coke:server:CutDrugs",
                isServer = true,
                args = 2
            }
        },
		{ 
            header = "Process Ounces of Meth",
            txt = "Break down ounces into 1g bags.",
            params = {
                event = "case-coke:server:CutDrugs",
                isServer = true,
                args = 3
            }
        },
        {
            header = "< Exit",
            params = {
                event = "case-coke:client:stopCuttingMenu"
            }
        },
    })
end)
-- Collect gasoline event
gasCollected = {}
gasProp = { "prop_air_fueltrail2" }
RegisterNetEvent('case-coke:client:CollectIllegalGasoline', function()
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    for i = 1, #gasProp do
        local Box = GetClosestObjectOfType(playerCoords, 0.9, GetHashKey(gasProp[i]), false, false, false)
        local entity = nil
        if DoesEntityExist(Box) then
            entity = Box
            plant    = GetEntityCoords(entity)                
                if not gasCollected[entity] then
                    searchFuel(entity)
                else
                    QBCore.Functions.Notify("You have already tried this tanker..", "error", 3500)
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
-- Collect fuel
function searchFuel(entity)
	local playerPed = PlayerPedId()
    playAnim("anim@amb@business@weed@weed_inspecting_lo_med_hi@", "weed_crouch_checkingleaves_idle_01_inspector", 35000)
	local finished = exports["reload-skillbar"]:taskBar(math.random(5000,7500),math.random(2,4))
    if finished ~= 100 then
		QBCore.Functions.Notify("Failed to collect gasoline..", "error", 3500)
		ClearPedTasks(playerPed)
    else
		local finished2 = exports["reload-skillbar"]:taskBar(math.random(2500,5000),math.random(3,5))
        if finished2 ~= 100 then
			QBCore.Functions.Notify("Failed to collect gasoline..", "error", 3500)
			ClearPedTasks(playerPed)
        else
			local finished3 = exports["reload-skillbar"]:taskBar(math.random(900,2000),math.random(5,7))
            if finished3 ~= 100 then
				QBCore.Functions.Notify("Failed to collect gasoline..", "error", 3500)
				ClearPedTasks(playerPed)
            else
				local HarvestTime = math.random(15000,20000)
                FreezeEntityPosition(playerPed, true)
                TriggerEvent('pogressBar:drawBar', HarvestTime, 'Collecting gasoline..') 
                Wait(HarvestTime)
                gasCollected[entity] = true
                TriggerServerEvent('case-coke:server:CollectIllegalGasoline')
                ClearPedTasks(playerPed)
                FreezeEntityPosition(playerPed, false)
            end
        end
    end
end
-- Search aeroplane carts
searchedCart = {}
cartProp = { "prop_air_cargo_01b" }
RegisterNetEvent('case-coke:client:SearchCarts', function()
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)   
    for i = 1, #cartProp do
        local Box = GetClosestObjectOfType(playerCoords, 0.9, GetHashKey(cartProp[i]), false, false, false)
        local entity = nil
        if DoesEntityExist(Box) then
            entity = Box
            plant    = GetEntityCoords(entity)                
                if not searchedCart[entity] then
                    searchCart(entity)
                else
                    QBCore.Functions.Notify("You have already searched this cart..", "error", 3500)
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
-- Search carts
function searchCart(entity)
	local playerPed = PlayerPedId()
    playAnim("anim@amb@business@weed@weed_inspecting_lo_med_hi@", "weed_crouch_checkingleaves_idle_01_inspector", 35000)
	local finished = exports["reload-skillbar"]:taskBar(math.random(5000,7500),math.random(2,4))
    if finished ~= 100 then
		QBCore.Functions.Notify("Failed to search cart..", "error", 3500)
		ClearPedTasks(playerPed)
    else
		local finished2 = exports["reload-skillbar"]:taskBar(math.random(2500,5000),math.random(3,5))
        if finished2 ~= 100 then
			QBCore.Functions.Notify("Failed to search cart..", "error", 3500)
			ClearPedTasks(playerPed)
        else
			local finished3 = exports["reload-skillbar"]:taskBar(math.random(900,2000),math.random(5,7))
            if finished3 ~= 100 then
				QBCore.Functions.Notify("Failed to search cart..", "error", 3500)
				ClearPedTasks(playerPed)
            else
				local HarvestTime = math.random(20000,30000)
                FreezeEntityPosition(playerPed, true)
                TriggerEvent('pogressBar:drawBar', HarvestTime, 'Searching aeroplane cart..') 
                Wait(HarvestTime)
                searchedCart[entity] = true
                TriggerServerEvent('case-coke:server:SearchCarts')
                ClearPedTasks(playerPed)
                FreezeEntityPosition(playerPed, false)
            end
        end
    end
end
-- Pick cocaine plants
RegisterNetEvent('case-coke:client:PickCocaine', function()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	local nearbyObject, nearbyID
	for i=1, #cocainePlants, 1 do
		if GetDistanceBetweenCoords(coords, GetEntityCoords(cocainePlants[i]), false) < 1.2 then
			nearbyObject, nearbyID = cocainePlants[i], i
		end
	end
	QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
		if HasItem then
			if nearbyObject and IsPedOnFoot(playerPed) then
				isPickingUp = true
				exports['pogressBar']:drawBar(8500, 'Harvesting cocaine plant..') 
				TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant', 0, false)
				Wait(6500)
				ClearPedTasks(playerPed)
				Wait(1000)
				DeleteObject(nearbyObject) 
				table.remove(cocainePlants, nearbyID)
				spawnedCocaine = spawnedCocaine - 1
				TriggerServerEvent('case-coke:server:PickCocaine')
			else
				QBCore.Functions.Notify('Too far away, move closer..', 'error', 3500)
			end
		else
			QBCore.Functions.Notify('You dont have a trowel to harvest the coca plants!', 'error', 3500)
		end
	end, "trowel")
end)
-- Get coords
CreateThread(function()
	while true do
		Wait(10)
		local coords = GetEntityCoords(PlayerPedId())
		if GetDistanceBetweenCoords(coords, Config.CocaineField, true) < 50 then
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
		for k, v in pairs(cocainePlants) do
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
-- Gen coords for plants
function SpawnCocainePlants()
	while spawnedCocaine < 15 do
		Wait(1)
		local weedCoords = GenerateCocaineCoords()
		SpawnObject('prop_bush_dead_02', weedCoords, function(obj)
			table.insert(cocainePlants, obj)
			spawnedCocaine = spawnedCocaine + 1
		end)
	end
end 
-- Coord validation
function ValidateCocaineCoord(plantCoord)
	if spawnedCocaine > 0 then
		local validate = true
		for k, v in pairs(cocainePlants) do
			if GetDistanceBetweenCoords(plantCoord, GetEntityCoords(v), true) < 5 then
				validate = false
			end
		end
		if GetDistanceBetweenCoords(plantCoord, Config.CocaineField, false) > 50 then
			validate = false
		end
		return validate
	else
		return true
	end
end
-- Generate Box Coords
function GenerateCocaineCoords()
	while true do
		Wait(1)
		local cokeCoordX, cokeCoordY
		math.randomseed(GetGameTimer())
		local modX = math.random(-15, 15)
		Wait(100)
		math.randomseed(GetGameTimer())
		local modY = math.random(-15, 15)
		cokeCoordX = Config.CocaineField.x + modX
		cokeCoordY = Config.CocaineField.y + modY
		local coordZ = GetCoordZCocaine(cokeCoordX, cokeCoordY)
		local coord = vector3(cokeCoordX, cokeCoordY, coordZ)
		if ValidateCocaineCoord(coord) then
			return coord
		end
	end
end
-- Check height coords
function GetCoordZCocaine(x, y)
	local groundCheckHeights = { 35, 36.0, 37.0, 38.0, 39.0, 40.0, 41.0, 42.0, 43.0, 44.0, 45.0, 46.0, 47.0, 48.0, 49.0, 50.0, 51.0, 52.0, 53.0, 54.0, 55.0 }
	for i, height in ipairs(groundCheckHeights) do
		local foundGround, z = GetGroundZFor_3dCoord(x, y, height)
		if foundGround then
			return z
		end
	end
	return 53.85
end
-- Open pawnshop
RegisterNetEvent('inventory:client:OpenDrugShop')
AddEventHandler('inventory:client:OpenDrugShop', function()
    local ShopItems = {}
    ShopItems.label = "Black Market"
    ShopItems.items = Config.BlackMarketItems
    ShopItems.slots = #Config.BlackMarketItems
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "Drug Dealer", ShopItems)
end)
-- Cocaine use effect
RegisterNetEvent('case-coke:client:UseCocaine', function()
	local playerPed = PlayerPedId()
	QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
		if HasItem then
				isTakingCocaine = true
				exports['pogressBar']:drawBar(5000, 'Taking cocaine..') 
				TaskPlayAnim(playerPed, "trev_smoking_meth", 0, false)
				Wait(5000)
				ClearPedTasks(playerPed)
				TriggerServerEvent("QBCore:Server:RemoveItem", "cokebaggy", 1)
				TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cokebaggy"], "remove")
				TriggerServerEvent('hud:server:RelieveStress', 10)
				TriggerEvent("evidence:client:SetStatus", "widepupils", 200)
				SetPedMovementClipset(ped, "move_m@hurry@a", true)
				SetRunSprintMultiplierForPlayer(PlayerId(), 1.5)
				RestorePlayerStamina(PlayerId(), 1.0)
				AlienEffect()
				SetRunSprintMultiplierForPlayer(PlayerId(), 1.3)
				RestorePlayerStamina(PlayerId(), 1.0)
				SetFlash(0, 0, 500, 7000, 500)
				SetRunSprintMultiplierForPlayer(PlayerId(), 1.1)
				RestorePlayerStamina(PlayerId(), 1.0)
				SetPedMotionBlur(ped, true)
				SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
				RestorePlayerStamina(PlayerId(), 1.0)
				Citizen.Wait(5*500)
				ClearTimecycleModifier()
		else		
			QBCore.Functions.Notify('You dont have any cocaine..', 'error', 3500)
		end
	end, "cokebaggy")
end)
-- Crack use effect
RegisterNetEvent('case-coke:client:UseCrack', function()
	local playerPed = PlayerPedId()
	QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
		if HasItem then
				isTakingCrack = true
				exports['pogressBar']:drawBar(5000, 'Smoking crack..') 
				TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_SMOKING_POT", 0, false)
				Wait(5500)
				ClearPedTasks(playerPed)
				TriggerServerEvent("QBCore:Server:RemoveItem", "crack_baggy", 1)
				TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["crack_baggy"], "remove")
				TriggerEvent("evidence:client:SetStatus", "widepupils", 300)
				TriggerServerEvent('hud:server:RelieveStress', 40)
				SetEntityHealth(ped, GetEntityHealth(ped) + 30)
				SetRunSprintMultiplierForPlayer(PlayerId(), 1.5)
				AddArmourToPed(PlayerPedId(), 10)
				SetTimecycleModifier("drug_flying_base")
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.90)
				Wait(1500)
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.45)
				Wait(1500)
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.25)
				Wait(1000)
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.155)
				AlienEffect()
				SetRunSprintMultiplierForPlayer(PlayerId(), 1.1)
				SetPedMotionBlur(ped, true)
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.35)
				Wait(1000)
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.25)
				Wait(1500)
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.15)
				Wait(1500)
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.05)
				Citizen.Wait(5*500)
				ClearTimecycleModifier()
		else		
			QBCore.Functions.Notify('You need a lighter to smoke crack..', 'error', 3500)
		end
	end, "lighter")
end)

function AlienEffect()
    StartScreenEffect("DrugsMichaelAliensFightIn", 3.0, 0)
    Citizen.Wait(math.random(5000, 8000))
    StartScreenEffect("DrugsMichaelAliensFight", 3.0, 0)
    Citizen.Wait(math.random(5000, 8000))    
    StartScreenEffect("DrugsMichaelAliensFightOut", 3.0, 0)
    StopScreenEffect("DrugsMichaelAliensFightIn")
    StopScreenEffect("DrugsMichaelAliensFight")
    StopScreenEffect("DrugsMichaelAliensFightOut")
end
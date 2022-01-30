-------------------------------
---------- CASE#2506 ----------
-------------------------------

local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('case:server:CollectHydrochloric', function() 
    local src = source
    local Player  = QBCore.Functions.GetPlayer(src)
    local quantity = math.random(1, 4)
	if (90 >= math.random(1, 100)) then
        if Player.Functions.AddItem("hydrochloricacid", quantity, slot, {["quality"] = 100}) then
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["hydrochloricacid"], "add", quantity)
			TriggerClientEvent('QBCore:Notify', src, 'You successfully collected some hydrochloric acid!', 'success')
		end	
    else
        TriggerClientEvent('QBCore:Notify', src, 'Looks like this barrel is empty..', 'error')
	end
end)

-- Search boxes
RegisterServerEvent('case:server:SearchBoxes', function() 
    local src = source
    local Player  = QBCore.Functions.GetPlayer(src)
	local drugItem = Config.DrugItems[math.random(1, #Config.DrugItems)]
	local randomItem = Config.RandomItems[math.random(1, #Config.RandomItems)]
	local randomItem2 = Config.RandomItems[math.random(1, #Config.RandomItems)]
	local randomItem3 = Config.RandomItems[math.random(1, #Config.RandomItems)]
	local randomItem4 = Config.RandomItems[math.random(1, #Config.RandomItems)]
    local quantity = math.random(1, 3)
	if (60>= math.random(1, 100)) then
        if Player.Functions.AddItem(drugItem, math.random(1,3)) then   
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[drugItem], 'add')
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randomItem1], 'add')
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randomItem2], 'add')
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randomItem3], 'add')
        else
            TriggerClientEvent('QBCore:Notify', src, 'Your pockets are full..', 'error')
        end
	elseif (70 >= math.random(1, 100)) then
        if Player.Functions.AddItem(randomItem, math.random(1,3)) then   
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randomItem1], 'add')
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randomItem2], 'add')
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randomItem3], 'add')
        else
            TriggerClientEvent('QBCore:Notify', src, 'Your pockets are full..', 'error')
        end
    elseif (80 >= math.random(1, 100)) then
        if Player.Functions.AddItem(randomItem, math.random(1,3)) then   
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randomItem2], 'add')
        else
            TriggerClientEvent('QBCore:Notify', src, 'Your pockets are full..', 'error')
        end
	end
		if Player.Functions.AddItem(randomItem, math.random(1,2)) then   
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randomItem], 'add')		
	else
        TriggerClientEvent('QBCore:Notify', src, 'Your pockets are full..', 'error')
    end
end)
-- Prospect rocks
RegisterServerEvent('case:server:ProspectRocks', function() 
    local src = source
    local Player  = QBCore.Functions.GetPlayer(src)
	local randomItem = Config.RandomItems[math.random(1, #Config.RandomItems)]
	local randomItem2 = Config.RandomItems[math.random(1, #Config.RandomItems)]
	local randomItem3 = Config.RandomItems[math.random(1, #Config.RandomItems)]
    local quantity = math.random(1, 3)
	if (40 >= math.random(1, 100)) then
        if Player.Functions.AddItem("lithium", math.random(1,3)) and Player.Functions.AddItem(randomItem, math.random(1,3)) and Player.Functions.AddItem(randomItem2, math.random(1,3)) and Player.Functions.AddItem(randomItem3, math.random(1,3))then   
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["lithium"], 'add')
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randomItem], 'add')
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randomItem2], 'add')
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randomItem3], 'add')
        else
            TriggerClientEvent('QBCore:Notify', src, 'Your pockets are full..', 'error')
        end
	elseif (60 >= math.random(1, 100)) then
        if Player.Functions.AddItem(randomItem2, math.random(1,3)) and Player.Functions.AddItem(randomItem3, math.random(1,3)) then   
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randomItem2], 'add')
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randomItem3], 'add')
        else
            TriggerClientEvent('QBCore:Notify', src, 'Your pockets are full..', 'error')
        end
    elseif (75 >= math.random(1, 100)) then
        if Player.Functions.AddItem(randomItem2, math.random(1,3)) then   
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randomItem2], 'add')
        else
            TriggerClientEvent('QBCore:Notify', src, 'Your pockets are full..', 'error')
        end
	end
		if Player.Functions.AddItem(randomItem, math.random(1,2)) then   
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randomItem], 'add')		
	else
        TriggerClientEvent('QBCore:Notify', src, 'Your pockets are full..', 'error')
    end
end)

-- Process meth at ped
RegisterServerEvent('case:server:ProcessMethOunce')
AddEventHandler('case:server:ProcessMethOunce', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	local Item = Player.Functions.GetItemByName('lithium')
	local Item2 = Player.Functions.GetItemByName('hydrochloricacid')
	local Item3 = Player.Functions.GetItemByName('acetone')
	local packageTime = 5500
	if Item.amount >= 3 and Item2.amount >= 3 and Item3.amount >= 3 then
		Player.Functions.RemoveItem('lithium', 3)
		Player.Functions.RemoveItem('hydrochloricacid', 3)
		Player.Functions.RemoveItem('acetone', 3)
		TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['lithium'], "remove")
		TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['hydrochloricacid'], "remove")
		TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['acetone'], "remove")
		TriggerClientEvent('pogressBar:drawBar', src, packageTime, 'Processing meth..')
                        SetTimeout(packageTime, function()
                            if Player.Functions.AddItem('meth_1oz', 1, nil, info, {["quality"] = 100}) then
                                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["meth_1oz"], "add")
								TriggerClientEvent('QBCore:Notify', src, 'You processed an ounce of meth!', 'success')
                                TriggerClientEvent('case:client:MethProcessingPed', src)
                            else
                                TriggerClientEvent('QBCore:Notify', src, 'Your pockets are full..', 'error')
                            end
                        end)
            else
                TriggerClientEvent('QBCore:Notify', src, "You dont have enough ingredients to process meth..", 'error')
                TriggerClientEvent('case:client:MethProcessingPed', src)
    end
end)

-- Process ounces to grams
--[[RegisterServerEvent('case:server:CutDrugs', function(args) 
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	local args = tonumber(args)
    local removeAmount = 1
    local returnAmount = math.random (20,28)
    local baggieAmount = 28
    local packageTime = 7500
    if args == 1 then 
        local meth = Player.Functions.GetItemByName("meth_1oz") 
        if meth ~= nil then
            if meth.amount >= removeAmount then
                local baggies = Player.Functions.GetItemByName("empty_weed_bag") 
                if baggies ~= nil then
                    if baggies.amount >= baggieAmount then
                        Player.Functions.RemoveItem("meth_1oz", removeAmount)
                        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['meth_1oz'], "remove", removeAmount)
						TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['empty_weed_bag'], "remove", baggieAmount)
                        TriggerClientEvent('pogressBar:drawBar', src, packageTime, 'Cutting drugs..')
                        SetTimeout(packageTime, function()
                            if Player.Functions.AddItem('meth', returnAmount, nil, info, {["quality"] = 100}) then
                                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["meth"], "add", returnAmount)
								TriggerClientEvent('QBCore:Notify', src, 'You cut an ounce of meth!', 'success')
                                TriggerClientEvent('case:client:CuttingMenu', src)
                            else
                                TriggerClientEvent('QBCore:Notify', src, 'Your pockets are full..', 'error')
                            end
                        end)
                    else
                        TriggerClientEvent('QBCore:Notify', src, "You need atleast 28 baggies..", 'error')
                        TriggerClientEvent('case:client:CuttingMenu', src)
                    end
                else
                    TriggerClientEvent('QBCore:Notify', src, "You need atleast 28 baggies..", "error")
                    TriggerClientEvent('case:client:CuttingMenu', src)
                end
            else
                TriggerClientEvent('QBCore:Notify', src, "You dont have enough ounces of meth..", 'error')
                TriggerClientEvent('case:client:CuttingMenu', src)
            end
        else
            TriggerClientEvent('QBCore:Notify', src, "You dont have any ounces of meth..", "error")
            TriggerClientEvent('case:client:CuttingMenu', src)
        end
    end
end)
-- Drug bags
QBCore.Functions.CreateUseableItem("drug_cuttingkit", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    local scaleCheck = Player.Functions.GetItemByName('drug_scales')
    if scaleCheck ~= nil then
        TriggerClientEvent('case:client:CuttingMenu', source)
    else
        TriggerClientEvent('QBCore:Notify', source, "You dont have a scale", 'error')
    end
end)]]
-- Use meth
QBCore.Functions.CreateUseableItem("meth", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName(item.name) ~= nil then
        TriggerClientEvent("case:client:UseMeth", source)
    end
end)
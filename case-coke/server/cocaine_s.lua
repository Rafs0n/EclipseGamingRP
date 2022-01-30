-------------------------------
---------- CASE#2506 ----------
-------------------------------

local QBCore = exports['qb-core']:GetCoreObject()

-- Collect gasoline from tankers
RegisterServerEvent('case-coke:server:CollectIllegalGasoline', function() 
    local src = source
    local Player  = QBCore.Functions.GetPlayer(src)
    local quantity = math.random(1, 3)
	if (60 >= math.random(1, 100)) then
        if Player.Functions.AddItem("illegalgasoline", quantity, slot, {["quality"] = 100}) then
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["illegalgasoline"], "add", quantity)
			TriggerClientEvent('QBCore:Notify', src, 'You successfully collected some gasoline!', 'success')
		end	
    else
        TriggerClientEvent('QBCore:Notify', src, 'Looks like this tanker is empty..', 'error')
	end
end)

-- Search aeroplane carts adjust items in config
RegisterServerEvent('case-coke:server:SearchCarts', function() 
    local src = source
    local Player  = QBCore.Functions.GetPlayer(src)
	local drugItem = Config.DrugItems[math.random(1, #Config.DrugItems)]
	local cartItem = Config.CartItems[math.random(1, #Config.CartItems)]
	local cartItem2 = Config.CartItems[math.random(1, #Config.CartItems)]
	local cartItem3 = Config.CartItems[math.random(1, #Config.CartItems)]
    local quantity = math.random(1, 3)
	if (60>= math.random(1, 100)) then
        if Player.Functions.AddItem(drugItem, math.random(1,3)) and Player.Functions.AddItem(cartItem, math.random(1,3)) and Player.Functions.AddItem(cartItem2, math.random(1,3)) and Player.Functions.AddItem(cartItem3, math.random(1,3))then   
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[drugItem], 'add')
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[cartItem2], 'add')
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[cartItem3], 'add')
        else
            TriggerClientEvent('QBCore:Notify', src, 'Your pockets are full..', 'error')
        end
	elseif (70 >= math.random(1, 100)) then
        if Player.Functions.AddItem(cartItem, math.random(1,3)) and Player.Functions.AddItem(cartItem2, math.random(1,3)) then   
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[cartItem], 'add')
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[cartItem2], 'add')
        else
            TriggerClientEvent('QBCore:Notify', src, 'Your pockets are full..', 'error')
        end
    elseif (80 >= math.random(1, 100)) then
        if Player.Functions.AddItem(cartItem, math.random(1,3)) then   
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[cartItem], 'add')
        else
            TriggerClientEvent('QBCore:Notify', src, 'Your pockets are full..', 'error')
        end
	else
        TriggerClientEvent('QBCore:Notify', src, 'Looks like this cart is empty..', 'error')
	end
end)
-- Pick cocaleaf 
RegisterServerEvent('case-coke:server:PickCocaine', function() 
    local src = source
    local Player  = QBCore.Functions.GetPlayer(src)
    local quantity = math.random(1, 2)
	if (60 >= math.random(1, 100)) then
        if Player.Functions.AddItem("cocaleaf", math.random(1,2)) then   
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["cocaleaf"], 'add')
        else
            TriggerClientEvent('QBCore:Notify', src, 'Your pockets are full..', 'error')
        end		
	else
        TriggerClientEvent('QBCore:Notify', src, 'You destroyed the plant..', 'error')
    end
end)
-- Process cocaine ounces at ped
RegisterServerEvent('case-coke:server:ProcessCocaineOunce')
AddEventHandler('case-coke:server:ProcessCocaineOunce', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	local Item = Player.Functions.GetItemByName('cocaleaf')
	local Item2 = Player.Functions.GetItemByName('benzocaine')
	local Item3 = Player.Functions.GetItemByName('illegalgasoline')
	local packageTime = 5500
	if Item.amount >= 3 and Item2.amount >= 3 and Item3.amount >= 3 then
		Player.Functions.RemoveItem('cocaleaf', 3)
		Player.Functions.RemoveItem('benzocaine', 3)
		Player.Functions.RemoveItem('illegalgasoline', 3)
		TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['cocaleaf'], "remove")
		TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['benzocaine'], "remove")
		TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['illegalgasoline'], "remove")
		TriggerClientEvent('pogressBar:drawBar', src, packageTime, 'Processing cocaine..')
                        SetTimeout(packageTime, function()
                            if Player.Functions.AddItem('coke_1oz', 1, nil, info, {["quality"] = 100}) then
                                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["coke_1oz"], "add")
								TriggerClientEvent('QBCore:Notify', src, 'You processed an ounce of cocaine!', 'success')
                                TriggerClientEvent('case-coke:client:CocaineProcessingPed', src)
                            else
                                TriggerClientEvent('QBCore:Notify', src, 'Your pockets are full..', 'error')
                            end
                        end)
            else
                TriggerClientEvent('QBCore:Notify', src, "You dont have enough ingredients to process cocaine..", 'error')
                TriggerClientEvent('case-coke:client:CocaineProcessingPed', src)
    end
end)
-- Process crack ounces at ped
RegisterServerEvent('case-coke:server:ProcessCrackOunce')
AddEventHandler('case-coke:server:ProcessCrackOunce', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	local Item = Player.Functions.GetItemByName('coke_1oz')
	local Item2 = Player.Functions.GetItemByName('sodiumbicarbonate')
	local Item3 = Player.Functions.GetItemByName('water_bottle')
	local packageTime = 5500
	if Item.amount >= 1 and Item2.amount >= 5 and Item3.amount >= 5 then
		Player.Functions.RemoveItem('coke_1oz', 1)
		Player.Functions.RemoveItem('sodiumbicarbonate', 5)
		Player.Functions.RemoveItem('water_bottle', 5)
		TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['coke_1oz'], "remove")
		TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['sodiumbicarbonate'], "remove")
		TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['water_bottle'], "remove")
		TriggerClientEvent('pogressBar:drawBar', src, packageTime, 'Processing crack cocaine..')
                        SetTimeout(packageTime, function()
                            if Player.Functions.AddItem('crack_1oz', 1, nil, info, {["quality"] = 100}) then
                                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["crack_1oz"], "add")
								TriggerClientEvent('QBCore:Notify', src, 'You processed an ounce of crack cocaine!', 'success')
                                TriggerClientEvent('case-coke:client:CrackProcessingPed', src)
                            else
                                TriggerClientEvent('QBCore:Notify', src, 'Your pockets are full..', 'error')
                            end
                        end)
            else
                TriggerClientEvent('QBCore:Notify', src, "You dont have enough ingredients to process crack cocaine..", 'error')
                TriggerClientEvent('case-coke:client:CrackProcessingPed', src)
    end
end)

-- Cut ounces to grams
RegisterServerEvent('case-coke:server:CutDrugs', function(args) 
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	local args = tonumber(args)
    local removeAmount = 1
    local returnAmount = math.random (20,28)
	local returnAmount2 = math.random (30,50)
    local baggieAmount = 28
	local baggieAmount2 = 50
    local packageTime = 7500
    if args == 1 then 
        local cocaine = Player.Functions.GetItemByName("coke_1oz") 
        if cocaine ~= nil then
            if cocaine.amount >= removeAmount then
                local baggies = Player.Functions.GetItemByName("empty_weed_bag") 
                if baggies ~= nil then
                    if baggies.amount >= baggieAmount then
                        Player.Functions.RemoveItem("coke_1oz", removeAmount)
						Player.Functions.RemoveItem("empty_weed_bag", returnAmount)
                        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['coke_1oz'], "remove", removeAmount)
						TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['empty_weed_bag'], "remove", returnAmount)
                        TriggerClientEvent('pogressBar:drawBar', src, packageTime, 'Cutting drugs..')
                        SetTimeout(packageTime, function()
                            if Player.Functions.AddItem('cokebaggy', returnAmount, nil, info, {["quality"] = 100}) then
                                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["cokebaggy"], "add", returnAmount)
								TriggerClientEvent('QBCore:Notify', src, 'You cut an ounce of cocaine!', 'success')
                                TriggerClientEvent('case-coke:client:CuttingMenu', src)
                            else
                                TriggerClientEvent('QBCore:Notify', src, 'Your pockets are full..', 'error')
                            end
                        end)
                    else
                        TriggerClientEvent('QBCore:Notify', src, "You need atleast 28 baggies..", 'error')
                        TriggerClientEvent('case-coke:client:CuttingMenu', src)
                    end
                else
                    TriggerClientEvent('QBCore:Notify', src, "You need atleast 28 baggies..", "error")
                    TriggerClientEvent('case-coke:client:CuttingMenu', src)
                end
            else
                TriggerClientEvent('QBCore:Notify', src, "You dont have enough ounces of cocaine..", 'error')
                TriggerClientEvent('case-coke:client:CuttingMenu', src)
            end
        else
            TriggerClientEvent('QBCore:Notify', src, "You dont have any ounces of cocaine..", "error")
            TriggerClientEvent('case-coke:client:CuttingMenu', src)
        end
	elseif args == 2 then 
        local crack = Player.Functions.GetItemByName("crack_1oz") 
        if crack ~= nil then
            if crack.amount >= removeAmount then
                local baggies = Player.Functions.GetItemByName("empty_weed_bag") 
                if baggies ~= nil then
                    if baggies.amount >= baggieAmount2 then
                        Player.Functions.RemoveItem("crack_1oz", removeAmount)
						Player.Functions.RemoveItem("empty_weed_bag", returnAmount2)
                        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['crack_1oz'], "remove", removeAmount)
						TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['empty_weed_bag'], "remove", returnAmount2)
                        TriggerClientEvent('pogressBar:drawBar', src, packageTime, 'Cutting drugs..')
                        SetTimeout(packageTime, function()
                            if Player.Functions.AddItem('crack_baggy', returnAmount2, nil, info, {["quality"] = 100}) then
                                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["crack_baggy"], "add", returnAmount2)
								TriggerClientEvent('QBCore:Notify', src, 'You cut an ounce of crack!', 'success')
                                TriggerClientEvent('case-coke:client:CuttingMenu', src)
                            else
                                TriggerClientEvent('QBCore:Notify', src, 'Your pockets are full..', 'error')
                            end
                        end)
                    else
                        TriggerClientEvent('QBCore:Notify', src, "You need atleast 50 baggies..", 'error')
                        TriggerClientEvent('case-coke:client:CuttingMenu', src)
                    end
                else
                    TriggerClientEvent('QBCore:Notify', src, "You need atleast 50 baggies..", "error")
                    TriggerClientEvent('case-coke:client:CuttingMenu', src)
                end
            else
                TriggerClientEvent('QBCore:Notify', src, "You dont have enough ounces of crack..", 'error')
                TriggerClientEvent('case-coke:client:CuttingMenu', src)
            end
        else
            TriggerClientEvent('QBCore:Notify', src, "You dont have any ounces of crack..", "error")
            TriggerClientEvent('case-coke:client:CuttingMenu', src)
        end
	elseif args == 3 then 
        local meth = Player.Functions.GetItemByName("meth_1oz") 
        if meth ~= nil then
            if meth.amount >= removeAmount then
                local baggies = Player.Functions.GetItemByName("empty_weed_bag") 
                if baggies ~= nil then
                    if baggies.amount >= baggieAmount then
                        Player.Functions.RemoveItem("meth_1oz", removeAmount)
						Player.Functions.RemoveItem("empty_weed_bag", returnAmount)
                        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['meth_1oz'], "remove", removeAmount)
						TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['empty_weed_bag'], "remove", returnAmount)
                        TriggerClientEvent('pogressBar:drawBar', src, packageTime, 'Cutting drugs..')
                        SetTimeout(packageTime, function()
                            if Player.Functions.AddItem('meth', returnAmount, nil, info, {["quality"] = 100}) then
                                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["meth"], "add", returnAmount)
								TriggerClientEvent('QBCore:Notify', src, 'You cut an ounce of meth!', 'success')
                                TriggerClientEvent('case-coke:client:CuttingMenu', src)
                            else
                                TriggerClientEvent('QBCore:Notify', src, 'Your pockets are full..', 'error')
                            end
                        end)
                    else
                        TriggerClientEvent('QBCore:Notify', src, "You need atleast 28 baggies..", 'error')
                        TriggerClientEvent('case-coke:client:CuttingMenu', src)
                    end
                else
                    TriggerClientEvent('QBCore:Notify', src, "You need atleast 28 baggies..", "error")
                    TriggerClientEvent('case-coke:client:CuttingMenu', src)
                end
            else
                TriggerClientEvent('QBCore:Notify', src, "You dont have enough ounces of meth..", 'error')
                TriggerClientEvent('case-coke:client:CuttingMenu', src)
            end
        else
            TriggerClientEvent('QBCore:Notify', src, "You dont have any ounces of meth..", "error")
            TriggerClientEvent('case-coke:client:CuttingMenu', src)
        end	
    end
end)

-- Drug cutting kit
QBCore.Functions.CreateUseableItem("drug_cuttingkit", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    local scaleCheck = Player.Functions.GetItemByName('drug_scales')
    if scaleCheck ~= nil then
        TriggerClientEvent('case-coke:client:CuttingMenu', source)
    else
        TriggerClientEvent('QBCore:Notify', source, "You dont have a scale", 'error')
    end
end)
-- Use cocaine
QBCore.Functions.CreateUseableItem("cokebaggy", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName(item.name) ~= nil then
        TriggerClientEvent("case-coke:client:UseCocaine", source)
		TriggerClientEvent('QBCore:Notify', src, "You took some cocaine!", "success")
    end
end)
-- Use crack
QBCore.Functions.CreateUseableItem("crack_baggy", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName(item.name) ~= nil then
        TriggerClientEvent("case-coke:client:UseCrack", source)
		TriggerClientEvent('QBCore:Notify', src, "You smoked some crack!", "success")
    end
end)

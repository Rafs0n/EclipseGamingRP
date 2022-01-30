-------------------------------
---------- CASE#2506 ----------
-------------------------------

local QBCore = exports['qb-core']:GetCoreObject()

local PlantsLoaded = false

-- Plant seeds
QBCore.Functions.CreateUseableItem("weed_skunk_seed", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.GetItemByName('weed_pot') ~= nil then
    item = Player.Functions.GetItemByName('weed_pot').amount
    TriggerClientEvent('case-outdoorweed:client:SeedPlanted', src, 'skunk')
    Player.Functions.RemoveItem('weed_skunk_seed', 1)
	Player.Functions.RemoveItem('weed_pot', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weed_skunk_seed'], "remove")
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weed_pot'], "remove")
	else
	TriggerClientEvent('QBCore:Notify', src, "You dont have any pots to plant seeds", "error")
	end
end)
QBCore.Functions.CreateUseableItem("weed_og-kush_seed", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.GetItemByName('weed_pot') ~= nil then
    item = Player.Functions.GetItemByName('weed_pot').amount
    TriggerClientEvent('case-outdoorweed:client:SeedPlanted', src, 'og-kush')
    Player.Functions.RemoveItem('weed_og-kush_seed', 1)
	Player.Functions.RemoveItem('weed_pot', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weed_og-kush_seed'], "remove")
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weed_pot'], "remove")
	else
	TriggerClientEvent('QBCore:Notify', src, "You dont have any pots to plant seeds", "error")
	end
end)
QBCore.Functions.CreateUseableItem("weed_white-widow_seed", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.GetItemByName('weed_pot') ~= nil then
    item = Player.Functions.GetItemByName('weed_pot').amount
    TriggerClientEvent('case-outdoorweed:client:SeedPlanted', src, 'white-widow')
    Player.Functions.RemoveItem('weed_white-widow_seed', 1)
	Player.Functions.RemoveItem('weed_pot', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weed_white-widow_seed'], "remove")
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weed_pot'], "remove")
	else
	TriggerClientEvent('QBCore:Notify', src, "You dont have any pots to plant seeds", "error")
	end
end)
QBCore.Functions.CreateUseableItem("weed_ak47_seed", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.GetItemByName('weed_pot') ~= nil then
    item = Player.Functions.GetItemByName('weed_pot').amount
    TriggerClientEvent('case-outdoorweed:client:SeedPlanted', src, 'ak47')
    Player.Functions.RemoveItem('weed_ak47_seed', 1)
	Player.Functions.RemoveItem('weed_pot', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weed_ak47_seed'], "remove")
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weed_pot'], "remove")
	else
	TriggerClientEvent('QBCore:Notify', src, "You dont have any pots to plant seeds", "error")
	end
end)
QBCore.Functions.CreateUseableItem("weed_amnesia_seed", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.GetItemByName('weed_pot') ~= nil then
    item = Player.Functions.GetItemByName('weed_pot').amount
    TriggerClientEvent('case-outdoorweed:client:SeedPlanted', src, 'amnesia')
    Player.Functions.RemoveItem('weed_amnesia_seed', 1)
	Player.Functions.RemoveItem('weed_pot', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weed_amnesia_seed'], "remove")
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weed_pot'], "remove")
	else
	TriggerClientEvent('QBCore:Notify', src, "You dont have any pots to plant seeds", "error")
	end
end)
QBCore.Functions.CreateUseableItem("weed_purple-haze_seed", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.GetItemByName('weed_pot') ~= nil then
    item = Player.Functions.GetItemByName('weed_pot').amount
    TriggerClientEvent('case-outdoorweed:client:SeedPlanted', src, 'purple-haze')
    Player.Functions.RemoveItem('weed_purple-haze_seed', 1)
	Player.Functions.RemoveItem('weed_pot', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weed_purple-haze_seed'], "remove")
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weed_pot'], "remove")
	else
	TriggerClientEvent('QBCore:Notify', src, "You dont have any pots to plant seeds", "error")
	end
end)
-- Make joints
QBCore.Functions.CreateUseableItem("weed_skunk", function(source, item) 
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local rollingpaper = Player.Functions.GetItemByName('rolling_paper')
    if rollingpaper ~= nil and not alreadyrolling then
        alreadyrolling = true
	    TriggerClientEvent('pogressBar:drawBar', src, 3700, 'Rolling up some skunk..')
	    Citizen.Wait(3700)
	    alreadyrolling = false
        Player.Functions.RemoveItem('weed_skunk', 1)
        Player.Functions.RemoveItem('rolling_paper', 3)
        Player.Functions.AddItem('weed_skunk_joint', 3, slot, {["quality"] = 100})
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weed_skunk'], "remove", 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['rolling_paper'], "remove", 3)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weed_skunk_joint'], "add", 3)
    elseif alreadyrolling then
        TriggerClientEvent('QBCore:Notify', src, "You are already rolling a Joint'", 'error')
    else    
        TriggerClientEvent('QBCore:Notify', src, "You dont have any rolling papers!", 'error')
    end
end)
QBCore.Functions.CreateUseableItem("weed_og-kush", function(source, item) 
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local rollingpaper = Player.Functions.GetItemByName('rolling_paper')
    if rollingpaper ~= nil and not alreadyrolling then
        alreadyrolling = true
	    TriggerClientEvent('pogressBar:drawBar', src, 3700, 'Rolling up some og kush..')
	    Citizen.Wait(3700)
	    alreadyrolling = false
        Player.Functions.RemoveItem('weed_og-kush', 1)
        Player.Functions.RemoveItem('rolling_paper', 3)
        Player.Functions.AddItem('weed_og-kush_joint', 3, slot, {["quality"] = 100})
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weed_og-kush'], "remove", 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['rolling_paper'], "remove", 3)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weed_og-kush_joint'], "add", 3)
    elseif alreadyrolling then
        TriggerClientEvent('QBCore:Notify', src, "You are already rolling a Joint'", 'error')
    else    
        TriggerClientEvent('QBCore:Notify', src, "You dont have any rolling papers!", 'error')
    end
end)
QBCore.Functions.CreateUseableItem("weed_white-widow", function(source, item) 
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local rollingpaper = Player.Functions.GetItemByName('rolling_paper')
    if rollingpaper ~= nil and not alreadyrolling then
        alreadyrolling = true
	    TriggerClientEvent('pogressBar:drawBar', src, 3700, 'Rolling up some white widow..')
	    Citizen.Wait(3700)
	    alreadyrolling = false
        Player.Functions.RemoveItem('weed_white-widow', 1)
        Player.Functions.RemoveItem('rolling_paper', 3)
        Player.Functions.AddItem('weed_white-widow_joint', 3, slot, {["quality"] = 100})
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weed_white-widow'], "remove", 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['rolling_paper'], "remove", 3)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weed_white-widow_joint'], "add", 3)
    elseif alreadyrolling then
        TriggerClientEvent('QBCore:Notify', src, "You are already rolling a Joint'", 'error')
    else    
        TriggerClientEvent('QBCore:Notify', src, "You dont have any rolling papers!", 'error')
    end
end)
QBCore.Functions.CreateUseableItem("weed_ak47", function(source, item) 
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local rollingpaper = Player.Functions.GetItemByName('rolling_paper')
    if rollingpaper ~= nil and not alreadyrolling then
        alreadyrolling = true
	    TriggerClientEvent('pogressBar:drawBar', src, 3700, 'Rolling up some ak47..')
	    Citizen.Wait(3700)
	    alreadyrolling = false
        Player.Functions.RemoveItem('weed_ak47', 1)
        Player.Functions.RemoveItem('rolling_paper', 3)
        Player.Functions.AddItem('weed_ak47_joint', 3, slot, {["quality"] = 100})
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weed_ak47'], "remove", 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['rolling_paper'], "remove", 3)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weed_ak47_joint'], "add", 3)
    elseif alreadyrolling then
        TriggerClientEvent('QBCore:Notify', src, "You are already rolling a Joint'", 'error')
    else    
        TriggerClientEvent('QBCore:Notify', src, "You dont have any rolling papers!", 'error')
    end
end)
QBCore.Functions.CreateUseableItem("weed_amnesia", function(source, item) 
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local rollingpaper = Player.Functions.GetItemByName('rolling_paper')
    if rollingpaper ~= nil and not alreadyrolling then
        alreadyrolling = true
	    TriggerClientEvent('pogressBar:drawBar', src, 3700, 'Rolling up some amnesia..')
	    Citizen.Wait(3700)
	    alreadyrolling = false
        Player.Functions.RemoveItem('weed_amnesia', 1)
        Player.Functions.RemoveItem('rolling_paper', 3)
        Player.Functions.AddItem('weed_amnesia_joint', 3, slot, {["quality"] = 100})
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weed_amnesia'], "remove", 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['rolling_paper'], "remove", 3)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weed_amnesia_joint'], "add", 3)
    elseif alreadyrolling then
        TriggerClientEvent('QBCore:Notify', src, "You are already rolling a Joint'", 'error')
    else    
        TriggerClientEvent('QBCore:Notify', src, "You dont have any rolling papers!", 'error')
    end
end)
QBCore.Functions.CreateUseableItem("weed_purple-haze", function(source, item) 
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local rollingpaper = Player.Functions.GetItemByName('rolling_paper')
    if rollingpaper ~= nil and not alreadyrolling then
        alreadyrolling = true
	    TriggerClientEvent('pogressBar:drawBar', src, 3700, 'Rolling up some purple haze..')
	    Citizen.Wait(3700)
	    alreadyrolling = false
        Player.Functions.RemoveItem('weed_purple-haze', 1)
        Player.Functions.RemoveItem('rolling_paper', 3)
        Player.Functions.AddItem('weed_purple-haze_joint', 3, slot, {["quality"] = 100})
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weed_purple-haze'], "remove", 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['rolling_paper'], "remove", 3)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weed_purple-haze_joint'], "add", 3)
    elseif alreadyrolling then
        TriggerClientEvent('QBCore:Notify', src, "You are already rolling a Joint'", 'error')
    else    
        TriggerClientEvent('QBCore:Notify', src, "You dont have any rolling papers!", 'error')
    end
end)
-- Use joints
QBCore.Functions.CreateUseableItem("weed_skunk_joint", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName(item.name) ~= nil then
        TriggerClientEvent("case-outdoorweed:client:UseSkunkJoint", source)
    end
end)
QBCore.Functions.CreateUseableItem("weed_og-kush_joint", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName(item.name) ~= nil then
        TriggerClientEvent("case-outdoorweed:client:UseOGKushJoint", source)
    end
end)
QBCore.Functions.CreateUseableItem("weed_white-widow_joint", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName(item.name) ~= nil then
        TriggerClientEvent("case-outdoorweed:client:UseWhiteWidowJoint", source)
    end
end)
QBCore.Functions.CreateUseableItem("weed_ak47_joint", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName(item.name) ~= nil then
        TriggerClientEvent("case-outdoorweed:client:UseAK47Joint", source)
    end
end)
QBCore.Functions.CreateUseableItem("weed_amnesia_joint", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName(item.name) ~= nil then
        TriggerClientEvent("case-outdoorweed:client:UseAmnesiaJoint", source)
    end
end)
QBCore.Functions.CreateUseableItem("weed_purple-haze_joint", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName(item.name) ~= nil then
        TriggerClientEvent("case-outdoorweed:client:UsePurpleHazeJoint", source)
    end
end)
-- Sell bags to store
RegisterServerEvent('case-outdoorweed:server:SellBags', function(args) 
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	local args = tonumber(args)
	if args == 1 then 
		if Player.Functions.GetItemByName('weed_skunk') ~= nil then
            item = Player.Functions.GetItemByName('weed_skunk').amount
            pay = (item * Config.WeedShopPrice['weed_skunk'])
            Player.Functions.RemoveItem("weed_skunk", item)
            Player.Functions.AddMoney('cash', pay)			
            TriggerClientEvent('QBCore:Notify', src, "You sold some bags of skunk for $"..pay, "success")
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["weed_skunk"], 'remove', item)
            TriggerClientEvent('case-outdoorweed:client:SellingMenu', src)
		else
		    TriggerClientEvent('QBCore:Notify', src, "You dont have any Skunk to sell", "error")
            TriggerClientEvent('case-outdoorweed:client:SellingMenu', src)
		end
	elseif args == 2 then 
		if Player.Functions.GetItemByName('weed_og-kush') ~= nil then
            item = Player.Functions.GetItemByName('weed_og-kush').amount
            pay = (item * Config.WeedShopPrice['weed_og-kush'])
            Player.Functions.RemoveItem("weed_og-kush", item)
            Player.Functions.AddMoney('cash', pay)
			TriggerClientEvent('QBCore:Notify', src, "You sold some OG Kush for $"..pay, "success")
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weed_og-kush'], "remove", 1)
            TriggerClientEvent('case-outdoorweed:client:SellingMenu', src)
		else
		    TriggerClientEvent('QBCore:Notify', src, "You dont have any OG Kush to sell", "error")
            TriggerClientEvent('case-outdoorweed:client:SellingMenu', src)
		end	
	elseif args == 3 then
		if Player.Functions.GetItemByName('weed_white-widow') ~= nil then
            item = Player.Functions.GetItemByName('weed_white-widow').amount
            pay = (item * Config.WeedShopPrice['weed_white-widow'])
            Player.Functions.RemoveItem("weed_white-widow", item)
            Player.Functions.AddMoney('cash', pay)
			TriggerClientEvent('QBCore:Notify', src, "You sold some White Widow for $"..pay, "success")
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weed_white-widow'], "remove", 1)
            TriggerClientEvent('case-outdoorweed:client:SellingMenu', src)
		else
		    TriggerClientEvent('QBCore:Notify', src, "You dont have any White Widow to sell", "error")
            TriggerClientEvent('case-outdoorweed:client:SellingMenu', src)
		end
	elseif args == 4 then
		if Player.Functions.GetItemByName('weed_ak47') ~= nil then
            item = Player.Functions.GetItemByName('weed_ak47').amount
            pay = (item * Config.WeedShopPrice['weed_ak47'])
            Player.Functions.RemoveItem("weed_ak47", item)
            Player.Functions.AddMoney('cash', pay)
			TriggerClientEvent('QBCore:Notify', src, "You sold some AK47 for $"..pay, "success")
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weed_ak47'], "remove", 1)
            TriggerClientEvent('case-outdoorweed:client:SellingMenu', src)
		else
		    TriggerClientEvent('QBCore:Notify', src, "You dont have any AK47 to sell", "error")
            TriggerClientEvent('case-outdoorweed:client:SellingMenu', src)
		end
	elseif args == 5 then
		if Player.Functions.GetItemByName('weed_amnesia') ~= nil then
            item = Player.Functions.GetItemByName('weed_amnesia').amount
            pay = (item * Config.WeedShopPrice['weed_amnesia'])
            Player.Functions.RemoveItem("weed_amnesia", item)
            Player.Functions.AddMoney('cash', pay)
			TriggerClientEvent('QBCore:Notify', src, "You sold some Amnesia for $"..pay, "success")
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weed_amnesia'], "remove", 1)
            TriggerClientEvent('case-outdoorweed:client:SellingMenu', src)
		else
		    TriggerClientEvent('QBCore:Notify', src, "You dont have any Amensia to sell", "error")
            TriggerClientEvent('case-outdoorweed:client:SellingMenu', src)
		end
	elseif args == 6 then
		if Player.Functions.GetItemByName('weed_purple-haze') ~= nil then
            item = Player.Functions.GetItemByName('weed_purple-haze').amount
            pay = (item * Config.WeedShopPrice['weed_purple-haze'])
            Player.Functions.RemoveItem("weed_purple-haze", item)
            Player.Functions.AddMoney('cash', pay)
			TriggerClientEvent('QBCore:Notify', src, "You sold some Purple Haze for $"..pay, "success")
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weed_purple-haze'], "remove", 1)
            TriggerClientEvent('case-outdoorweed:client:SellingMenu', src)
		else
		    TriggerClientEvent('QBCore:Notify', src, "You dont have any Purple Haze to sell", "error")
            TriggerClientEvent('case-outdoorweed:client:SellingMenu', src)
		end	-- Add more items after here
	end
end)
-- Cut ounces to grams
RegisterServerEvent('case-outdoorweed:server:TrimWeed', function(args) 
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
        local skunk = Player.Functions.GetItemByName("weed_skunk_crop") 
        if skunk ~= nil then
            if skunk.amount >= removeAmount then
                local baggies = Player.Functions.GetItemByName("empty_weed_bag") 
                if baggies ~= nil then
                    if baggies.amount >= baggieAmount then
                        Player.Functions.RemoveItem("weed_skunk_crop", removeAmount)
						Player.Functions.RemoveItem("empty_weed_bag", returnAmount)
                        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weed_skunk_crop'], "remove", removeAmount)
						TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['empty_weed_bag'], "remove", returnAmount)
                        TriggerClientEvent('pogressBar:drawBar', src, packageTime, 'Trimming weed..')
                        SetTimeout(packageTime, function()
                            if Player.Functions.AddItem('weed_skunk', returnAmount, nil, info, {["quality"] = 100}) then
                                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["weed_skunk"], "add", returnAmount)
								TriggerClientEvent('QBCore:Notify', src, 'You cut a crop of skunk!', 'success')
                                TriggerClientEvent('case-outdoorweed:client:TrimmingMenu', src)
                            else
                                TriggerClientEvent('QBCore:Notify', src, 'Your pockets are full..', 'error')
                            end
                        end)
                    else
                        TriggerClientEvent('QBCore:Notify', src, "You need atleast 28 baggies..", 'error')
                        TriggerClientEvent('case-outdoorweed:client:TrimmingMenu', src)
                    end
                else
                    TriggerClientEvent('QBCore:Notify', src, "You need atleast 28 baggies..", "error")
                    TriggerClientEvent('case-outdoorweed:client:TrimmingMenu', src)
                end
            else
                TriggerClientEvent('QBCore:Notify', src, "You dont have enough skunk crops..", 'error')
                TriggerClientEvent('case-outdoorweed:client:TrimmingMenu', src)
            end
        else
            TriggerClientEvent('QBCore:Notify', src, "You dont have any skunk crops..", "error")
            TriggerClientEvent('case-outdoorweed:client:TrimmingMenu', src)
        end
	elseif args == 2 then 
        local ogkush = Player.Functions.GetItemByName("weed_og-kush_crop") 
        if ogkush ~= nil then
            if ogkush.amount >= removeAmount then
                local baggies = Player.Functions.GetItemByName("empty_weed_bag") 
                if baggies ~= nil then
                    if baggies.amount >= baggieAmount2 then
                        Player.Functions.RemoveItem("weed_og-kush_crop", removeAmount)
						Player.Functions.RemoveItem("empty_weed_bag", returnAmount2)
                        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weed_og-kush_crop'], "remove", removeAmount)
						TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['empty_weed_bag'], "remove", returnAmount2)
                        TriggerClientEvent('pogressBar:drawBar', src, packageTime, 'Trimming weed..')
                        SetTimeout(packageTime, function()
                            if Player.Functions.AddItem('weed_og-kush', returnAmount2, nil, info, {["quality"] = 100}) then
                                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["weed_og-kush"], "add", returnAmount2)
								TriggerClientEvent('QBCore:Notify', src, 'You cut a crop of OG Kush!', 'success')
                                TriggerClientEvent('case-outdoorweed:client:TrimmingMenu', src)
                            else
                                TriggerClientEvent('QBCore:Notify', src, 'Your pockets are full..', 'error')
                            end
                        end)
                    else
                        TriggerClientEvent('QBCore:Notify', src, "You need atleast 50 baggies..", 'error')
                        TriggerClientEvent('case-outdoorweed:client:TrimmingMenu', src)
                    end
                else
                    TriggerClientEvent('QBCore:Notify', src, "You need atleast 50 baggies..", "error")
                    TriggerClientEvent('case-outdoorweed:client:TrimmingMenu', src)
                end
            else
                TriggerClientEvent('QBCore:Notify', src, "You dont have enough OG Kush crops..", 'error')
                TriggerClientEvent('case-outdoorweed:client:TrimmingMenu', src)
            end
        else
            TriggerClientEvent('QBCore:Notify', src, "You dont have any OG Kush crops..", "error")
            TriggerClientEvent('case-outdoorweed:client:TrimmingMenu', src)
        end
	elseif args == 3 then 
        local whitewidow = Player.Functions.GetItemByName("weed_white-widow_crop") 
        if whitewidow ~= nil then
            if whitewidow.amount >= removeAmount then
                local baggies = Player.Functions.GetItemByName("empty_weed_bag") 
                if baggies ~= nil then
                    if baggies.amount >= baggieAmount then
                        Player.Functions.RemoveItem("weed_white-widow_crop", removeAmount)
						Player.Functions.RemoveItem("empty_weed_bag", returnAmount)
                        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weed_white-widow_crop'], "remove", removeAmount)
						TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['empty_weed_bag'], "remove", returnAmount)
                        TriggerClientEvent('pogressBar:drawBar', src, packageTime, 'Trimming weed..')
                        SetTimeout(packageTime, function()
                            if Player.Functions.AddItem('weed_white-widow', returnAmount, nil, info, {["quality"] = 100}) then
                                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["weed_white-widow"], "add", returnAmount)
								TriggerClientEvent('QBCore:Notify', src, 'You cut a crop of White Widow!', 'success')
                                TriggerClientEvent('case-outdoorweed:client:TrimmingMenu', src)
                            else
                                TriggerClientEvent('QBCore:Notify', src, 'Your pockets are full..', 'error')
                            end
                        end)
                    else
                        TriggerClientEvent('QBCore:Notify', src, "You need atleast 28 baggies..", 'error')
                        TriggerClientEvent('case-outdoorweed:client:TrimmingMenu', src)
                    end
                else
                    TriggerClientEvent('QBCore:Notify', src, "You need atleast 28 baggies..", "error")
                    TriggerClientEvent('case-outdoorweed:client:TrimmingMenu', src)
                end
            else
                TriggerClientEvent('QBCore:Notify', src, "You dont have enough White Widow crops..", 'error')
                TriggerClientEvent('case-outdoorweed:client:TrimmingMenu', src)
            end
        else
            TriggerClientEvent('QBCore:Notify', src, "You dont have any White Widow crops..", "error")
            TriggerClientEvent('case-outdoorweed:client:TrimmingMenu', src)
        end
    elseif args == 4 then 
        local ak47 = Player.Functions.GetItemByName("weed_ak47_crop") 
        if ak47 ~= nil then
            if ak47.amount >= removeAmount then
                local baggies = Player.Functions.GetItemByName("empty_weed_bag") 
                if baggies ~= nil then
                    if baggies.amount >= baggieAmount then
                        Player.Functions.RemoveItem("weed_ak47_crop", removeAmount)
						Player.Functions.RemoveItem("empty_weed_bag", returnAmount)
                        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weed_ak47_crop'], "remove", removeAmount)
						TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['empty_weed_bag'], "remove", returnAmount)
                        TriggerClientEvent('pogressBar:drawBar', src, packageTime, 'Trimming weed..')
                        SetTimeout(packageTime, function()
                            if Player.Functions.AddItem('weed_ak47', returnAmount, nil, info, {["quality"] = 100}) then
                                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["weed_ak47"], "add", returnAmount)
								TriggerClientEvent('QBCore:Notify', src, 'You cut a crop of AK47!', 'success')
                                TriggerClientEvent('case-outdoorweed:client:TrimmingMenu', src)
                            else
                                TriggerClientEvent('QBCore:Notify', src, 'Your pockets are full..', 'error')
                            end
                        end)
                    else
                        TriggerClientEvent('QBCore:Notify', src, "You need atleast 28 baggies..", 'error')
                        TriggerClientEvent('case-outdoorweed:client:TrimmingMenu', src)
                    end
                else
                    TriggerClientEvent('QBCore:Notify', src, "You need atleast 28 baggies..", "error")
                    TriggerClientEvent('case-outdoorweed:client:TrimmingMenu', src)
                end
            else
                TriggerClientEvent('QBCore:Notify', src, "You dont have enough AK47 crops..", 'error')
                TriggerClientEvent('case-outdoorweed:client:TrimmingMenu', src)
            end
        else
            TriggerClientEvent('QBCore:Notify', src, "You dont have any AK47 crops..", "error")
            TriggerClientEvent('case-outdoorweed:client:TrimmingMenu', src)
        end
	elseif args == 5 then 
        local amnesia = Player.Functions.GetItemByName("weed_amnesia_crop") 
        if amnesia ~= nil then
            if amnesia.amount >= removeAmount then
                local baggies = Player.Functions.GetItemByName("empty_weed_bag") 
                if baggies ~= nil then
                    if baggies.amount >= baggieAmount then
                        Player.Functions.RemoveItem("weed_amnesia_crop", removeAmount)
						Player.Functions.RemoveItem("empty_weed_bag", returnAmount)
                        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weed_amnesia_crop'], "remove", removeAmount)
						TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['empty_weed_bag'], "remove", returnAmount)
                        TriggerClientEvent('pogressBar:drawBar', src, packageTime, 'Trimming weed..')
                        SetTimeout(packageTime, function()
                            if Player.Functions.AddItem('weed_amnesia', returnAmount, nil, info, {["quality"] = 100}) then
                                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["weed_amnesia"], "add", returnAmount)
								TriggerClientEvent('QBCore:Notify', src, 'You cut a crop of Amnesia!', 'success')
                                TriggerClientEvent('case-outdoorweed:client:TrimmingMenu', src)
                            else
                                TriggerClientEvent('QBCore:Notify', src, 'Your pockets are full..', 'error')
                            end
                        end)
                    else
                        TriggerClientEvent('QBCore:Notify', src, "You need atleast 28 baggies..", 'error')
                        TriggerClientEvent('case-outdoorweed:client:TrimmingMenu', src)
                    end
                else
                    TriggerClientEvent('QBCore:Notify', src, "You need atleast 28 baggies..", "error")
                    TriggerClientEvent('case-outdoorweed:client:TrimmingMenu', src)
                end
            else
                TriggerClientEvent('QBCore:Notify', src, "You dont have enough Amnesia crops..", 'error')
                TriggerClientEvent('case-outdoorweed:client:TrimmingMenu', src)
            end
        else
            TriggerClientEvent('QBCore:Notify', src, "You dont have any Amensia crops..", "error")
            TriggerClientEvent('case-outdoorweed:client:TrimmingMenu', src)
        end
	elseif args == 6 then 
        local purplehaze = Player.Functions.GetItemByName("weed_purple-haze_crop") 
        if purplehaze ~= nil then
            if purplehaze.amount >= removeAmount then
                local baggies = Player.Functions.GetItemByName("empty_weed_bag") 
                if baggies ~= nil then
                    if baggies.amount >= baggieAmount then
                        Player.Functions.RemoveItem("weed_purple-haze_crop", removeAmount)
						Player.Functions.RemoveItem("empty_weed_bag", returnAmount)
                        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weed_purple-haze_crop'], "remove", removeAmount)
						TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['empty_weed_bag'], "remove", returnAmount)
                        TriggerClientEvent('pogressBar:drawBar', src, packageTime, 'Trimming weed..')
                        SetTimeout(packageTime, function()
                            if Player.Functions.AddItem('weed_purple-haze', returnAmount, nil, info, {["quality"] = 100}) then
                                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["weed_purple-haze"], "add", returnAmount)
								TriggerClientEvent('QBCore:Notify', src, 'You cut a crop of Purple Haze!', 'success')
                                TriggerClientEvent('case-outdoorweed:client:TrimmingMenu', src)
                            else
                                TriggerClientEvent('QBCore:Notify', src, 'Your pockets are full..', 'error')
                            end
                        end)
                    else
                        TriggerClientEvent('QBCore:Notify', src, "You need atleast 28 baggies..", 'error')
                        TriggerClientEvent('case-outdoorweed:client:TrimmingMenu', src)
                    end
                else
                    TriggerClientEvent('QBCore:Notify', src, "You need atleast 28 baggies..", "error")
                    TriggerClientEvent('case-outdoorweed:client:TrimmingMenu', src)
                end
            else
                TriggerClientEvent('QBCore:Notify', src, "You dont have enough Purple Haze crops..", 'error')
                TriggerClientEvent('case-outdoorweed:client:TrimmingMenu', src)
            end
        else
            TriggerClientEvent('QBCore:Notify', src, "You dont have any Purple Haze crops..", "error")
            TriggerClientEvent('case-outdoorweed:client:TrimmingMenu', src)
        end
    end
end)

-- Drug cutting kit
QBCore.Functions.CreateUseableItem("drug_shears", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    local scaleCheck = Player.Functions.GetItemByName('drug_scales')
    if scaleCheck ~= nil then
        TriggerClientEvent('case-outdoorweed:client:TrimmingMenu', source)
    else
        TriggerClientEvent('QBCore:Notify', source, "You dont have a scale", 'error')
    end
end)
-- Select plant data
Citizen.CreateThread(function()
    TriggerEvent('case-outdoorweed:server:SelectPlants')
    PlantsLoaded = true
end)
-- Update plant data
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5000)
        if PlantsLoaded then
            TriggerClientEvent('case-outdoorweed:client:UpdatePlants', -1, Config.Plants)
        end
    end
end)
-- Save plant data
RegisterServerEvent('case-outdoorweed:server:SavePlants')
AddEventHandler('case-outdoorweed:server:SavePlants', function(data, plantId)
    local data = json.encode(data)
    exports.oxmysql:insert('INSERT INTO outdoor_plants (properties, plantid) VALUES (@properties, @plantid)', {
        ['@properties'] = data,
        ['@plantid'] = plantId
    })
end)
-- Itemcheck
RegisterServerEvent('case-outdoorweed:server:ItemCheck')
AddEventHandler('case-outdoorweed:server:ItemCheck', function(item, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName(item).amount > 0 then
        TriggerClientEvent(cb, src)
    else
        TriggerClientEvent('case-outdoorweed:client:notify', src, 'You are missing ' .. item)
    end
end)
-- Plant seeds
RegisterServerEvent('case-outdoorweed:server:SeedPlanted')
AddEventHandler('case-outdoorweed:server:SeedPlanted', function(type, location)
    local src = source
    local plantId = math.random(111111, 999999)
    local Player = QBCore.Functions.GetPlayer(src)
    local SeedData = {
        id = plantId, 
        type = type, 
        x = location.x, 
        y = location.y, 
        z = location.z, 
        hunger = Config.StartingHunger, 
        thirst = Config.StartingThirst, 
        growth = 0.0, 
        quality = 100.0, 
        stage = 1, 
        grace = true, 
        beingHarvested = false, 
        planter = Player.PlayerData.citizenid
    }
    local PlantCount = 0
    for k, v in pairs(Config.Plants) do
        if v.planter == Player.PlayerData.citizenid then
            PlantCount = PlantCount + 1
        end
    end
    if PlantCount >= Config.MaxPlantCount then
        TriggerClientEvent('case-outdoorweed:client:notify', src, 'You already have ' .. Config.MaxPlantCount .. ' plants down')
    else
        table.insert(Config.Plants, SeedData)
        TriggerClientEvent('case-outdoorweed:client:ConfirmSeed', src)
        TriggerEvent('case-outdoorweed:server:SavePlants', SeedData, plantId)
        TriggerEvent('case-outdoorweed:server:UpdatePlants')
    end
end)
-- Harvest plants
RegisterServerEvent('case-outdoorweed:server:PlantHarvested')
AddEventHandler('case-outdoorweed:server:PlantHarvested', function(plantId)
    for k, v in pairs(Config.Plants) do
        if v.id == plantId then
            v.beingHarvested = true
        end
    end
    TriggerEvent('case-outdoorweed:server:UpdatePlants')
end)
-- Destroy plants
RegisterServerEvent('case-outdoorweed:server:DestroyPlants')
AddEventHandler('case-outdoorweed:server:DestroyPlants', function(plantId)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    for k, v in pairs(Config.Plants) do
        if v.id == plantId then
            table.remove(Config.Plants, k)
        end
    end
    TriggerClientEvent('case-outdoorweed:client:RemovePlant', -1, plantId)
    TriggerEvent('case-outdoorweed:server:PlantRemoved', plantId)
    TriggerEvent('case-outdoorweed:server:UpdatePlants')
    TriggerClientEvent('case-outdoorweed:client:notify', src, 'You destroy the weed plant')
end)
-- Harvest plants
RegisterServerEvent('case-outdoorweed:server:HarvestPlant')
AddEventHandler('case-outdoorweed:server:HarvestPlant', function(plantId)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local amount
    local label
    local item
    local goodQuality = false
    local hasFound = false
    for k, v in pairs(Config.Plants) do
        if v.id == plantId then
            for y = 1, #Config.SeedTypes do
                if v.type == Config.SeedTypes[y].type then
                    label = Config.SeedTypes[y].label
                    item = Config.SeedTypes[y].item
                    amount = math.random(Config.SeedTypes[y].rewardMin, Config.SeedTypes[y].rewardMax)
                    local quality = math.ceil(v.quality)
                    hasFound = true
                    table.remove(Config.Plants, k)
                    if quality > 94 then
                        goodQuality = true
                    end
                    amount = math.ceil(amount * (quality / 35))
                end
            end
        end
    end
    if hasFound then
        TriggerClientEvent('case-outdoorweed:client:RemovePlant', -1, plantId)
        TriggerEvent('case-outdoorweed:server:PlantRemoved', plantId)
        TriggerEvent('case-outdoorweed:server:UpdatePlants')
        if label ~= nil then
            TriggerClientEvent('case-outdoorweed:client:notify', src, 'You harvest x' .. amount .. ' ' .. label)
        end
        Player.Functions.AddItem(item, amount)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], "add")
    end
end)
-- Update plants
RegisterServerEvent('case-outdoorweed:server:UpdatePlants')
AddEventHandler('case-outdoorweed:server:UpdatePlants', function()
    TriggerClientEvent('case-outdoorweed:client:UpdatePlants', -1, Config.Plants)
end)
-- Water plants
RegisterServerEvent('case-outdoorweed:server:WaterPlants')
AddEventHandler('case-outdoorweed:server:WaterPlants', function(plantId)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    for k, v in pairs(Config.Plants) do
        if v.id == plantId then
            Config.Plants[k].thirst = Config.Plants[k].thirst + Config.ThirstIncrease
            if Config.Plants[k].thirst > 100.0 then
                Config.Plants[k].thirst = 100.0
            end
        end
    end
    Player.Functions.RemoveItem('weed_water', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weed_water'], "remove")
    TriggerEvent('case-outdoorweed:server:UpdatePlants')
end)
-- Feed plants
RegisterServerEvent('case-outdoorweed:server:FeedPlants')
AddEventHandler('case-outdoorweed:server:FeedPlants', function(plantId)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    for k, v in pairs(Config.Plants) do
        if v.id == plantId then
            Config.Plants[k].hunger = Config.Plants[k].hunger + Config.HungerIncrease
            if Config.Plants[k].hunger > 100.0 then
                Config.Plants[k].hunger = 100.0
            end
        end
    end
    Player.Functions.RemoveItem('weed_nutrition', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weed_nutrition'], "remove")
    TriggerEvent('case-outdoorweed:server:UpdatePlants')
end)
-- Sql update
RegisterServerEvent('case-outdoorweed:server:UpdatePlants')
AddEventHandler('case-outdoorweed:server:UpdatePlants', function(id, data)
    local result = exports.oxmysql:executeSync('SELECT * FROM outdoor_plants WHERE plantid = @plantid', {
        ['@plantid'] = id
    })
    if result[1] then
        local newData = json.encode(data)
        exports.oxmysql:execute('UPDATE outdoor_plants SET properties = @properties WHERE plantid = @id', {
            ['@properties'] = newData,
            ['@id'] = id
        })
    end
end)
-- Sql remove
RegisterServerEvent('case-outdoorweed:server:PlantRemoved')
AddEventHandler('case-outdoorweed:server:PlantRemoved', function(plantId)
    local result = exports.oxmysql:executeSync('SELECT * FROM outdoor_plants')
    if result then
        for i = 1, #result do
            local plantData = json.decode(result[i].properties)
            if plantData.id == plantId then
                exports.oxmysql:execute('DELETE FROM outdoor_plants WHERE id = @id', {
                    ['@id'] = result[i].id
                })
                for k, v in pairs(Config.Plants) do
                    if v.id == plantId then
                        table.remove(Config.Plants, k)
                    end
                end
            end
        end
    end
end)
-- Sql select
RegisterServerEvent('case-outdoorweed:server:SelectPlants')
AddEventHandler('case-outdoorweed:server:SelectPlants', function()
    local data = {}
    local result = exports.oxmysql:executeSync('SELECT * FROM outdoor_plants')
    if result[1] then
        for i = 1, #result do
            local plantData = json.decode(result[i].properties)
            print(plantData.id)
            table.insert(Config.Plants, plantData)
        end
    end
end)
-- Plant degrading
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(math.random(20000, 25000))
        for i = 1, #Config.Plants do
            if Config.Plants[i].growth < 100 then
                if Config.Plants[i].grace then
                    Config.Plants[i].grace = false
                else
                    Config.Plants[i].thirst = Config.Plants[i].thirst - math.random(Config.Degrade.min, Config.Degrade.max) / 10
                    Config.Plants[i].hunger = Config.Plants[i].hunger - math.random(Config.Degrade.min, Config.Degrade.max) / 10
                    Config.Plants[i].growth = Config.Plants[i].growth + math.random(Config.GrowthIncrease.min, Config.GrowthIncrease.max) / 10
                    if Config.Plants[i].growth > 100 then
                        Config.Plants[i].growth = 100
                    end
                    if Config.Plants[i].hunger < 0 then
                        Config.Plants[i].hunger = 0
                    end
                    if Config.Plants[i].thirst < 0 then
                        Config.Plants[i].thirst = 0
                    end
                    if Config.Plants[i].quality < 25 then
                        Config.Plants[i].quality = 25
                    end
                    if Config.Plants[i].thirst < 75 or Config.Plants[i].hunger < 75 then
                        Config.Plants[i].quality = Config.Plants[i].quality - math.random(Config.QualityDegrade.min, Config.QualityDegrade.max) / 10
                    end
                    if Config.Plants[i].stage == 1 and Config.Plants[i].growth >= 55 then
                        Config.Plants[i].stage = 2
                    elseif Config.Plants[i].stage == 2 and Config.Plants[i].growth >= 90 then
                        Config.Plants[i].stage = 3
                    end
                end
            end
            TriggerEvent('case-outdoorweed:server:UpdatePlants', Config.Plants[i].id, Config.Plants[i])
        end
        TriggerEvent('case-outdoorweed:server:UpdatePlants')
    end
end)

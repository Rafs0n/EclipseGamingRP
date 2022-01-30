-- Sell bags to drug dealer
local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('EG-Shop:server:SellDrugs', function(args) 
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	local args = tonumber(args)
	if args == 1 then 
		if Player.Functions.GetItemByName('cokebaggy') ~= nil then
            item = Player.Functions.GetItemByName('cokebaggy').amount
            pay = (item * Config.DrugShopPrice['cokebaggy'])
            Player.Functions.RemoveItem("cokebaggy", item)
            Player.Functions.AddMoney('cash', pay)			
            TriggerClientEvent('QBCore:Notify', src, "You sold some bags of Coke for $"..pay, "success")
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["cokebaggy"], 'remove', item)
            TriggerClientEvent('EG-Shops:client:SellingMenu', src)
		else
		    TriggerClientEvent('QBCore:Notify', src, "You dont have any Coke to sell", "error")
            TriggerClientEvent('EG-Shops:client:SellingMenu', src)
		end
	elseif args == 2 then 
		if Player.Functions.GetItemByName('crack_baggy') ~= nil then
            item = Player.Functions.GetItemByName('crack_baggy').amount
            pay = (item * Config.DrugShopPrice['crack_baggy'])
            Player.Functions.RemoveItem("crack_baggy", item)
            Player.Functions.AddMoney('cash', pay)			
            TriggerClientEvent('QBCore:Notify', src, "You sold some bags of Crack for $"..pay, "success")
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["crack_baggy"], 'remove', item)
            TriggerClientEvent('EG-Shops:client:SellingMenu', src)
		else
		    TriggerClientEvent('QBCore:Notify', src, "You dont have any Crack to sell", "error")
            TriggerClientEvent('EG-Shops:client:SellingMenu', src)
		end
	end
end)
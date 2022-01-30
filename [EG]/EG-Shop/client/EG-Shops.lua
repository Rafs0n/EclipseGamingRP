-- Weed Seed Guy
RegisterNetEvent('inventory:client:OpenWeedSeedShop')
AddEventHandler('inventory:client:OpenWeedSeedShop', function()
    local ShopItems = {}
    ShopItems.label = "Black Market"
    ShopItems.items = Config.WeedSeedsItems
    ShopItems.slots = #Config.WeedSeedsItems
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "Weed Seed Shop", ShopItems)
end)


RegisterNetEvent('EG-Shops:client:WeedSeedShop', function()
    exports['qb-menu']:openMenu({
        {
            header = "Pablo Escobar",
            txt = "I Sell The Good Stuff. Essay",
            isMenuHeader = true
        },
        {
            header = "Browse Shop",
            txt = "See What We Have To Offer",
            params = {
                event = "inventory:client:OpenWeedSeedShop",
            }
        },
        {
            header = "Sell to Dealer",
            txt = "See current prices",
            params = {
                event = "EG-Shops:client:SellingMenu",
            }
        },
    })
end)

-- Gun guy
RegisterNetEvent('inventory:client:OpenGunShop')
AddEventHandler('inventory:client:OpenGunShop', function()
    local ShopItems = {}
    ShopItems.label = "Black Market"
    ShopItems.items = Config.MarketGuns
    ShopItems.slots = #Config.MarketGuns
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "Gun Guy (GG)", ShopItems)
end)


RegisterNetEvent('EG-Shops:client:OpenGunShop', function()
    exports['qb-menu']:openMenu({
        {
            header = "Guy Jones",
            txt = "What you looking for?",
            isMenuHeader = true
        },
        {
            header = "Browse Shop",
            txt = "See What We Have To Offer",
            params = {
                event = "inventory:client:OpenGunShop",
            }
        }
    })
end)

-- Boosting Cars
RegisterNetEvent('inventory:client:OpenBoostingShop')
AddEventHandler('inventory:client:OpenBoostingShop', function()
    local ShopItems = {}
    ShopItems.label = "Boosting Shop"
    ShopItems.items = Config.BoostingShop
    ShopItems.slots = #Config.BoostingShop
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "Boosting Shop", ShopItems)
end)


RegisterNetEvent('EG-Shops:client:OpenBoostingShop', function()
    exports['qb-menu']:openMenu({
        {
            header = "Donny Buger",
            txt = "Need a Ride?",
            isMenuHeader = true
        },
        {
            header = "Browse Shop",
            txt = "What you looking for?",
            params = {
                event = "inventory:client:OpenBoostingShop",
            }
        }
    })
end)

RegisterNetEvent('EG-Shops:client:SellingMenu', function()
    exports['qb-menu']:openMenu({
        {
            header = "I'll buy your drugs",
            txt = "We only accept Grams",
            isMenuHeader = true
        },
        {
            header = "Coke",
            txt = "$40 per bag of coke.",
            params = {
                event = "EG-Shop:server:SellDrugs",
                isServer = true,
                args = 1
            }
        },
        {
            header = "Crack",
            txt = "$55 per bag of Crack.",
            params = {
                event = "EG-Shop:server:SellDrugs",
                isServer = true,
                args = 2
            }
        },
        {
            header = "< Return",
            params = {
                event = "EG-Shops:client:WeedSeedShop"
            }
        }
    })
end)
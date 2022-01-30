-------------------------------
---------- CASE#2506 ----------
-------------------------------

Config = Config or {}
Config.Plants = {}
Config.MaxPlantCount = 12
Config.GrowthTimer = 150 -- In Minutes
Config.StartingThirst = 100.0
Config.StartingHunger = 100.0
Config.HungerIncrease = 80.0
Config.ThirstIncrease = 80.0
Config.Degrade = {min = 3, max = 10}
Config.QualityDegrade = {min = 8, max = 15}
Config.GrowthIncrease = {min = 3, max = 10}
Config.WeedShopPrice = {
		["weed_skunk"] = 5,
        ["weed_og-kush"] = 8,
        ["weed_white-widow"] = 11,
        ["weed_ak47"] = 14,
		["weed_amnesia"] = 17,
        ["weed_purple-haze"] = 20,     
}
Config.SmokeShopItems = {                     
    [1] = { name = "empty_weed_bag",       price = 2,    amount = 999999, info = {}, type = "item", slot = 1 },
    [2] = { name = "drug_scales",          price = 1200, amount = 999999,  info = {}, type = "item", slot = 2 },
    [3] = { name = "rolling_paper",        price = 1,    amount = 999999, info = {}, type = "item", slot = 3 },
    [4] = { name = "lighter",              price = 2,    amount = 999999, info = {}, type = "item", slot = 4 },
    [5] = { name = "trowel",               price = 200,  amount = 999999, info = {}, type = "item", slot = 5 },
    [6] = { name = "drug_cuttingkit",      price = 1000, amount = 999999, info = {}, type = "item", slot = 6 },
    [7] = { name = "weed_water",           price = 2,    amount = 999999, info = {}, type = "item", slot = 7 },
    [8] = { name = "weed_nutrition",       price = 100,  amount = 999999, info = {}, type = "item", slot = 8 },
    [9] = { name = "weed_pot",             price = 10,   amount = 999999, info = {}, type = "item", slot = 9 },
    [10] = { name = "drug_shears",         price = 100,   amount = 999999, info = {}, type = "item", slot = 10 },
}	
Config.WeedStages = {
    [1] = "bkr_prop_weed_01_small_01c",
    [2] = "bkr_prop_weed_med_01a",
    [3] = "bkr_prop_weed_lrg_01a",
}
Config.SeedTypes = {
    {type = "skunk", rewardMin = 5, rewardMax = 6, item = 'weed_skunk_crop', label = 'Skunk Crop'},
    {type = "og-kush", rewardMin = 4, rewardMax = 6, item = 'weed_og-kush_crop', label = 'OG-Kush Crop'},
    {type = "white-widow", rewardMin = 3, rewardMax = 5, item = 'weed_white-widow_crop', label = 'White Widow Crop'},
    {type = "ak47", rewardMin = 2, rewardMax = 3, item = 'weed_ak47_crop', label = 'AK47 Crop'},
	{type = "amnesia", rewardMin = 2, rewardMax = 3, item = 'weed_amnesia_crop', label = 'Amnesia Crop'},
	{type = "purple-haze", rewardMin = 2, rewardMax = 3, item = 'weed_purple-haze_crop', label = 'Purple Haze Crop'},
}

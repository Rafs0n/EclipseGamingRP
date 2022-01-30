-------------------------------
---------- CASE#2506 ----------
-------------------------------

### QBCORE DRUGS: WEED ###

We really did not like how `qb-weed` forces you to own a house in order to grow weed so we made our own outdoor version.
This script has been built to replace `qb-weed` using the same seeds.
Comes with a third eye store at smoke on the water with bulk selling (be careful with prices)
Store system is handled with `qb-menu` and has a nice clean look.
Weed gives you crops which you then trim into bags with the trimming shears item.
Bags are sold to locals or rolled into joints.
All joints are smokeable with scalling effects, purple-haze being the highest rewarded armour and stress.
All can be easily customised most done in `config.lua`

### USAGE ###

- Plant weed seeds outdoors
- Feed and water plants
- Use third eye to access the ped at store and purchase required items
- Harvest crops from plants
- Use trimming shears to cut crops into bags
- Roll bags into joints or sell bags to locals
- Smoke joints

### INSTALL ###

1) Customise to your liking, support can be provided if needed
2) Drag and drop `case-outdoorweed` into your server resources
3) Upload `outdoor_plants.sql` into your server sql 
4) Remove `qb-weed` from your server resources as my weed script is built to replace this
5) Add `case-outdoorweed` to your `server.cfg`
6) Add item information provided into your `qb-core/shared.lua`
7) Add images provided into your `qb-inventory/html/images`
8) Restart your city

### SHARED.LUA ###

	["weed_white-widow"] 			 = {["name"] = "weed_white-widow", 			["label"] = "White Widow 2g", 			["weight"] = 5, 		["type"] = "item", 		["image"] = "weed_white-widow.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   		["combinable"] = nil,   ["description"] = "A weed bag with 2g White Widow"},
	["weed_skunk"] 				  	 = {["name"] = "weed_skunk", 			 	["label"] = "Skunk 2g", 				["weight"] = 5, 		["type"] = "item", 		["image"] = "weed_skunk.png", 					["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   		["combinable"] = nil,   ["description"] = "A weed bag with 2g Skunk"},
	["weed_purple-haze"] 			 = {["name"] = "weed_purple-haze", 			["label"] = "Purple Haze 2g", 			["weight"] = 5, 		["type"] = "item", 		["image"] = "weed_purple-haze.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   		["combinable"] = nil,   ["description"] = "A weed bag with 2g Purple Haze"},
	["weed_og-kush"] 				 = {["name"] = "weed_og-kush", 			 	["label"] = "OGKush 2g", 				["weight"] = 5, 		["type"] = "item", 		["image"] = "weed_og-kush.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   		["combinable"] = nil,   ["description"] = "A weed bag with 2g OG Kush"},
	["weed_amnesia"] 				 = {["name"] = "weed_amnesia", 			 	["label"] = "Amnesia 2g", 				["weight"] = 5, 		["type"] = "item", 		["image"] = "weed_amnesia.png", 			    ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   		["combinable"] = nil,   ["description"] = "A weed bag with 2g Amnesia"},
	["weed_ak47"] 				     = {["name"] = "weed_ak47", 			 	["label"] = "AK47 2g", 					["weight"] = 5, 		["type"] = "item", 		["image"] = "weed_ak47.png", 			        ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   		["combinable"] = nil,   ["description"] = "A weed bag with 2g AK47"},
	["weed_white-widow_seed"] 		 = {["name"] = "weed_white-widow_seed", 	["label"] = "White Widow Seed", 		["weight"] = 1, 		["type"] = "item", 		["image"] = "weed_white-widow_seed.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,  		["combinable"] = nil,   ["description"] = "A weed seed of White Widow"},
	["weed_skunk_seed"] 			 = {["name"] = "weed_skunk_seed", 			["label"] = "Skunk Seed", 				["weight"] = 1, 		["type"] = "item", 		["image"] = "weed_skunk_seed.png", 		        ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   		["combinable"] = nil,   ["description"] = "A weed seed of Skunk"},
	["weed_purple-haze_seed"] 		 = {["name"] = "weed_purple-haze_seed", 	["label"] = "Purple Haze Seed", 		["weight"] = 1, 		["type"] = "item", 		["image"] = "weed_purple-haze_seed.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   		["combinable"] = nil,   ["description"] = "A weed seed of Purple Haze"},
	["weed_og-kush_seed"] 			 = {["name"] = "weed_og-kush_seed", 		["label"] = "OG Kush Seed", 			["weight"] = 1, 		["type"] = "item", 		["image"] = "weed_og-kush_seed.png", 		    ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   		["combinable"] = nil,   ["description"] = "A weed seed of OG Kush"},
	["weed_amnesia_seed"] 			 = {["name"] = "weed_amnesia_seed", 		["label"] = "Amnesia Seed", 			["weight"] = 1, 		["type"] = "item", 		["image"] = "weed_amnesia_seed.png", 		    ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   		["combinable"] = nil,   ["description"] = "A weed seed of Amnesia"},
	["weed_ak47_seed"] 				 = {["name"] = "weed_ak47_seed", 			["label"] = "AK 47 Seed", 				["weight"] = 1, 		["type"] = "item", 		["image"] = "weed_ak47_seed.png", 		        ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   		["combinable"] = nil,   ["description"] = "A weed seed of AK47"},
	["weed_white-widow_crop"] 		 = {["name"] = "weed_white-widow_crop", 	["label"] = "White Widow Crop", 		["weight"] = 1200, 		["type"] = "item", 		["image"] = "weed_white-widow_crop.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   		["combinable"] = nil,   ["description"] = "A weed bag with 2g White Widow"},
	["weed_skunk_crop"] 			 = {["name"] = "weed_skunk_crop", 			["label"] = "Skunk Crop", 				["weight"] = 1200, 		["type"] = "item", 		["image"] = "weed_skunk_crop.png", 			    ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   		["combinable"] = nil,   ["description"] = "A weed bag with 2g Skunk"},
	["weed_purple-haze_crop"] 		 = {["name"] = "weed_purple-haze_crop", 	["label"] = "Purple Haze Crop", 		["weight"] = 1200, 		["type"] = "item", 		["image"] = "weed_purple-haze_crop.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   		["combinable"] = nil,   ["description"] = "A weed bag with 2g Purple Haze"},
	["weed_og-kush_crop"] 			 = {["name"] = "weed_og-kush_crop", 		["label"] = "OG Kush Crop", 			["weight"] = 1200, 		["type"] = "item", 		["image"] = "weed_og-kush_crop.png", 		    ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   		["combinable"] = nil,   ["description"] = "A weed bag with 2g OG Kush"},
	["weed_amnesia_crop"] 			 = {["name"] = "weed_amnesia_crop", 		["label"] = "Amnesia Crop", 			["weight"] = 1200, 		["type"] = "item", 		["image"] = "weed_amnesia_crop.png", 		    ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   		["combinable"] = nil,   ["description"] = "A weed bag with 2g Amnesia"},
	["weed_ak47_crop"] 				 = {["name"] = "weed_ak47_crop", 			["label"] = "AK 47 Crop", 				["weight"] = 1200, 		["type"] = "item", 		["image"] = "weed_ak47_crop.png", 			    ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   		["combinable"] = nil,   ["description"] = "A weed bag with 2g AK47"},
	["weed_white-widow_joint"] 		 = {["name"] = "weed_white-widow_joint", 	["label"] = "White Widow Joint", 		["weight"] = 1, 		["type"] = "item", 		["image"] = "weed_white-widow_joint.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   		["combinable"] = nil,   ["description"] = "Light up that white widow son!"},
	["weed_skunk_joint"] 			 = {["name"] = "weed_skunk_joint", 			["label"] = "Skunk Joint", 				["weight"] = 1, 		["type"] = "item", 		["image"] = "weed_skunk_joint.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   		["combinable"] = nil,   ["description"] = "Light up that skunk son!"},
	["weed_purple-haze_joint"] 		 = {["name"] = "weed_purple-haze_joint", 	["label"] = "Purple Haze Joint", 		["weight"] = 1, 		["type"] = "item", 		["image"] = "weed_purple-haze_joint.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   		["combinable"] = nil,   ["description"] = "Light up that purple haze son!"},
	["weed_og-kush_joint"] 			 = {["name"] = "weed_og-kush_joint", 		["label"] = "OG Kush Joint", 			["weight"] = 1, 		["type"] = "item", 		["image"] = "weed_og-kush_joint.png", 		    ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   		["combinable"] = nil,   ["description"] = "Light up that og kush son!"},
	["weed_amnesia_joint"] 			 = {["name"] = "weed_amnesia_joint", 		["label"] = "Amnesia Joint", 			["weight"] = 1, 		["type"] = "item", 		["image"] = "weed_amnesia_joint.png", 		    ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   		["combinable"] = nil,   ["description"] = "Light up that amnesia son!"},
	["weed_ak47_joint"] 			 = {["name"] = "weed_ak47_joint", 			["label"] = "AK 47 Joint", 				["weight"] = 1, 		["type"] = "item", 		["image"] = "weed_ak47_joint.png", 			    ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   		["combinable"] = nil,   ["description"] = "Light up that ak47 son!"},
	["empty_weed_bag"] 				 = {["name"] = "empty_weed_bag", 			["label"] = "Drug Baggies", 			["weight"] = 1, 		["type"] = "item", 		["image"] = "weed-empty-bag.png", 		        ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   		["combinable"] = nil,   ["description"] = "A small empty bag"},
	["weed_nutrition"] 				 = {["name"] = "weed_nutrition", 			["label"] = "Plant Fertilizer", 		["weight"] = 500, 		["type"] = "item", 		["image"] = "weed_nutrition.png", 		        ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	  	    ["combinable"] = nil,   ["description"] = "Get that big bug energy!"},
	["weed_water"] 				     = {["name"] = "weed_water", 			    ["label"] = "Distilled Water", 		    ["weight"] = 500, 		["type"] = "item", 		["image"] = "weed_water.png", 		            ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   		["combinable"] = nil,   ["description"] = "Distilled water for your plants"},
	["weed_pot"] 				     = {["name"] = "weed_pot", 			        ["label"] = "Plant Pot", 		        ["weight"] = 100, 		["type"] = "item", 		["image"] = "weed_pot.png", 		            ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   		["combinable"] = nil,   ["description"] = "A simple plant pot for all your planting needs!"},
	["rolling_paper"] 			 	 = {["name"] = "rolling_paper", 			["label"] = "Rolling Papers", 			["weight"] = 1, 		["type"] = "item", 		["image"] = "rolling_paper.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Paper made specifically for encasing and smoking tobacco or cannabis."},
	['trowel'] 			 	         = {['name'] = 'trowel', 			  		['label'] = 'Trowel', 					['weight'] = 500, 		['type'] = 'item', 		['image'] = 'trowel.png', 						['unique'] = false,    	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'Small handheld garden shovel'},
	['drug_shears'] 			     = {['name'] = 'drug_shears', 		        ['label'] = 'Trimming Shears', 			['weight'] = 200, 		['type'] = 'item', 		['image'] = 'drug_shears.png', 					['unique'] = false,    	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'A set of high quality trimming shears.'},	
	["drug_scales"] 		 	     = {["name"] = "drug_scales", 				["label"] = "Scale", 					["weight"] = 1500, 	    ["type"] = "item", 		["image"] = "drug_scales.png", 					["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   		["combinable"] = nil,   ["description"] = "This is not what it looks like"},

### PREVIEW ###
https://www.youtube.com/watch?v=zu-ztrWSovI

### SUPPORT ###
https://discord.gg/qkWHBqHJg6



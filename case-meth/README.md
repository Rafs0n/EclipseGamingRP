-------------------------------
---------- CASE#2506 ----------
-------------------------------

### CASE METH DRUG SCRIPT ###

This script is a one of a kind meth script built to replace qb-methlab.
We were not happy with the initial teleport in methlab resource so it got replaced.
This resource also provides two more locations for your citizens to aquire items such as iron, aluminum or whatever you desire.
All easily adjusted in the config.lua. 
I also have a cocaine script that has just been finished and will be listed soon along with a weed script. 
Once things have been stress and bug tested of course ;)

### USAGE ###

Hydrochloric Acid - Humane Labs, Third-Eye and collect acid from containers.
Acetone - Airport, Third-Eye and search boxes for random assortment of items with big roll item being drug items.
Lithium - Beach west side, Third-Eye to prospect rocks and receive random assortment of items big roll being lithium.
Processing - Chef, processes x3 lithium, x3 hydrochloricacid, x3 acetone into x1 meth_1oz and has a blackmarket store built in.
Cutting - Buy cutting kit, scales, x28 baggies and use the cutting kit to process x1 oz into x20-x28 1g bags.

### INSTALL ### 

1) Drag and drop `case-meth`, `pogressBar`, and `reload-skillbar` into your server resources and delete `qb-methlab` if you no longer wish to use it. 
2) Add `ensure pogressBar`, `ensure reload-skillbar`, and `ensure case-meth` to your `server.cfg`
3) Add items into `qb-core/shared.lua` from the list provided in `readme.md`
4) Add meth as sellable into `qb-drugs` can copy paste this from `readme.md`
4) Copy images from `case-meth/images` to `qb-inventory/html/images`
3) F8, type `refresh` then `ensure pogressBar` followed by `ensure reload-skillbar` followed by `ensure case-meth`
4) Or restart server (make sure qb-target, pogressBar and reload-skillbar is ensured before case-meth)

### SHARED.LUA ###

	["hydrochloricacid"] 			 = {["name"] = "hydrochloricacid", 			["label"] = "Hydrochloric Acid", 		["weight"] = 2500, 		["type"] = "item", 		["image"] = "hydrochloricacid.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   		["combinable"] = nil,   ["description"] = "Component of the gastric acid in the digestive systems of most animal species...including humans"},
	["acetone"] 					 = {["name"] = "acetone", 					["label"] = "Acetone", 					["weight"] = 2500, 		["type"] = "item", 		["image"] = "acetone.png", 						["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   		["combinable"] = nil,   ["description"] = "Breathing moderate amounts for a short amount of time can irritate your nose, throat, lungs and eyes"},
	['meth'] 			 	         = {['name'] = 'meth', 						['label'] = '1g of Meth', 			    ['weight'] = 10, 		['type'] = 'item', 		['image'] = 'meth.png', 						['unique'] = false,    	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'A gram of the finest teeth rotting goodness!'},	
	['meth_1oz'] 			 	     = {['name'] = 'meth_1oz', 					['label'] = 'Ounce of Meth', 			['weight'] = 280, 		['type'] = 'item', 		['image'] = 'meth_1oz.png', 					['unique'] = false,    	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'A ounce of the finest teeth rotting goodness!'},	
	['trowel'] 			 	         = {['name'] = 'trowel', 			  		['label'] = 'Trowel', 					['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'trowel.png', 						['unique'] = false,    	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'Small handheld garden shovel'},
	["empty_weed_bag"] 		 	 	 = {["name"] = "empty_weed_bag", 				["label"] = "Baggies", 			    ["weight"] = 10, 	    ["type"] = "item", 		["image"] = "empty_weed_bag.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    		["combinable"] = nil,   ["description"] = "Need some baggies? i got some baggies"},
	["drug_scales"] 		 	     = {["name"] = "drug_scales", 				["label"] = "Scale", 					["weight"] = 1500, 	    ["type"] = "item", 		["image"] = "drug_scales.png", 					["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   		["combinable"] = nil,   ["description"] = "This is not what it looks like"},
	['drug_cuttingkit'] 			 = {['name'] = 'drug_cuttingkit', 			['label'] = 'Cutting Kit', 				['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'drug_cuttingkit.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	  		['combinable'] = nil,   ['description'] = 'I mean you could be using this for checking your eyebrows?'},

### QB-DRUGS ###

	["meth"] = {
        min = 85,
        max = 125,
    },

### REQUIREMENTS ###

qb-menu - https://github.com/qbcore-framework/qb-menu
qb-target - https://github.com/CaseIRL/qb-target
pogressBar - https://github.com/CaseIRL/pogressBar
reload-skillbar - https://github.com/CaseIRL/reload-skillbar

### PREVIEW ###

https://www.youtube.com/watch?v=c5izzUXiPUc

### SUPPORT ### 

https://discord.gg/FEWrBe5fEP



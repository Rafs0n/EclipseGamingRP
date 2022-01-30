-------------------------------
---------- CASE#2506 ----------
-------------------------------

### QBCORE NEW COKE ###

This is a pretty indepth cocaine script for your QBCore city! 
Multiple tasks to do before receiveing drugs with easily customisable rewards.
Crack Cocaine is included built into the script. 
Blackmarket also built in to the script.
Both drugs are usable.
Easily pairs with my meth script if you are using all information is provided on how to do this.
Enjoy! :)

### USAGE ###

- Use third eye to harvest cocaine plants for `cocaleaf`
- Search army fuel trailers for `illegalgasoline`
- Search aeroplane crates for `benzocaine` hidden in peoples luggage
- Process drugs; Cocaine: x3 `cocaleaf` x3 `illegalgasoline` x3 `benzocaine` into x1 ounce of cocaine
- Process drugs; Crack Cocaine: x1 `coke_1oz` x5 `sodiumbicarbonate` x5 `water_bottle` into x1 ounce of cocaine
- To cut drugs you need: x1 `drug_scales` x1 `drug_cuttingkit`, use the `drug_cuttingkit` to start cutting
- Cut drugs; Cocaine: x1 `coke_1oz` x28 `empty_weed_bag` rewards (20,28) `cokebaggy`, this cant be easily adjusted
- Cut drugs; Crack Cocaine: x1 `crack_1oz` x50 `empty_weed_bag` rewards (30,50) `crack_baggy`, this can be easily adjusted
- Use drugs; Cocaine: `cokebaggy` gives small speed, repeat stamina replenish, reduces stress, small amount of hp
- Use drugs; Crack Cocaine: Need a lighter to smoke `crack_baggy` gives large armour, reduces stress, increases stamina 

### INSTALL ###

1) Customise `config.lua` to your liking.
2) Drag and drop `case-coke`, `pogressBar`, and `reload-skillbar` `qb-target` into your server resources you should already have `qb-menu` if not a link has been provided
3) Delete `qb-coke` as it is no longer required `case-coke` everything it does and more
4) Add item information provided into `qb-core/shared.lua`
5) Add images provided into `qb-core/inventory/html/images`
6) Add `pogressBar`, `reload-skillbar`, and `ensure case-coke`, to your server.cfg make sure to start `pogressBar` and `reload-skillbar` first
8) Restart your city 

Note: To reactivate map blips uncomment line; 12 and line; 70 in `case-coke/client/cocaine_c.lua`

### SHARED.LUA ### 

-- You should already have `crack_baggy`, `cokebaggy`, `water_bottle`, `lighter` in your shared.lua already either delete them or don't add mine

	["cokebaggy"] 					 = {["name"] = "cokebaggy", 			  	["label"] = "1g Bag of Coke", 			["weight"] = 10, 		["type"] = "item", 		["image"] = "cocaine_baggy.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    		["combinable"] = nil,   ["description"] = "A gram of the finest nose candy!"},
	["coke_1oz"] 					 = {["name"] = "coke_1oz", 			  	  	["label"] = "Ounce of Cocaine", 	    ["weight"] = 280, 		["type"] = "item", 		["image"] = "coke_1oz.png", 					["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    		["combinable"] = nil,   ["description"] = "A ounce of the finest nose candy!"},
	["benzocaine"] 					 = {["name"] = "benzocaine", 			  	["label"] = "Benzocaine", 				["weight"] = 500, 		["type"] = "item", 		["image"] = "benzocaine.png", 					["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    		["combinable"] = nil,   ["description"] = "Benzo? You got a toothache mate?"},
	["water_bottle"] 				 = {["name"] = "water_bottle", 			  	["label"] = "Bottle of Water", 			["weight"] = 500, 		["type"] = "item", 		["image"] = "water_bottle.png", 		        ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	        ["combinable"] = nil,   ["description"] = "For all the thirsty out there"},
	["crack_1oz"] 				     = {["name"] = "crack_1oz", 			  	["label"] = "Ounce of Crack", 			["weight"] = 500, 		["type"] = "item", 		["image"] = "crack_1oz.png", 		            ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	        ["combinable"] = nil,   ["description"] = "For all the thirsty out there"},
	['sodiumbicarbonate'] 			 = {['name'] = 'sodiumbicarbonate', 		['label'] = 'Baking Soda', 			    ['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'sodiumbicarbonate.png', 			['unique'] = false,    	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'Baking soda ey? What you cooking?'},	
	["illegalgasoline"] 			 = {["name"] = "illegalgasoline", 			["label"] = "Illegal Gasoline", 		["weight"] = 2500, 		["type"] = "item", 		["image"] = "illegalgasoline.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    		["combinable"] = nil,   ["description"] = "Stolen gasoline? What are you doing with this?"},
	["crack_baggy`"] 			     = {["name"] = "crack_baggy", 			  	["label"] = "1g Bag of Crack", 			["weight"] = 10, 		["type"] = "item", 		["image"] = "crack_baggy.png", 		            ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,         ["combinable"] = nil,   ["description"] = "Man your about to lose some teeth!"},
	['trowel'] 			 	         = {['name'] = 'trowel', 			  		['label'] = 'Trowel', 					['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'trowel.png', 						['unique'] = false,    	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'Small handheld garden shovel'},
	["empty_weed_bag"] 		 	 	 = {["name"] = "empty_weed_bag", 			["label"] = "Baggies", 					["weight"] = 10, 	    ["type"] = "item", 		["image"] = "empty_weed_bag.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    		["combinable"] = nil,   ["description"] = "Need some baggies? i got some baggies"},
	["drug_scales"] 		 	     = {["name"] = "drug_scales", 				["label"] = "Scale", 					["weight"] = 1500, 	    ["type"] = "item", 		["image"] = "drug_scales.png", 					["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   		["combinable"] = nil,   ["description"] = "This is not what it looks like"},
	["lighter"] 				 	 = {["name"] = "lighter", 			  	  	["label"] = "Lighter", 					["weight"] = 5, 		["type"] = "item", 		["image"] = "lighter.png", 				        ["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "On new years eve a nice fire to stand next to"},
	['drug_cuttingkit'] 			 = {['name'] = 'drug_cuttingkit', 			['label'] = 'Cutting Kit', 				['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'drug_cuttingkit.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	  		['combinable'] = nil,   ['description'] = 'I mean you could be using this for checking your eyebrows?'},

### REQUIREMENTS ###

qb-menu - https://github.com/qbcore-framework/qb-menu
qb-target - https://github.com/CaseIRL/qb-target
pogressBar - https://github.com/CaseIRL/pogressBar
reload-skillbar - https://github.com/CaseIRL/reload-skillbar

### IF USING CASE-METH ###

Go to `case-coke/client/cocaine_c.lua` and uncomment this code on line; 314 to have meth coke and crack on one menu remember to customise header on line; 292

	--{ -- Uncomment this and delete this note if you are also using case-meth, follow insctructions provided in readme.md to disable cutting feature from meth so they do not conflict.
		--    header = "Process Ounces of Meth",
		--    txt = "Break down ounces into 1g bags.",
		--    params = {
		--        event = "case:server:CutDrugs",
		--        isServer = true,
		--        args = 3
		--    }
   --},

Go to `case-meth/server/meth_s.lua` and uncomment this code from line; 98 to line; 155 like show below
Otherwise the drug cutting section of the scripts will conflict as they have been written in a way that will allow integration. 

--[[ Cut drugs 
RegisterServerEvent('case:server:CutDrugs', function(args) 
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



### PREVIEW ###

https://www.youtube.com/watch?v=3HakVEX_-Is

### SUPPORT ### 

https://discord.gg/FEWrBe5fEP



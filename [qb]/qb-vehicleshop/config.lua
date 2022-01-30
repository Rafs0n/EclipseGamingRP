Config = {}
Config.UsingTarget = true -- If you are using qb-target (uses entity zones to target vehicles)
Config.Commission = 0.10 -- Percent that goes to sales person from a full car sale 10%
Config.FinanceCommission = 0.05 -- Percent that goes to sales person from a finance sale 5%
Config.FinanceZone = vector3(-29.53, -1103.67, 26.42) -- Where the finance menu is located
Config.PaymentWarning = 10 -- time in minutes that player has to make payment before repo
Config.PaymentInterval = 24 -- time in hours between payment being due
Config.MinimumDown = 10 -- minimum percentage allowed down
Config.MaximumPayments = 24 -- maximum payments allowed
Config.Shops = {
    ['pdm'] = {
        ['Type'] = 'free-use',  -- no player interaction is required to purchase a car
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the shop
                vector2(-56.727394104004, -1086.2325439453),
                vector2(-60.612808227539, -1096.7795410156),
                vector2(-58.26834487915, -1100.572265625),
                vector2(-35.927803039551, -1109.0034179688),
                vector2(-34.427627563477, -1108.5111083984),
                vector2(-32.02657699585, -1101.5877685547),
                vector2(-33.342102050781, -1101.0377197266),
                vector2(-31.292987823486, -1095.3717041016)
            },
            ['minZ'] = 25.0,  -- min height of the shop zone
            ['maxZ'] = 28.0  -- max height of the shop zone
        },
        ['Job'] = 'none', -- Name of job or none
        ['ShopLabel'] = 'Premium Deluxe Motorsport', -- Blip name
        ['showBlip'] = true,  --- true or false
        ['Categories'] = { -- Categories available to browse
            ['sportsclassics'] = 'Sports Classics',
            ['sedans'] = 'Sedans',
            ['coupes'] = 'Coupes',
            ['suvs'] = 'SUVs',
            ['offroad'] = 'Offroad',
            ['muscle'] = 'Muscle',
            ['compacts'] = 'Compacts',
            ['motorcycles'] = 'Motorcycles',
            ['vans'] = 'Vans',
            ['imports'] = 'Imports'
        },
        ['TestDriveTimeLimit'] = 1.0, -- Time in minutes until the vehicle gets deleted
        ['Location'] = vector3(-45.67, -1098.34, 26.42), -- Blip Location
        ['ReturnLocation'] = vector3(-44.74, -1082.58, 26.68), -- Location to return vehicle, only enables if the vehicleshop has a job owned
        ['VehicleSpawn'] = vector4(-14.07, -1089, 27.04, 157.02), -- Spawn location when vehicle is bought
        ['ShowroomVehicles'] = {
            [1] = {
                coords = vector4(-42.43, -1101.22, 26.3, 283.36), -- where the vehicle will spawn on display
                defaultVehicle = 'dominator', -- Default display vehicle
                chosenVehicle = 'dominator', -- Same as default but is dynamically changed when swapping vehicles
            },
            [2] = {
                coords = vector4(-37.13, -1093.17, 26.3, 113.77),
                defaultVehicle = 'schafter2',
                chosenVehicle = 'schafter2',
            },
            [3] = {
                coords = vector4(-47.7, -1091.91, 26.3, 186.87),
                defaultVehicle = 'comet2',
                chosenVehicle = 'comet2',
            },
            [4] = {
                coords = vector4(-54.18, -1096.81, 26.3, 299.52),
                defaultVehicle = 'vigero',
                chosenVehicle = 'vigero',
            },
            [5] = {
                coords = vector4(-49.82, -1083.6, 26.3, 157),
                defaultVehicle = 'dominator8',
                chosenVehicle = 'dominator8',
            }
        },
    },
    ['luxury'] = {
        ['Type'] = 'free-use',  -- meaning a real player has to sell the car
        ['Zone'] = {
            ['Shape'] = {
                vector2(-81.724754333496, 72.436462402344),
                vector2(-60.159938812256, 60.576206207275),
                vector2(-55.763122558594, 61.749210357666),
                vector2(-52.965869903564, 69.869110107422),
                vector2(-50.352680206299, 75.886123657227),
                vector2(-61.261016845703, 81.564918518066),
                vector2(-63.812171936035, 75.633102416992),
                vector2(-76.546226501465, 81.189826965332)
            },
            ['minZ'] = 69.0,
            ['maxZ'] = 76.0
        },
        ['Job'] = 'cardealer', -- Name of job or none
        ['ShopLabel'] = 'Luxury Vehicle Shop',
        ['showBlip'] = true,  --- true or false
        ['Categories'] = {
            ['super'] = 'Super',
            ['sports'] = 'Sports',
            ['imports'] = 'Imports'

        },
        ['TestDriveTimeLimit'] = 0.5,
        ['Location'] = vector3(-63.59, 68.25, 73.06),
        ['ReturnLocation'] = vector3(-65.05, 81.23, 71.16),
        ['VehicleSpawn'] = vector4(-71.13, 84.04, 71.09, 65.23),
        ['ShowroomVehicles'] = {
            [1] = {
                coords = vector4(-75.96, 74.78, 70.90, 221.69),
                defaultVehicle = 'italirsx',
                chosenVehicle = 'italirsx',
            },
            [2] = {
                coords = vector4(-66.52, 74.33, 70.65, 188.03),
                defaultVehicle = 'italigtb',
                chosenVehicle = 'italigtb',
            },
            [3] = {
                coords = vector4(-71.83, 68.60, 70.75, 276.57),
                defaultVehicle = 'nero',
                chosenVehicle = 'nero',
            },
            [4] = {
                coords = vector4(-59.95, 68.61, 70.85, 181.44),
                defaultVehicle = 'comet2',
                chosenVehicle = 'comet2',
            }
        }
    },
    ['mrpd'] = {
        ['Type'] = 'free-use',  -- meaning a real player has to sell the car
        ['Zone'] = {
            ['Shape'] = {
                vector2(423.12329101562, -1000.348449707),
                vector2(423.15301513672, -986.32153320312),
                vector2(423.15896606445, -973.0498046875),
                vector2(440.33074951172, -973.04022216797),
                vector2(459.71984863281, -973.04022216797),
                vector2(460.05700683594, -986.66430664062),
                vector2(460.00570678711, -1000.284362793),
                vector2(441.29751586914, -998.59613037109)
            },
            ['minZ'] = 25.6,
            ['maxZ'] = 25.7
        },
        ['Job'] = 'police', -- Name of job or none
        ['ShopLabel'] = 'Police Shop',
        ['showBlip'] = false,  --- true or false
        ['Categories'] = {
            ['utility'] = 'Utility',
            ['interceptor'] = 'Interceptors',
            ['hsu'] = 'High Speed',
            ['truck'] = 'Pickup Truck'
        },
        ['TestDriveTimeLimit'] = 0.0,
        ['Location'] = vector3(441.62, -991.1, 25.7),
        ['ReturnLocation'] = vector3(458.92, -992.94, 25.7),
        ['VehicleSpawn'] = vector3(458.92, -992.94, 25.7),
        ['ShowroomVehicles'] = {
            [1] = {
                coords = vector4(451.22, -975.58, 24.7, 91.81),
                defaultVehicle = '11cvpiv',
                chosenVehicle = '11cvpiv',
            },
            [2] = {
                coords = vector4(436.09, -975.76, 24.7, 92.3),
                defaultVehicle = '16fpiuvs',
                chosenVehicle = '16fpiuvs',
            }
        }
    }
}
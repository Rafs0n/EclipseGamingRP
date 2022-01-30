function AddTextEntry(key, value)
	Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), key, value)
end

Citizen.CreateThread(function()
	AddTextEntry('0x41B98291', 'Terzo Millennio')
	AddTextEntry('0xAC6B8829', 'Lamborghini')
end)
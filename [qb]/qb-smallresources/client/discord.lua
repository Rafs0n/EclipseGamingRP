-- To Set This Up visit https://forum.cfx.re/t/how-to-updated-discord-rich-presence-custom-image/157686

CreateThread(function()
    while true do
        -- This is the Application ID (Replace this with you own)
	SetDiscordAppId(937478143516749835v)

        -- Here you will have to put the image name for the "large" icon.
	SetDiscordRichPresenceAsset('big')
        
        -- (11-11-2018) New Natives:

        -- Here you can add hover text for the "large" icon.
        SetDiscordRichPresenceAssetText('Eclipse Gaming | discord.gg/vDehxHpbT8 ')
       
        -- Here you will have to put the image name for the "small" icon.
        SetDiscordRichPresenceAssetSmall('small')

        -- Here you can add hover text for the "small" icon.
        SetDiscordRichPresenceAssetSmallText('Come Join!')

        -- It updates every minute just in case.
	Wait(60000)
    end
end)

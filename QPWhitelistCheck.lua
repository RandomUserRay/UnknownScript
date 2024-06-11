local http = game:GetService("HttpService")
local plr = game:GetService("Players")
local lplr = plr.LocalPlayer

local succ, result = pcall(function()
	return http:JSONDecode(game:HttpGet("https://raw.githubusercontent.com/RandomUserRay/UnknownScript/main/whitelistqp"))
end)

if succ and result[gethwid()] then
    print("✅ -- Whitelisted!")
	
	return
end

if not result[gethwid()] then
     print("⛔ -- Not Whitelisted!")

   return
end

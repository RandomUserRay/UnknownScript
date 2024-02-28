--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.2) ~  Much Love, Ferib 

]]--

getgenv().Prediction = 0.131 - 0;
getgenv().AirshotFunc = true;
local v2 = {main={Mario=true,Part="HumanoidRootPart",Key="p",Notifications=true},Tracer={TracerThickness=(1894.5 - (1242 + 649)),TracerTransparency=1,TracerColor=Color3.fromRGB(255, 0 - 0, 0 + 0)}};
local v3 = game:GetService("Workspace").CurrentCamera;
local v4 = game.Players.LocalPlayer:GetMouse();
local v5 = game:GetService("RunService");
local v6 = game.Players.LocalPlayer;
local v7 = Drawing.new("Line");
local v8 = game:GetService("GuiService"):GetGuiInset().Y;
v4.KeyDown:Connect(function(v19)
	if (v19 == v2.main.Key) then
		if (v2.main.Mario == true) then
			local v36 = 0;
			while true do
				if (v36 == (350 - (87 + 263))) then
					v2.main.Mario = false;
					if (v2.main.Notifications == true) then
						v6 = FindClosestUser();
						game.StarterGui:SetCore("SendNotification", {Title="Rage Tracing!?!",Text="Best Rage Tracing!?!"});
					end
					break;
				end
			end
		else
			v6 = FindClosestUser();
			v2.main.Mario = true;
			if (v2.main.Notifications == true) then
				game.StarterGui:SetCore("SendNotification", {Title="Rage Tracing!âˆš",Text=("Rage Tracing!" .. tostring(v6.Character.Humanoid.DisplayName))});
			end
		end
	end
end);
function FindClosestUser()
	local v20;
	local v21 = math.huge;
	for v26, v27 in pairs(game.Players:GetPlayers()) do
		if ((v27 ~= game.Players.LocalPlayer) and v27.Character and v27.Character:FindFirstChild("Humanoid") and (v27.Character.Humanoid.Health ~= (180 - (67 + 113))) and v27.Character:FindFirstChild("HumanoidRootPart")) then
			local v32 = 0 + 0;
			local v33;
			local v34;
			while true do
				if (1 == v32) then
					if (v34 < v21) then
						v20 = v27;
						v21 = v34;
					end
					break;
				end
				if (v32 == 0) then
					v33 = v3:WorldToViewportPoint(v27.Character.PrimaryPart.Position);
					v34 = (Vector2.new(v33.X, v33.Y) - Vector2.new(v4.X, v4.Y)).magnitude;
					v32 = 2 - 1;
				end
			end
		end
	end
	return v20;
end
getgenv().keytoclick = "P";
tool = Instance.new("Tool");
tool.RequiresHandle = false;
tool.Name = "Aimlock";
tool.Activated:connect(function()
	local v22 = game:service("VirtualInputManager");
	v22:SendKeyEvent(true, keytoclick, false, game);
end);
tool.Parent = game.Players.LocalPlayer.Backpack;
game.StarterGui:SetCore("SendNotification", {Title="Sub to Ryzzchips",Text="Thanks for using my Script!"});
local v14 = game.Players.LocalPlayer;
local function v15()
	v14.CharacterAdded:Connect(onCharacterAdded);
end
v15();
v14.CharacterRemoving:Connect(function()
	tool.Parent = game.Players.LocalPlayer.Backpack;
end);
v5.Stepped:connect(function()
	if (v2.main.Mario == true) then
		local v28 = 0 + 0;
		local v29;
		while true do
			if (v28 == (3 - 2)) then
				v7.Thickness = v2.Tracer.TracerThickness;
				v7.Transparency = v2.Tracer.TracerTransparency;
				v28 = 954 - (802 + 150);
			end
			if (v28 == (5 - 3)) then
				v7.From = Vector2.new(v4.X, v4.Y + v8);
				v7.To = Vector2.new(v29.X, v29.Y);
				v28 = 5 - 2;
			end
			if ((3 + 0) == v28) then
				v7.Visible = true;
				break;
			end
			if (v28 == (997 - (915 + 82))) then
				v29 = v3:WorldToViewportPoint(v6.Character[v2.main.Part].Position + (v6.Character.HumanoidRootPart.Velocity * Prediction));
				v7.Color = v2.Tracer.TracerColor;
				v28 = 2 - 1;
			end
		end
	else
		v7.Visible = false;
	end
end);
local v16 = getrawmetatable(game);
local v17 = v16.__namecall;
setreadonly(v16, false);
v16.__namecall = newcclosure(function(...)
	local v25 = {...};
	if (v2.main.Mario and (getnamecallmethod() == "FireServer") and (v25[2 + 0] == "UpdateMousePos")) then
		local v31 = 0 - 0;
		while true do
			if (v31 == (1187 - (1069 + 118))) then
				v25[3] = v6.Character[v2.main.Part].Position + (v6.Character[v2.main.Part].Velocity * Prediction);
				return v17(unpack(v25));
			end
		end
	end
	return v17(...);
end);
if (AirshotFunc == true) then
	if ((v6.Character.Humanoid.Jump == true) and (v6.Character.Humanoid.FloorMaterial == Enum.Material.Air)) then
		settings.main.Part = "RightFoot";
	else
		v6.Character:WaitForChild("Humanoid").StateChanged:Connect(function(v38, v39)
			if (v39 == Enum.HumanoidStateType.Freefall) then
				settings.main.Part = "LowerTorso";
			else
				settings.main.Part = "HumanoidRootPart";
			end
		end);
	end
end
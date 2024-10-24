-- Load Rayfield UI by Sirius
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Create the main window
local Window = Rayfield:CreateWindow({
    Name = "TrueShot",
    LoadingTitle = "TrueShot.cc the best script!"
})

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

-- Initialize settings with default values
_G.AimbotEnabled = false
_G.TeamCheck = false
_G.AimPart = "Head" -- Default aim part
_G.Sensitivity = 0.1 -- Aimbot sensitivity
_G.CircleSides = 64
_G.CircleColor = Color3.fromRGB(255, 255, 255)
_G.CircleTransparency = 0.7
_G.CircleRadius = 80
_G.CircleFilled = false
_G.CircleVisible = true
_G.CircleThickness = 0
_G.MaxDetectionDistance = 1000 -- Maximum detection distance for players

-- Create Tabs
local MainTab = Window:CreateTab("Home", 4483362458)
local MiscTab = Window:CreateTab("Misc")
local AimbotSection = MainTab:CreateSection("Aimbot")

-- Create FOV Circle
local FOVCircle = Drawing.new("Circle")
FOVCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
FOVCircle.Radius = _G.CircleRadius
FOVCircle.Filled = _G.CircleFilled
FOVCircle.Color = _G.CircleColor
FOVCircle.Visible = _G.CircleVisible
FOVCircle.Transparency = _G.CircleTransparency
FOVCircle.NumSides = _G.CircleSides
FOVCircle.Thickness = _G.CircleThickness

-- Function to get the closest player based on FOV and distance
local function GetClosestPlayer()
    local MaximumDistance = _G.MaxDetectionDistance
    local Target = nil

    for _, v in next, Players:GetPlayers() do
        if v.Name ~= LocalPlayer.Name then
            if _G.TeamCheck == true and v.Team ~= LocalPlayer.Team or not _G.TeamCheck then
                if v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                    local humanoid = v.Character:FindFirstChild("Humanoid")
                    if humanoid and humanoid.Health > 0 then
                        local aimPart = v.Character:FindFirstChild(_G.AimPart) or v.Character:FindFirstChild("HumanoidRootPart")
                        if aimPart then
                            local ScreenPoint = Camera:WorldToScreenPoint(aimPart.Position)
                            local VectorDistance = (Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y) - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude

                            local WorldDistance = (Camera.CFrame.Position - aimPart.Position).Magnitude
                            if VectorDistance < _G.CircleRadius and WorldDistance < MaximumDistance then
                                MaximumDistance = WorldDistance
                                Target = v
                            end
                        end
                    end
                end
            end
        end
    end
    return Target
end

-- Input handling for aimbot (when right mouse button is held)
local Holding = false
UserInputService.InputBegan:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.MouseButton2 then
        Holding = true
    end
end)

UserInputService.InputEnded:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.MouseButton2 then
        Holding = false
    end
end)

-- Main aimbot logic
RunService.RenderStepped:Connect(function()
    -- Update FOV Circle position
    FOVCircle.Position = Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y)
    FOVCircle.Radius = _G.CircleRadius
    FOVCircle.Filled = _G.CircleFilled
    FOVCircle.Color = _G.CircleColor
    FOVCircle.Visible = _G.CircleVisible
    FOVCircle.Transparency = _G.CircleTransparency
    FOVCircle.NumSides = _G.CircleSides
    FOVCircle.Thickness = _G.CircleThickness

    if Holding and _G.AimbotEnabled then
        local target = GetClosestPlayer()
        if target and target.Character then
            local aimPart = target.Character:FindFirstChild(_G.AimPart) or target.Character:FindFirstChild("HumanoidRootPart")
            if aimPart then
                TweenService:Create(Camera, TweenInfo.new(_G.Sensitivity, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = CFrame.new(Camera.CFrame.Position, aimPart.Position)}):Play()
            end
        end
    end
end)

-- Aimbot Toggle
local Toggle = MainTab:CreateToggle({
    Name = "Enable Aimbot",
    CurrentValue = false,
    Flag = "AimbotToggle",
    Callback = function(Value)
        _G.AimbotEnabled = Value
    end
})

-- Slider for adjusting FOV Circle radius
local fovSlider = MainTab:CreateSlider({
    Name = "FOV Radius",
    Range = {0, 500},
    Increment = 1,
    Suffix = "Radius",
    CurrentValue = 80,
    Flag = "FOVRadiusSlider",
    Callback = function(Value)
        _G.CircleRadius = Value
        FOVCircle.Radius = Value
    end
})

-- Dropdown to select aim part (head, torso, etc.)
MainTab:CreateDropdown({
    Name = "Aim Part",
    Options = {"Head", "Torso"},
    CurrentOption = "Head",
    Flag = "AimPartDropdown",
    Callback = function(Value)
        _G.AimPart = Value
    end
})

-- Slider for adjusting aimbot sensitivity
MainTab:CreateSlider({
    Name = "Aimbot Sensitivity",
    Range = {0, 1},
    Increment = 0.01,
    Suffix = "Seconds",
    CurrentValue = 0.1,
    Flag = "SensitivitySlider",
    Callback = function(Value)
        _G.Sensitivity = Value
    end
})

-- Slider for adjusting the maximum detection distance
MainTab:CreateSlider({
    Name = "Max Detection Distance",
    Range = {100, 5000},
    Increment = 100,
    Suffix = "Studs",
    CurrentValue = 1000,
    Flag = "MaxDetectionDistanceSlider",
    Callback = function(Value)
        _G.MaxDetectionDistance = Value
    end
})

-- Toggle for enabling/disabling team check
MainTab:CreateToggle({
    Name = "Team Check",
    CurrentValue = false,
    Flag = "TeamCheckToggle",
    Callback = function(Value)
        _G.TeamCheck = Value
    end
})

-- Miscellaneous settings
local RobloxFov = MiscTab:CreateSlider({
    Name = "Adjust FOV",
    Range = {0, 120},
    Increment = 1,
    Suffix = "°",
    CurrentValue = Camera.FieldOfView,
    Flag = "FOV",
    Callback = function(Value)
        Camera.FieldOfView = Value
    end,
})

local WalkSpeedSlider = MiscTab:CreateSlider({
    Name = "Walkspeed Slider",
    Range = {0, 300},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 16,
    Flag = "WalkSpeedSlider",
    Callback = function(Value)
        LocalPlayer.Character.Humanoid.WalkSpeed = Value
    end,
})

local infJumpToggle = MiscTab:CreateToggle({
    Name = "Infinite Jump",
    CurrentValue = false,
    Flag = "InfiniteJumpToggle",
    Callback = function(Value)
        local InfiniteJumpEnabled = Value
        UserInputService.JumpRequest:Connect(function()
            if InfiniteJumpEnabled then
                LocalPlayer.Character:FindFirstChildOfClass('Humanoid'):ChangeState("Jumping")
            end
        end)
    end,
})

-- CFrame Module for teleporting to the nearest player
local CFrameModule = loadstring(game:HttpGet("https://raw.githubusercontent.com/Fast-Voider/test/refs/heads/main/CFrame.lua"))()
local cFrameToggle = MiscTab:CreateToggle({
    Name = "CFrame to Nearest Player",
    CurrentValue = false,
    Flag = "CFrameToggle",
    Callback = function(Value)
        CFrameModule.Toggle()
    end,
})

-- Flight Module
local Flight = loadstring(game:HttpGet("https://raw.githubusercontent.com/Fast-Voider/test/refs/heads/main/CFrameFlight.lua"))()
MiscTab:CreateToggle({
    Name = "Toggle Flight",
    CurrentValue = false,
    Callback = function(Value)
        Flight.Toggle()
    end
})

MiscTab:CreateSlider({
    Name = "Flight Speed",
    Range = {10, 500},
    Increment = 1,
    Suffix = " Speed",
    CurrentValue = 50,
    Callback = function(Value)
        Flight.SetSpeed(Value)
    end
})

-- Outline ESP Section
local ESPSection = MainTab:CreateSection("ESP")
local OutlineESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/Fast-Voider/test/refs/heads/main/outline.lua"))()

local TESP = MainTab:CreateToggle({
    Name = "Outline ESP",
    CurrentValue = false,
    Flag = "OutlineESPToggle",
    Callback = function(Value)
        OutlineESP.Toggle()
    end,
})

local TeamESP = MainTab:CreateToggle({
    Name = "Team ESP",
    CurrentValue = false,
    Flag = "TeamESPToggle",
    Callback = function(Value)
        OutlineESP.TeamCheck()
    end,
})

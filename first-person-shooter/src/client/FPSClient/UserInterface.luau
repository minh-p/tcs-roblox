local UserInterface = {}
local Players = game:GetService("Players")
local player = Players.LocalPlayer

type FPSUIConfig = {maxAmmo: number}

--[[
   Initializes the user interface for the FPS system
]]
function UserInterface.init(config: FPSUIConfig): nil
   UserInterface.maxAmmo = config.maxAmmo
   UserInterface.currentAmmo = config.maxAmmo
   
   local gunGui = Instance.new("ScreenGui")
   UserInterface.gui = gunGui
   gunGui.Name = "FPS"
   gunGui.ResetOnSpawn = false
   gunGui.Parent = player.PlayerGui

   local ammoFrame = Instance.new("Frame")
   ammoFrame.Parent = gunGui
   ammoFrame.Size = UDim2.new(0, 100, 0, 100)
   ammoFrame.AnchorPoint = Vector2.new(1, 1)
   ammoFrame.Position = UDim2.new(1, 0, 1, 0)

   local ammoCount = Instance.new("TextLabel")
   ammoCount.Parent = ammoFrame
   ammoCount.Text = tostring(config.maxAmmo) .. "/" .. tostring(config.maxAmmo)
   ammoCount.Size = UDim2.new(1, 0, 1, 0)
   ammoCount.AnchorPoint = Vector2.new(0.5, 0.5)
   ammoCount.Position = UDim2.new(0.5, 0, 0.5, 0)
   ammoCount.TextScaled = true
end

return UserInterface

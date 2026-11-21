local camera = workspace.CurrentCamera
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local Viewmodel = {}


--[[
   Initialize the viewmodel module

   viewmodelSrc: The viewmodel to clone
]]

function Viewmodel.init(viewmodelSrc: Model): nil
   local clone = viewmodelSrc:Clone()
   clone.Parent = workspace
   Viewmodel.model = clone

   Viewmodel.RenderStepped = RunService.RenderStepped:Connect(function()
	 local character = player.Character
	 if not character then return end
	 local hrp = character:FindFirstChild("HumanoidRootPart")
	 if not hrp then
	    return
	 end

	 local distanceFromHrp = (hrp.Position - camera.CFrame.Position).Magnitude
	
	 if not character:FindFirstChildOfClass("Tool") or distanceFromHrp > 2 then
	    Viewmodel.model.Parent = nil
	    return
	 end
	 if not Viewmodel.model.Parent then
	    Viewmodel.model.Parent = workspace
	 end
	 clone.PrimaryPart.CFrame = camera.CFrame * CFrame.new(0, -1, 0)
   end)
end

--[[
   Stops the viewmodel system. Once it's stopped you have to initialize again
]]
function Viewmodel.stop(): nil
   assert(Viewmodel.RenderStepped and Viewmodel.model)
   Viewmodel.RenderStepped:Disconnect()
   Viewmodel.model:Destroy()
   Viewmodel.RenderStepped = nil
   Viewmodel.model = nil
end

return Viewmodel

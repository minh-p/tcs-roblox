local ReplicatedStorage = game:GetService("ReplicatedStorage")

local FPSClient = {}

--[[
   Initialize FPS system on the player side
]]
function FPSClient.init(): nil
   local ViewmodelClient = require(script.ViewmodelClient)
   ViewmodelClient.init(ReplicatedStorage.Viewmodel)
   local UserInterface = require(script.UserInterface)
   UserInterface.init({maxAmmo = 30})
end

return FPSClient

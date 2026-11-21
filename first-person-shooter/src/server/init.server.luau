local ViewmodelServer = require(script.ViewmodelServer)
local Players = game:GetService("Players")

Players.PlayerAdded:Connect(function(player)
      player.CharacterAdded:Connect(function()
	    ViewmodelServer.giveGun(player)
      end)
end)

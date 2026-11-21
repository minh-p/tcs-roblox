

local ViewmodelServer = {}

--[[
   Gives a player gun

   player: the player to give gun to
]]
function ViewmodelServer.giveGun(player: Player)
   local gun = Instance.new("Tool")
   gun.RequiresHandle = false
   gun.Name = "Gun"
   gun.Parent = player.Backpack
end

return ViewmodelServer

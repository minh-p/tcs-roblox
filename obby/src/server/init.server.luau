local part = Instance.new("Part")
part.Parent = workspace

part.Position = Vector3.new(0, 3, 0)

local function killPotentialPlayer(partTouched: BasePart)
   local humanoid = partTouched.Parent:FindFirstChild("Humanoid")
   if not humanoid then
      return
   end
   humanoid.Health = 0
end
part.Touched:Connect(killPotentialPlayer)

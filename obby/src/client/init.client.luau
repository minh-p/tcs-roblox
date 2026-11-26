-- Double Jumping

local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

export type Character = Model & {
   Humanoid: Humanoid?,
   HumanoidRootPart: BasePart?,
				}

local DOUBLE_JUMP_CD = 2
local MAX_SECOND_JUMP_WAIT = 1

local firstJumpTime = os.time()
local lastDoubleJumpTime = os.time()
local doubleJumpEnabled = false

local function canDoubleJump()
   local notSpamming = os.time() - lastDoubleJumpTime > DOUBLE_JUMP_CD
   local fastEnough = os.time() - firstJumpTime <= MAX_SECOND_JUMP_WAIT
   return notSpamming and fastEnough
end

local function listenToFirstJump(character: Character)
   local humanoid = character:WaitForChild("Humanoid")
   humanoid.StateChanged:Connect(function(oldState, newState)
	 if newState == Enum.HumanoidStateType.Jumping then
	    firstJumpTime = os.time()
	    doubleJumpEnabled = canDoubleJump()
	 end
   end)
end

local function listenToSecondJump(inputObject: InputObject)
   local character = player.Character
   if not character then return end
   local humanoid = character:FindFirstChild("Humanoid")
   if not humanoid then return end
   
   if inputObject.KeyCode == Enum.KeyCode.Space then
      if doubleJumpEnabled then
	 if humanoid:GetState() ~= Enum.HumanoidStateType.Jumping then
	    humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
	    doubleJumpEnabled = false
	    lastDoubleJumpTime = os.time()
	 end
      end
   end
end

player.CharacterAdded:Connect(listenToFirstJump)
UserInputService.InputBegan:Connect(listenToSecondJump)


-- We need this lmao --

local PlayerService = game:GetService("Players")

repeat wait() until #PlayerService:GetPlayers() >= 2

-- Player Variables --

local Player = game.Players.LocalPlayer
local Character: Model = Player.Character or Player.CharacterAdded:Wait()
local Humanoid: Humanoid = Character:WaitForChild('Humanoid')
local HumanoidRootPart: Part = Character:WaitForChild('HumanoidRootPart')

-- Helper Functions --

function getOtherPlayer(currentPlayer: Player): Player
	
	local targetPlayer: Player = nil
	
	for _, players: Player in pairs(PlayerService:GetPlayers()) do
		if players.Name ~= currentPlayer.Name then
			targetPlayer = players
		end
	end
		
	return targetPlayer	
end

function CenterCamera(camera: Camera, hrp1: Part, hrp2: Part)
	
	local VectorBetweenPlayer: Vector3 = (hrp1.Position + hrp2.Position) / 2
	local GoalCFrame: CFrame = CFrame.new(Vector3.new(VectorBetweenPlayer.X, 4.5, -20)) * CFrame.Angles(0, math.rad(180), 0)
	
	camera.CFrame = camera.CFrame:Lerp(GoalCFrame, 0.5)
end

-- Script Variables --

local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera
local otherPlayer = getOtherPlayer(Player)
local otherChar: Model = otherPlayer.Character or otherPlayer.CharacterAdded:Wait()
local otherHRP: Part = otherChar:WaitForChild('HumanoidRootPart')

-- Setup --

Camera.CameraType = Enum.CameraType.Scriptable
Camera.CameraSubject = nil

-- Activation --

RunService.RenderStepped:Connect(function(deltaTime: number) 	
	CenterCamera(Camera, HumanoidRootPart, otherHRP)	
end)



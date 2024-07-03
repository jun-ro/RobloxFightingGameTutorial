-- Player Variables --

local Player = game.Players.LocalPlayer
local Character: Model = Player.Character or Player.CharacterAdded:Wait()
local Humanoid: Humanoid = Character:WaitForChild('Humanoid')
local HumanoidRootPart: Part = Character:WaitForChild('HumanoidRootPart')

-- Script Variables --

local GameReadyEvent: RemoteEvent = game.ReplicatedStorage.RemoteEvents.GameReady

-- Activation

repeat wait() until game:IsLoaded() -- Wait until the game is actually fully loaded

GameReadyEvent:FireServer()

-- Humanoid Stuff --

Humanoid.AutoRotate = false

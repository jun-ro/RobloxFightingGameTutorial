local Players = game:GetService('Players')
local SpawnFolder = workspace.Spawns
local GameReady = game.ReplicatedStorage.RemoteEvents.GameReady

local playerCollection = {} -- Create a grouping of players so that we can set their spawns, this also works as a "Ready Up"

GameReady.OnServerEvent:Connect(function(player: Player) 
	table.insert(playerCollection, player) -- Insert our player into the table
	
	if #playerCollection >= 2 then -- >= Just to make sure lol, once everyone's ready, set their spawns.
		for i: number, players: Player in pairs(playerCollection) do
			local Character: Model = players.Character or players.CharacterAdded:Wait()
			local HumanoidRootPart: Part = Character:WaitForChild('HumanoidRootPart')
			HumanoidRootPart.CFrame = SpawnFolder:GetChildren()[i].CFrame
		end
	end
end)


local event = game.ReplicatedStorage.KilledEvent

game.Players.PlayerAdded:Connect(function(plr)
	plr.CharacterAdded:Connect(function(char)
		char:WaitForChild("Humanoid").Died:connect(function(killed)
			local killer = char.Humanoid:FindFirstChild("creator")
			if killer.Value then
				local killerName = killer.Value.Name
				event:FireAllClients(plr, killerName)
			end
		end)
	end)
end)
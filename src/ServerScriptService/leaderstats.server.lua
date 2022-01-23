game.Players.PlayerAdded:Connect(function(player)
    local leaderstats = Instance.new("Folder")
    leaderstats.Name = "leaderstats"
    leaderstats.Parent = player

    local kills = Instance.new("IntValue")
    kills.Name = "Kills"
    kills.Value = 0
    kills.Parent = leaderstats

    local deaths = Instance.new("IntValue")
    deaths.Name = "Deaths"
    deaths.Value = 0
    deaths.Parent = leaderstats

    player.CharacterAdded:Connect(function(character)
        local humanoid = character:FindFirstChild("Humanoid")

        humanoid.Died:Connect(function(died)
            deaths.Value = deaths.Value + 1
            local tag = humanoid:FindFirstChild("creator")
            local killer = tag.Value
            if tag and killer then 
                killer.leaderstats:FindFirstChild("Kills").Value = killer.leaderstats:FindFirstChild("Kills").Value + 1
            end
        end)
    end)
end)
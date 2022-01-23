local event = game.ReplicatedStorage.KilledEvent

event.OnClientEvent:Connect(function(plr, killerName)
	if killerName and plr.Name then
		local text = Instance.new("TextLabel")
		text.Parent = script.Parent
		text.BackgroundTransparency = 1
		text.TextScaled = true
		text.TextColor3 = Color3.new(1, 1, 1)
		text.Font = Enum.Font.GothamBlack
		text.Text = plr.Name.." was killed by "..killerName
		wait(25)
		text.Visible = false
	end
end)
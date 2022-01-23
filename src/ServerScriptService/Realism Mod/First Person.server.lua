-- Services
local playerService = game:GetService("Players")

playerService.PlayerAdded:Connect(function (plr)
	plr.CharacterAdded:wait()
	plr.CameraMode = Enum.CameraMode.LockFirstPerson
end)
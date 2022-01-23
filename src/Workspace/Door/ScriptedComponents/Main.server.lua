--Made by nazzy567.

local Door = script.Parent.Door
local Button1 = script.Parent.Button1
local Open = false

local OpenSound = Door.DoorOpen
local CloseSound = Door.DoorClose

local Debounce = false
function ButtonClicked(Player)
	if not Debounce then
		Debounce = true
		if Open then
			Open = false
			CloseSound:Play()
			Door.Transparency = 0
			for i,v in pairs(Door:GetChildren()) do
				if v:IsA("Decal") then
					v.Transparency = 0
				end
			end
			for i = 1,(Door.Size.z / 0.15) do
				Door.CFrame = Door.CFrame + (Door.CFrame.lookVector * 0.15)
				wait()
			end
		else
			Open = true
			OpenSound:Play()
			for i = 1,(Door.Size.z / 0.15) do
				Door.CFrame = Door.CFrame - (Door.CFrame.lookVector * 0.15)
				wait()
			end
			Door.Transparency = 1
			for i,v in pairs(Door:GetChildren()) do
				if v:IsA("Decal") then
					v.Transparency = 1
				end
			end
		end
		wait(0.5)
		Debounce = false
	end
end
Button1.ClickDetector.MouseClick:connect(ButtonClicked)


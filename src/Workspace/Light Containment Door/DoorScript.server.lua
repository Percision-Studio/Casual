local isopen = script.Parent.IsOpen
local idle = true
local button1 = script.Parent.Button1
local button2 = script.Parent.Button2
local click1 = button1.ClickDetector
local click2 = button2.ClickDetector
function active(silent)
	if idle and not script.Parent.Locked.Value then
		idle = false
		local count = 0.070
		if not isopen.Value then
			script.Parent.Door1.CanCollide = false
			script.Parent.Door2.CanCollide = false
			if not silent then
				script.Parent.Door1["Open" .. math.random(1,3)]:Play()
			end
			for i=1,35 do
				wait()
				script.Parent.Door1.CFrame = script.Parent.Door1.CFrame * CFrame.new(count * 1.0,0,0)
				script.Parent.Door2.CFrame = script.Parent.Door2.CFrame * CFrame.new(count,0,0)
				if i < 18 then
					count = count * 1.05
				else
					count = count / 1.05
				end
			end
			isopen.Value = true
		else
			script.Parent.Door1.CanCollide = true
			script.Parent.Door2.CanCollide = true
			if not silent then
				script.Parent.Door1["Close" .. math.random(1,3)]:Play()
			end
			for i=1,35 do
				wait()
				script.Parent.Door1.CFrame = script.Parent.Door1.CFrame * CFrame.new(-count * 1.0,0,0)
				script.Parent.Door2.CFrame = script.Parent.Door2.CFrame * CFrame.new(-count,0,0)
				if i < 18 then
					count = count * 1.05
				else
					count = count / 1.05
				end
			end
			isopen.Value = false
		end
		wait(0.5)
		idle = true
	end
end

button1.ClickDetector.MouseClick:connect(function()
	button1.Push:Play()
	active()
end)
button2.ClickDetector.MouseClick:connect(function()
	button2.Push:Play()
	active()
end)

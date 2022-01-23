local StarterGui = game:GetService("StarterGui")

repeat wait() until StarterGui:GetCore("ChatWindowSize") ~= nil

local chatWindowSize = StarterGui:GetCore("ChatWindowSize")

StarterGui:SetCore("ChatWindowPosition", UDim2.new(0, 0, (1 - chatWindowSize.Y.Scale), 0))
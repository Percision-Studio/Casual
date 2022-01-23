--[[

	Plugins for this gun kit are basically functions that will run at specific times, i.e. When a key is pressed, when the gun is
	fired, when the gun is aimed, etc.
	
	HOW TO USE IT:
	
		KEYDOWN PLUGIN:
		
			Let's say you wanted to toggle a laser whenever you press the "v" key:
			
			You would create a table like the example below
			The first element would be "Key = INSERT_KEY_HERE"
			The second element would be "Description = INSERT_DESCRIPTION_HERE"
			The third element would be "Plugin = INSERT_FUNCTION_HERE"
			
			So whenever you press the "v" key, the plugin function will run
			
			Pretty useful if you want to add extra code to the script without actually having to modify the script
		
			NOTE: Only the keydown plugin requires this table. Every other plugin just needs a function
			
		EVERY OTHER PLUGIN:
		
			Let's say you wanted to make a shell eject whenever the gun was fired:
			
			You would add function called "Plugin = INSERT_FUNCTION_HERE"
			
			That's it; If you want other stuff to happen when the gun is fired, you would either put it all into 1 function, or
			you would add more Plugins to the "Firing" table. Like so:
			
			Firing = {
				Plugin = function()
					--Code
				end;
				Plugin = function()
					--Code
				end;
				Plugin = function()
					--Code
				end;
			};
	
	That's really it, you just need to know some basic scripting to use it. If you have more questions, pm me.
	
	NOTE: The plugins run seperate from the code in the Gun_Main. For example, if you have a plugin that ejects a shell 1 second
	after the gun is fired, the gun's firing speed won't be affected in any way.
	
--]]

local Gun = script.Parent.Parent.Parent
local player = game.Players.LocalPlayer

local Plugins = {
	
	KeyDown = {
		{ --This is a plugin for a toggleable laser
			Key = "g"; --This is the key you press to activate the plugin
			Description = "Toggle Laser"; --This is what the description of the key will be in the controls
			Plugin = function() --This is the actual plugin function
				local Laser = Gun:WaitForChild("LaserLight") --These few lines wait for the necessary bricks/models
				local Handle = Gun:WaitForChild("Grip")
				local ignoreCode = Gun.Program_Client:WaitForChild("ignoreCode")
				local ignoreModel = game.Workspace:WaitForChild("BulletModel: " .. player.Name)
				local ignoreList = {}
				
				local PlyrName = game.Players:GetPlayerFromCharacter(Gun.Parent).Name
				local playerFolder = ignoreModel
				
				local RS = game:GetService("RunService")
				
				local function createLaserDot() --This function creates the red laser dot
					local laserDot = Instance.new("Part")
					laserDot.Transparency = 1
					laserDot.Name = "laserDot"
					laserDot.Anchored = true
					laserDot.CanCollide = false
					laserDot.FormFactor = Enum.FormFactor.Custom
					laserDot.Size = Vector3.new(0.25, 0.25, 1)
					
					local laserGui = Instance.new("SurfaceGui")
					laserGui.CanvasSize = Vector2.new(100, 100)
					laserGui.Parent = laserDot
					
					local laserImage = Instance.new("ImageLabel")
					laserImage.BackgroundTransparency = 1
					laserImage.Size = UDim2.new(1, 0, 1, 0)
					laserImage.Image = "http://www.roblox.com/asset/?id=131394739"
					laserImage.Parent = laserGui
					
					--[[local laserLight = Instance.new("SurfaceLight")
					laserLight.Angle = 180
					laserLight.Brightness = math.huge
					laserLight.Color = Color3.new(1, 0, 0)
					laserLight.Face = Enum.NormalId.Back
					laserLight.Range = 5
					laserLight.Shadows = true
					laserLight.Parent = laserDot]]
					
					return laserDot
				end
				
				local function getHitSurfaceCFrame(Pos, Obj) --This function returns the proper cframe based on the face that the position is on
					local surfaceCF = {
						{"Back", Obj.CFrame * CFrame.new(0, 0, Obj.Size.z)};
						{"Bottom", Obj.CFrame * CFrame.new(0, -Obj.Size.y, 0)};
						{"Front", Obj.CFrame * CFrame.new(0, 0, -Obj.Size.z)};
						{"Left", Obj.CFrame * CFrame.new(-Obj.Size.x, 0, 0)};
						{"Right", Obj.CFrame * CFrame.new(Obj.Size.x, 0, 0)};
						{"Top", Obj.CFrame * CFrame.new(0, Obj.Size.y, 0)}
					}
					local closestDist = math.huge
					local closestSurface = nil
					for _,v in pairs(surfaceCF) do
						local surfaceDist = (Pos - v[2].p).magnitude
						if surfaceDist < closestDist then
							closestDist = surfaceDist
							closestSurface = v
						end
					end
					
					local surfaceDir = CFrame.new(Obj.CFrame.p, closestSurface[2].p)
					local surfaceDist = surfaceDir.lookVector * ((Obj.CFrame.p - closestSurface[2].p).magnitude / 2 - 0.25)
					local surfaceOffset = Pos - closestSurface[2].p + surfaceDist
					local surfaceCFrame = surfaceDir + surfaceDist + surfaceOffset
					
					return surfaceCFrame
				end
				
				local laserDot = createLaserDot() --The code is cleaner when the laser creating code is in a function
				
				Laser.Transparency = (Laser.Transparency == 1 and 0 or 1) --Toggles the laser on or off
				
				while math.floor(Laser.Transparency) == 0 do --This loop will keep running as long as the laser is visible
					if (not game.Players:GetPlayerFromCharacter(Gun.Parent)) then break end --This checks if the gun is a child of the character
					
					local newRay = Ray.new(Laser.Position, Handle.CFrame.lookVector * 999)
					local H, P = game.Workspace:FindPartOnRayWithIgnoreList(newRay, ignoreList)
					
					if H and (H and H.Transparency >= 1 or H.CanCollide == false) then
						table.insert(ignoreList, H)
					end
					
					local Distance = (P - Laser.Position).magnitude
					Laser.Mesh.Offset = Vector3.new(0, Distance / 2, 0)
					Laser.Mesh.Scale = Vector3.new(0.075, Distance / 0.2, 0.075)
					
					if H then
						laserDot.CFrame = getHitSurfaceCFrame(P, H) --If the laser hits a part then position the dot on the part
						laserDot.Parent = playerFolder
					else
						laserDot.Parent = nil --If the laser doesn't hit a part then temporarily remove the laser dor
					end
					
					RS.RenderStepped:wait()
				end
				
				laserDot:Destroy() --These lines reset the laser if the laser is transparent or the gun was deselected
				Laser.Transparency = 1
				Laser.Mesh.Offset = Vector3.new()
				Laser.Mesh.Scale = Vector3.new(0.075, 0, 0.075)
			end;
		};
		
	};
	
}

return Plugins
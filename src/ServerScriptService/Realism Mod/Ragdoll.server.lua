-- The R15 Ragdoll was originally written by EchoReaper
-- I only modified it to work with R6

-- Objects
local settingsDir = script.Settings

function getSetting (name)
	return settingsDir and settingsDir:FindFirstChild(name) and settingsDir[name].Value
end

-- Variables
local keepRagdollAfterRespawn = getSetting("Keep ragdoll after respawn") or false -- Whether to keep the ragdoll after a player respawns

game:GetService("Players").PlayerAdded:Connect(function (plr)
	plr.CharacterAdded:Connect(function (char)
		local humanoid = char:WaitForChild("Humanoid")
		humanoid.Died:Connect(function ()
			if char:FindFirstChild("HumanoidRootPart") then
				
				local rig = humanoid.RigType
				local root = char.HumanoidRootPart
				
				humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
				humanoid.HealthDisplayType = Enum.HumanoidHealthDisplayType.AlwaysOff
				root.Anchored = true
				root.CanCollide = false
				
				if rig == Enum.HumanoidRigType.R6 then
					
					local function stick (cl, p0, p1, c0, c1, p) 
						local a = Instance.new(cl)
						a.Part0 = p0
						a.Part1 = p1
						a.C0 = c0
						a.C1 = c1
						a.Parent = p
					end
					
					local function createLimb (p, char)
						local limb = Instance.new("Part", char)
						limb.formFactor = "Symmetric"
						limb.Size = Vector3.new(1, 1, 1)
						limb.Transparency = 1
						limb.CFrame = p.CFrame * CFrame.new(0, -0.5, 0)
						local W = Instance.new("Weld")
						W.Part0 = p
						W.Part1 = limb
						W.C0 = CFrame.new(0, -.5, 0)
						W.Parent = p
					end
					
					char.Archivable = true
					local charClone = char:Clone()
					charClone.Name = plr.Name .. "-2"
					char.Archivable = false
					
					for _,v in pairs(charClone:GetChildren()) do
						if v:IsA("BasePart") then
							for _,vv in pairs(v:GetChildren()) do
								if vv:IsA("Weld") or vv:IsA("Motor6D") then
									vv:Destroy()
								end
							end
						elseif v:IsA("Script") or v:IsA("LocalScript") or v:IsA("Tool") then
							v:Destroy()
						end
					end
					
					local hum2 = charClone.Humanoid
					hum2.Name = "Humanoid2"
					hum2.HealthDisplayType = Enum.HumanoidHealthDisplayType.AlwaysOff
					
					wait(.1)
					for _,v in pairs(char:GetChildren()) do
						if v:IsA("BasePart") or v:IsA("Accoutrement") or v:IsA("Script") or v:IsA("LocalScript") then
							v:Destroy()
						end
					end
					
					char = charClone
					local torso = char.Torso
					
					for _,p in pairs(char:GetChildren()) do
						if p:IsA("BasePart") then
							if p.Name == "Head" then
								stick("Weld", torso, char.Head, CFrame.new(0, 1.5, 0), CFrame.new(), torso)
							elseif p.Name == "Torso" then
								local Bar = Instance.new("Part")
								Bar.TopSurface = 0
								Bar.BottomSurface = 0
								Bar.formFactor = "Symmetric"
								Bar.Size = Vector3.new(1, 1, 1)
								Bar.Transparency = 1
								Bar.CFrame = p.CFrame * CFrame.new(0, .5, 0)
								Bar.Parent = char
								local Weld = Instance.new("Weld")
								Weld.Part0 = p
								Weld.Part1 = Bar
								Weld.C0 = CFrame.new(0, .5, 0)
								Weld.Parent = p
							elseif p.Name == "Right Arm" then
								p.CFrame = torso.CFrame * CFrame.new(1.5, 0, 0)
								stick("Glue", torso, p, CFrame.new(1.5, .5, 0, 0, 0, 1, 0, 1, 0, -1, -0, -0), CFrame.new(-0, .5, 0, 0, 0, 1, 0, 1, 0, -1, -0, -0), torso)
								createLimb(p, char)
							elseif p.Name == "Left Arm" then
								p.CFrame = torso.CFrame * CFrame.new(-1.5, 0, 0)
								stick("Glue", torso, p, CFrame.new(-1.5, 0.5, 0, -0, -0, -1, 0, 1, 0, 1, 0, 0), CFrame.new(0, 0.5, 0, -0, -0, -1, 0, 1, 0, 1, 0, 0), torso)
								createLimb(p, char)
							elseif p.Name == "Right Leg" then
								p.CFrame = torso.CFrame * CFrame.new(.5, -2, 0)
								stick("Glue", torso, p, CFrame.new(.5, -1, 0, 0, 0, 1, 0, 1, 0, -1, -0, -0), CFrame.new(0, 1, 0, 0, 0, 1, 0, 1, 0, -1, -0, -0), torso)
								createLimb(p, char)
							elseif p.Name == "Left Leg" then
								p.CFrame = torso.CFrame * CFrame.new(-.5, -2, 0)
								stick("Glue", torso, p, CFrame.new(-.5, -1, 0, -0, -0, -1, 0, 1, 0, 1, 0, 0), CFrame.new(-0, 1, 0, -0, -0, -1, 0, 1, 0, 1, 0, 0), torso)
								createLimb(p, char)
							end
						elseif p:IsA("Accoutrement") and p.Handle then
							stick("Weld", torso, char.Head, CFrame.new(0, 1.5, 0), CFrame.new(), char.Head)
						end
					end
						
					char.Parent = workspace
					
					if not keepRagdollAfterRespawn then
						game:GetService("Debris"):AddItem(char, 6)
					end
					
				else

					local function recurse (root, callback, i)
						for _,c in pairs(root:GetChildren()) do
							
							i = i + 1
							callback(i, c)
							
							if #c:GetChildren() > 0 then
								i = recurse(c, callback, i)
							end
						end
						
						return i
					end
					
					local function ragdollJoint (p0, p1, att, class, properties)
						
						att = att .. "RigAttachment"
						
						local constraint = Instance.new(class .. "Constraint")
						constraint.Attachment0 = p0:FindFirstChild(att)
						constraint.Attachment1 = p1:FindFirstChild(att)
						constraint.Name = "RagdollConstraint" .. p1.Name
						
						for _,pData in pairs(properties or {}) do
							constraint[pData[1]] = pData[2]
						end
						
						constraint.Parent = char
					end
					
					local function getAttachment0 (attName)
						for _,c in pairs(char:GetChildren()) do
							if c:FindFirstChild(attName) then
								return c:FindFirstChild(attName)
							end
						end
					end
					
					recurse(char, function(_, v)
						if v:IsA("Attachment") then
							v.Axis = Vector3.new(1, 0, 0)
							v.SecondaryAxis = Vector3.new(0, 1, 0)
							v.Orientation = Vector3.new(0, 0, 0)
						end
					end, 0)
							
					for _,c in pairs(char:GetChildren()) do
						if c:IsA("Accoutrement") then
							for _,part in pairs(c:GetChildren()) do
								if part:IsA("BasePart") then
									
									local attachment1 = part:FindFirstChildOfClass("Attachment")
									local attachment0 = getAttachment0(attachment1.Name)
									
									if attachment0 and attachment1 then
										
										local constraint = Instance.new("HingeConstraint")
										constraint.Attachment0 = attachment0
										constraint.Attachment1 = attachment1
										constraint.LimitsEnabled = true
										constraint.UpperAngle = 0
										constraint.LowerAngle = 0
										constraint.Parent = char
									end
								end
							end
						end
					end
					
					if rig == Enum.HumanoidRigType.R6 then
						
						ragdollJoint(char.Torso, char.Head, "Neck", "BallSocket", {
							{"LimitsEnabled", true};
							{"UpperAngle", 0};
						})
						
						ragdollJoint(char.Torso, char["Left Arm"], "LeftShoulder", "BallSocket")
						ragdollJoint(char.Torso, char["Right Arm"], "RightShoulder", "BallSocket")
						ragdollJoint(char.Torso, char["Left Leg"], "LeftTrunk", "BallSocket")
						ragdollJoint(char.Torso, char["Right Leg"], "RightTrunk", "BallSocket")
						
					elseif rig == Enum.HumanoidRigType.R15 then
		
						ragdollJoint(char.LowerTorso, char.UpperTorso, "Waist", "BallSocket", {
							{"LimitsEnabled", true};
							{"UpperAngle", 5};
						})
						
						ragdollJoint(char.UpperTorso, char.Head, "Neck", "BallSocket", {
							{"LimitsEnabled", true};
							{"UpperAngle", 15};
						})
						
						local handProperties = {
							{"LimitsEnabled", true};
							{"UpperAngle", 0};
							{"LowerAngle", 0};
						}
						
						ragdollJoint(char.LeftLowerArm, char.LeftHand, "LeftWrist", "Hinge", handProperties)
						ragdollJoint(char.RightLowerArm, char.RightHand, "RightWrist", "Hinge", handProperties)
						
						local shinProperties = {
							{"LimitsEnabled", true};
							{"UpperAngle", 0};
							{"LowerAngle", -75};
						}
						
						ragdollJoint(char.LeftUpperLeg, char.LeftLowerLeg, "LeftKnee", "Hinge", shinProperties)
						ragdollJoint(char.RightUpperLeg, char.RightLowerLeg, "RightKnee", "Hinge", shinProperties)
						
						local footProperties = {
							{"LimitsEnabled", true};
							{"UpperAngle", 15};
							{"LowerAngle", -45};
						}
						
						ragdollJoint(char.LeftLowerLeg, char.LeftFoot, "LeftAnkle", "Hinge", footProperties)
						ragdollJoint(char.RightLowerLeg, char.RightFoot, "RightAnkle", "Hinge", footProperties)
						
						ragdollJoint(char.UpperTorso, char.LeftUpperArm, "LeftShoulder", "BallSocket")
						ragdollJoint(char.LeftUpperArm, char.LeftLowerArm, "LeftElbow", "BallSocket")
						ragdollJoint(char.UpperTorso, char.RightUpperArm, "RightShoulder", "BallSocket")
						ragdollJoint(char.RightUpperArm, char.RightLowerArm, "RightElbow", "BallSocket")
						ragdollJoint(char.LowerTorso, char.LeftUpperLeg, "LeftHip", "BallSocket")
						ragdollJoint(char.LowerTorso, char.RightUpperLeg, "RightHip", "BallSocket")
					end
					
					char.Parent = workspace
					
					if not keepRagdollAfterRespawn then
						game:GetService("Debris"):AddItem(char, 6)
					end
				end
			end
		end)
	end)
end)
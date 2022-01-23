--// Variables
local L_1_ = script.Parent
local L_2_ = L_1_.Parent.Parent
local L_3_ = L_2_.Character
local L_4_ = game.ReplicatedStorage:FindFirstChild('[WB] Leaderstat Network') or nil

--// Declarables
local L_5_ = L_1_:WaitForChild('Resource')
local L_6_ = L_5_:WaitForChild('FX')
local L_7_ = L_5_:WaitForChild('Events')
local L_8_ = L_5_:WaitForChild('HUD')
local L_9_ = L_5_:WaitForChild('Modules')
local L_10_ = L_5_:WaitForChild('Vars')
local L_11_ = L_5_:WaitForChild('SettingsModule')
local L_12_ = require(L_11_:WaitForChild('ServerConfig'))
local L_13_ = L_5_:WaitForChild('Nodes')
local L_14_

local L_15_
local L_16_

local L_17_
local L_18_
local L_19_

local L_20_
local L_21_
local L_22_
local L_23_
local L_24_
local L_25_

local L_26_
local L_27_

--// Gun Parts
local L_28_ = L_1_.Bolt
local L_29_ = L_1_.Mag
local L_30_ = L_1_.FirePart
local L_31_ = L_5_:WaitForChild('FX')
local L_32_

--// Events
local L_33_ = L_7_:WaitForChild('Equipped')
local L_34_ = L_7_:WaitForChild('ShootEvent')
local L_35_ = L_7_:WaitForChild('DamageEvent')
local L_36_ = L_7_:WaitForChild('CreateOwner')
local L_37_ = L_7_:WaitForChild('Stance')
local L_38_ = L_7_:WaitForChild('HitEvent')
local L_39_ = L_7_:WaitForChild('KillEvent')
local L_40_ = L_7_:WaitForChild('AimEvent')
local L_41_ = L_7_:WaitForChild('ExploEvent')
local L_42_ = L_7_:WaitForChild('AttachEvent')
local L_43_ = L_7_:WaitForChild('ServerFXEvent')
local L_44_ = L_7_:WaitForChild('ChangeIDEvent')

--// Functions
function Weld(L_53_arg1, L_54_arg2, L_55_arg3)
	local L_56_ = Instance.new("Motor6D", L_53_arg1)
	L_56_.Part0 = L_53_arg1
	L_56_.Part1 = L_54_arg2
	L_56_.Name = L_53_arg1.Name
	L_56_.C0 = L_55_arg3 or L_53_arg1.CFrame:inverse() * L_54_arg2.CFrame
	return L_56_
end

--// Tables
local L_45_ = { 
	
	"1565831468";  
	"1565832329"; 
	
} 

local L_46_ = {
	
	"1565831129";
	"1565830611";
	
}

local L_47_ = {
	
	"1565825075";
	"1565824613";
	
}

local L_48_ = {
	
	"1565821941";
	"1565821634";
	
}

local L_49_ = {
	
	"871704259";
	"1565756607";
	
}

local L_50_ = {
	
	"1565717027";
	"1565716705";
	
}

local L_51_ = {
	
	1565703226;
	1565675605;
	
}

--// Connections
L_1_.Equipped:connect(function()
	local L_57_ = L_3_:FindFirstChild('Torso')
	local L_58_ = L_3_:FindFirstChild('Head')
	local L_59_ = L_3_:FindFirstChild('HumanoidRootPart')
	
	L_17_ = Instance.new("Motor6D", L_57_)
	L_17_.Parent = L_57_
	L_17_.Name = "Clone"
	L_17_.Part0 = L_59_
	L_17_.Part1 = L_58_
	L_17_.C0 = L_57_:WaitForChild("Neck").C0	
	L_17_.C1 = L_57_:WaitForChild("Neck").C1
	
-- Make the AnimBase
	L_18_ = Instance.new("Part", L_3_)
	L_18_.FormFactor = "Custom"
	L_18_.CanCollide = false
	L_18_.Transparency = 1
	L_18_.Anchored = false
	L_18_.Name = "AnimBase"
	
	L_19_ = Instance.new("Motor6D")
	L_19_.Part0 = L_18_
	L_19_.Part1 = L_58_
	L_19_.Parent = L_18_
	L_19_.Name = "AnimBaseW"
	--AnimBaseW.C1 = gunSettings.StartPose	
	
	L_15_ = Instance.new("Motor6D")
	L_15_.Part0 = L_3_['Right Arm']
	L_15_.Part1 = L_1_:FindFirstChild('Grip')
	L_15_.Parent = L_3_['Right Arm']
	L_15_.C1 = L_12_.GunPos
	L_15_.Name = "Grip"
	
	for L_60_forvar1, L_61_forvar2 in pairs(L_1_:GetChildren()) do
		if L_61_forvar2:IsA("Part") or L_61_forvar2:IsA("MeshPart") or L_61_forvar2:IsA("UnionOperation") then
			L_61_forvar2.Anchored = true
			
			if L_61_forvar2.Name ~= "Grip" and L_61_forvar2.Name ~= "Bolt" and L_61_forvar2.Name ~= 'Lid' then
				Weld(L_61_forvar2, L_1_:WaitForChild("Grip"))
			end
			
			if L_61_forvar2.Name == "Bolt" then
				if L_1_:FindFirstChild('BoltHinge') then
					Weld(L_61_forvar2, L_1_:WaitForChild("BoltHinge"))
				else
					Weld(L_61_forvar2, L_1_:WaitForChild("Grip"))
				end
			end;
			
			if L_61_forvar2.Name == "Lid" then
				if L_1_:FindFirstChild('LidHinge') then
					Weld(L_61_forvar2, L_1_:WaitForChild("LidHinge"))
				else
					Weld(L_61_forvar2, L_1_:WaitForChild("Grip"))
				end
			end
		end
	end
	
	for L_62_forvar1, L_63_forvar2 in pairs(L_13_:GetChildren()) do
		if L_63_forvar2:IsA('Part') then
			Weld(L_63_forvar2, L_1_:WaitForChild("Grip"))
		end
	end
	
	for L_64_forvar1, L_65_forvar2 in pairs(L_13_:GetChildren()) do
		if L_65_forvar2:IsA('Part') then
			L_65_forvar2.Anchored = false
		end
	end
	
	for L_66_forvar1, L_67_forvar2 in pairs(L_1_:GetChildren()) do
		if L_67_forvar2:IsA("Part") or L_67_forvar2:IsA("MeshPart") or L_67_forvar2:IsA("UnionOperation") then
			L_67_forvar2.Anchored = false
		end
	end
	
	L_20_ = L_3_['Right Arm']
	L_21_ = L_3_['Left Arm']
	L_24_ = L_3_.Torso:WaitForChild("Right Shoulder")
	L_25_ = L_3_.Torso:WaitForChild("Left Shoulder")
	
	L_22_ = Instance.new("Motor6D")
	L_22_.Name = "RAW"
	L_22_.Part0 = L_18_
	L_22_.Part1 = L_20_
	L_22_.Parent = L_18_
	L_22_.C1 = L_12_.RightArmPos
	L_3_.Torso:WaitForChild("Right Shoulder").Part1 = nil
		
	L_23_ = Instance.new("Motor6D")
	L_23_.Name = "LAW"
	L_23_.Part0 = L_18_
	L_23_.Part1 = L_21_
	L_23_.Parent = L_18_
	L_23_.C1 = L_12_.LeftArmPos
	L_3_.Torso:WaitForChild("Left Shoulder").Part1 = nil
	
	L_14_ = L_8_:WaitForChild('MainGui'):clone()
	L_14_.Parent = L_2_.PlayerGui
	
	L_27_ = L_58_:FindFirstChild('AHH') or L_6_:WaitForChild('AHH'):clone()
	L_27_.Parent = L_3_.Head
	
	if L_32_ then
		L_32_:Destroy()
	end
	
	L_33_:FireClient(L_2_, true, L_15_, L_18_, L_19_, L_22_, L_23_, L_17_)
end)

L_1_.Unequipped:connect(function()
	L_15_:Destroy()
	local L_68_ = L_3_:FindFirstChild('Torso')
	local L_69_ = L_3_:FindFirstChild('Head')
	L_32_ = Instance.new('Model', L_3_)
	L_32_.Name = "HolsterModel"
	
	for L_70_forvar1, L_71_forvar2 in pairs(L_1_:GetChildren()) do
		for L_72_forvar1, L_73_forvar2 in pairs(L_71_forvar2:GetChildren()) do
			if L_73_forvar2.ClassName == "Motor6D" then
				L_73_forvar2:Destroy()
			end
		end
	end
	
	for L_74_forvar1, L_75_forvar2 in pairs(L_1_:GetChildren()) do
		if L_75_forvar2:IsA("Part") or L_75_forvar2:IsA("MeshPart") or L_75_forvar2:IsA("UnionOperation") then
			L_75_forvar2.Anchored = true
		end
	end
	
	if L_3_.Humanoid and L_3_.Humanoid.Health > 0 then
		L_3_.HumanoidRootPart.RootJoint.C0 = CFrame.new(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0)
		L_68_['Right Hip'].C0 = CFrame.new(1, -1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
		L_68_['Left Hip'].C0 = CFrame.new(-1, -1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
		L_17_.C0 = CFrame.new(0, 1, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0)
		
		L_3_.HumanoidRootPart.RootJoint.C1 = CFrame.new(0, 0, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0)
		L_68_['Right Hip'].C1 = CFrame.new(0.5, 1, 0, 0, 0, 1, 0, 1, 0, -1, -0, -0)
		L_68_['Left Hip'].C1 = CFrame.new(-0.5, 1, 0, -0, -0, -1, 0, 1, 0, 1, 0, 0)
		L_17_.C1 = CFrame.new(0, -0.5, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0)
	end
	
	L_68_:WaitForChild("Neck").Part1 = L_69_
	L_68_:WaitForChild("Neck").C1 = L_68_:WaitForChild("Neck").C1
	L_68_:WaitForChild("Neck").C0 = L_68_:WaitForChild("Neck").C0
	
	L_18_:Destroy()
	L_17_:Destroy()
	L_24_.Part1 = L_20_
	L_25_.Part1 = L_21_
	
	if L_69_:FindFirstChild('AHH') then
		L_69_.AHH:Destroy()
	end
	
	L_33_:FireClient(L_2_, false)
	
	if L_12_.HolsteringEnabled then
		for L_77_forvar1, L_78_forvar2 in pairs(L_1_:GetChildren()) do
			if L_78_forvar2:IsA("Part") or L_78_forvar2:IsA("MeshPart") or L_78_forvar2:IsA("UnionOperation") then
				L_78_forvar2.Anchored = true
				local L_79_ = L_78_forvar2:clone()
				L_79_.Parent = L_32_
			end
		end;
		
		for L_80_forvar1, L_81_forvar2 in pairs(L_32_:GetChildren()) do
			Weld(L_81_forvar2, L_32_:WaitForChild("Grip"))
		end
		
		local L_76_ = Weld(L_32_:WaitForChild("Grip"), L_3_:WaitForChild('Torso'))
		L_76_.Name = "TWeld"
		L_76_.C1 = L_12_.HolsterPos
		
		for L_82_forvar1, L_83_forvar2 in pairs(L_32_:GetChildren()) do
			L_83_forvar2.Anchored = false
		end
	end
end)

L_3_.Humanoid.Died:connect(function()	
	L_33_:FireClient(L_2_, false)
end)

--// Events
L_34_.OnServerEvent:connect(function(L_84_arg1)	
	for L_85_forvar1, L_86_forvar2 in pairs(L_30_:GetChildren()) do
		if L_86_forvar2.Name:sub(1, 7) == "FlashFX" then
			L_86_forvar2.Enabled = true
		end
	end;

	delay(1 / 30, function()
		for L_87_forvar1, L_88_forvar2 in pairs(L_30_:GetChildren()) do
			if L_88_forvar2.Name:sub(1, 7) == "FlashFX" then
				L_88_forvar2.Enabled = false
			end
		end
	end);
end)

local L_52_
L_35_.OnServerEvent:connect(function(L_89_arg1, L_90_arg2, L_91_arg3)
	L_90_arg2:TakeDamage(L_91_arg3)
	if L_90_arg2.Health <= 0 and L_90_arg2 ~= L_52_ then
		if L_4_ and L_4_:FindFirstChild(L_2_.Name) then
			local L_92_ = L_4_[L_2_.Name]
			L_92_.Value = not L_92_.Value
		end
		L_39_:FireClient(L_89_arg1)
		L_52_ = L_90_arg2
	end
end)

L_36_.OnServerEvent:connect(function(L_93_arg1, L_94_arg2)
	local L_95_ = Instance.new("ObjectValue")
	L_95_.Name = "creator"
	L_95_.Value = L_93_arg1
	L_95_.Parent = L_94_arg2
	game.Debris:AddItem(L_95_, 3)
end)

L_37_.OnServerEvent:connect(function(L_96_arg1, L_97_arg2, L_98_arg3)
	local L_99_ = L_96_arg1.Character
	local L_100_ = L_99_:FindFirstChild('Torso')
	local L_101_ = L_99_:FindFirstChild('HumanoidRootPart'):FindFirstChild('RootJoint')
	local L_102_ = L_100_:FindFirstChild('Right Hip')
	local L_103_ = L_100_:FindFirstChild('Left Hip')
	local L_104_ = L_100_:FindFirstChild('Clone')
	
	if L_97_arg2 == "Prone" and L_99_ and L_104_ then
		L_101_.C0 = CFrame.new(0, -2.4201169, -0.0385534465, -0.99999994, -5.86197757e-012, -4.54747351e-013, 5.52669195e-012, 0.998915195, 0.0465667509, 0, 0.0465667509, -0.998915195)
		L_102_.C0 = CFrame.new(1.00000191, -1, -5.96046448e-008, 1.31237243e-011, -0.344507754, 0.938783348, 0, 0.938783467, 0.344507784, -1, 0, -1.86264515e-009)
		L_103_.C0 = CFrame.new(-0.999996185, -1, -1.1920929e-007, -2.58566502e-011, 0.314521015, -0.949250221, 0, 0.94925046, 0.314521164, 1, 3.7252903e-009, 1.86264515e-009)			
		L_104_.C0 = CFrame.new(0, -2.04640698, -0.799179077, -1, 0, -8.57672189e-15, 8.57672189e-15, 0, 1, 0, 1, 0)	
	elseif L_97_arg2 == "Crouch" and L_99_ and L_104_ then
		L_101_.C0 = CFrame.new(0, -1.04933882, 0, -1, 0, -1.88871293e-012, 1.88871293e-012, -3.55271368e-015, 1, 0, 1, -3.55271368e-015)
		L_102_.C0 = CFrame.new(1, 0.0456044674, -0.494239986, 6.82121026e-013, -1.22639676e-011, 1, -0.058873821, 0.998265445, -1.09836602e-011, -0.998265445, -0.058873821, 0)
		L_103_.C0 = CFrame.new(-1.00000381, -0.157019258, -0.471293032, -8.7538865e-012, -8.7538865e-012, -1, 0.721672177, 0.692235112, 1.64406284e-011, 0.692235112, -0.721672177, 0)
		L_104_.C0 = CFrame.new(0, -0.0399827957, 0, -1, 0, 0, 0, 0, 1, 0, 1, 0)
	elseif L_97_arg2 == "Stand" and L_99_ and L_104_ then	
		L_101_.C0 = CFrame.new(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0)
		L_102_.C0 = CFrame.new(1, -1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
		L_103_.C0 = CFrame.new(-1, -1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
		L_104_.C0 = CFrame.new(0, 1, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0)
	elseif L_97_arg2 == "LeanRight" then
		L_101_.C1 = CFrame.new(0, 0.200000003, 0, -0.939692616, 0, -0.342020124, -0.342020124, 0, 0.939692616, 0, 1, 0)
		L_102_.C1 = CFrame.new(0.300000012, 0.600000024, 0, 0, 0.342020124, 0.939692616, 0, 0.939692616, -0.342020124, -1, 0, 0)
		L_104_.C1 = CFrame.new(-0.400000006, -0.300000012, 0, -1, 0, 0, 0, 0, 1, 0, 1, 0)
	elseif L_97_arg2 == "LeanLeft" then
		L_101_.C1 = CFrame.new(0, 0.200000003, 0, -0.939692616, 0, 0.342020124, 0.342020124, 0, 0.939692616, 0, 1, 0)
		L_103_.C1 = CFrame.new(-0.300000012, 0.600000024, 0, 0, -0.342020124, -0.939692616, 0, 0.939692616, -0.342020124, 1, 0, 0)
		L_104_.C1 = CFrame.new(0.400000006, -0.300000012, 0, -1, 0, 0, 0, 0, 1, 0, 1, 0)
	elseif L_97_arg2 == "Unlean" then
		L_101_.C1 = CFrame.new(0, 0, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0)
		L_102_.C1 = CFrame.new(0.5, 1, 0, 0, 0, 1, 0, 1, 0, -1, -0, -0)
		L_103_.C1 = CFrame.new(-0.5, 1, 0, -0, -0, -1, 0, 1, 0, 1, 0, 0)
		if L_100_:FindFirstChild('Clone') then
			L_104_.C1 = CFrame.new(0, -0.5, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0)
		end
	elseif L_97_arg2 == "Patrol" then
		L_19_.C1 = L_98_arg3
	elseif L_97_arg2 == "Unpatrol" then
		L_19_.C1 = CFrame.new()
	end
end)

L_38_.OnServerInvoke = function(L_105_arg1, L_106_arg2, L_107_arg3, L_108_arg4, L_109_arg5, L_110_arg6, L_111_arg7)
	local L_112_ = Instance.new("Part", workspace)
	L_112_.FormFactor = "Custom"
	L_112_.TopSurface = 0
	L_112_.BottomSurface = 0
	L_112_.Transparency = 1
	L_112_.Anchored = true
	L_112_.CanCollide = false
	L_112_.Size = Vector3.new(0.5, 0, 0.5)
	L_112_.CFrame = CFrame.new(L_106_arg2) * CFrame.fromAxisAngle(L_107_arg3.magnitude == 0 and Vector3.new(1) or L_107_arg3.unit, L_108_arg4)
	L_112_.BrickColor = BrickColor.new("Really black")
	L_112_.Material = "SmoothPlastic"

	local L_113_ = Instance.new("Decal", L_112_)
	L_113_.Texture = "rbxassetid://64291977"
	L_113_.Face = "Top"
	game.Debris:AddItem(L_113_, 3)
	
	local L_114_ = Instance.new("PointLight", L_112_)
	L_114_.Color = Color3.new(0, 0, 0)
	L_114_.Range = 0
	L_114_.Shadows = true
	
	for L_117_forvar1, L_118_forvar2 in pairs(game.Players:GetChildren()) do
		if L_118_forvar2:IsA('Player') and L_118_forvar2.Character and L_118_forvar2.Character.HumanoidRootPart and (L_118_forvar2.Character.HumanoidRootPart.Position - L_106_arg2).magnitude <= 30 then
			local L_119_ = Instance.new("Sound")
			L_119_.Name = "Crack"	
			
			if L_111_arg7.Material == Enum.Material.Grass or L_111_arg7.Material == Enum.Material.Ice or L_111_arg7.Material == Enum.Material.Fabric or L_111_arg7.Material == Enum.Material.Pebble then
				L_119_.SoundId = "rbxassetid://" .. L_45_[math.random(1, #L_45_)]
			end
			
			if L_111_arg7.Material == Enum.Material.Sand then
				L_119_.SoundId = "rbxassetid://" .. L_46_[math.random(1, #L_46_)]
			end
			
			if L_111_arg7.Material == Enum.Material.Glass or L_111_arg7.Material == Enum.Material.Neon then
				L_119_.SoundId = "rbxassetid://" .. L_47_[math.random(1, #L_47_)]
			end
			
			if L_111_arg7.Material == Enum.Material.Wood or L_111_arg7.Material == Enum.Material.WoodPlanks then
				L_119_.SoundId = "rbxassetid://" .. L_48_[math.random(1, #L_48_)]
			end
			
			if L_111_arg7.Material == Enum.Material.Metal or L_111_arg7.Material == Enum.Material.CorrodedMetal or L_111_arg7.Material == Enum.Material.DiamondPlate then
				L_119_.SoundId = "rbxassetid://" .. L_49_[math.random(1, #L_49_)]
			end
			
			if L_111_arg7.Material == Enum.Material.Water then
				L_119_.SoundId = "rbxassetid://" .. L_50_[math.random(1, #L_50_)]
			end
			
			if L_111_arg7.Material == Enum.Material.Concrete or L_111_arg7.Material == Enum.Material.Plastic or L_111_arg7.Material == Enum.Material.SmoothPlastic or L_111_arg7.Material == Enum.Material.Slate or L_111_arg7.Material == Enum.Material.Foil or L_111_arg7.Material == Enum.Material.Brick or L_111_arg7.Material == Enum.Material.Granite or L_111_arg7.Material == Enum.Material.Marble or L_111_arg7.Material == Enum.Material.Cobblestone then
				L_119_.SoundId = "rbxassetid://" .. L_51_[math.random(1, #L_51_)]
			end	
			
			L_119_.EmitterSize = 10
			L_119_.MaxDistance = 30
			L_119_.Parent = L_118_forvar2.PlayerGui
			L_119_:play()
			
			game.Debris:AddItem(L_112_, 3)
		end
	end;
	
	local L_115_
	local L_116_
		
	if L_110_arg6 == "Part" then
		L_115_ = L_31_:WaitForChild("Spark"):clone()
		L_115_.Parent = L_112_
		L_115_.EmissionDirection = "Top"
		
		L_116_ = L_31_:WaitForChild("Smoke"):clone()
		L_116_.Parent = L_112_
		L_116_.EmissionDirection = "Top"
		
		L_115_.Enabled = true
		L_116_.Enabled = true
		
		game.Debris:AddItem(L_115_, 1)
		game.Debris:AddItem(L_116_, 1)
		
		delay(0.1, function()
			L_115_.Enabled = false
			L_116_.Enabled = false
		end)
	elseif L_110_arg6 == "Human" then		
		L_115_ = L_31_:WaitForChild("Blood"):clone()
		L_115_.Parent = L_112_
		L_115_.EmissionDirection = "Top"
		L_115_.Enabled = true
		
		game.Debris:AddItem(L_115_, 1)
		
		delay(0.1, function()
			L_115_.Enabled = false
		end)
	end
end;

L_40_.OnServerEvent:connect(function(L_117_arg1, L_118_arg2)
	L_40_:FireAllClients(L_117_arg1, L_118_arg2)
end)

L_41_.OnServerEvent:connect(function(L_119_arg1, L_120_arg2)
	local L_121_ = Instance.new('Part', workspace)
	L_121_.Size = Vector3.new(0.1, 0.1, 0.1)
	L_121_.Transparency = 1
	L_121_.CanCollide = false
	L_121_.Anchored = true
	L_121_.Position = L_120_arg2
	local L_122_ = Instance.new('Explosion', workspace)
	L_122_.Position = L_120_arg2
	L_122_.BlastPressure = L_12_.BlastPressue
	L_122_.BlastRadius = L_12_.BlastRadius
	L_122_.DestroyJointRadiusPercent = L_12_.DestroyJointRadius
	L_122_.ExplosionType = L_12_.ExplosionType
	local L_123_ = L_31_:WaitForChild('ExplosionSound'):clone()
	L_123_.Parent = L_121_
	L_123_:Play()
	game:GetService('Debris'):AddItem(L_121_, L_123_.TimeLength)
end)

L_43_.OnServerEvent:connect(function(L_124_arg1, L_125_arg2)
	for L_126_forvar1, L_127_forvar2 in pairs(game.Players:GetChildren()) do
		if L_127_forvar2:IsA('Player') and L_127_forvar2.PlayerGui:FindFirstChild('MainGui') and L_127_forvar2.PlayerGui.MainGui:FindFirstChild('Shading') then
			for L_128_forvar1, L_129_forvar2 in pairs(L_127_forvar2.Character:GetChildren()) do
				if L_129_forvar2:IsA('Tool') and L_129_forvar2:FindFirstChild('Resource') and L_129_forvar2.Resource:FindFirstChild('Events') and L_129_forvar2.Resource.Events:FindFirstChild('ServerFXEvent') then
					L_129_forvar2.Resource.Events.ServerFXEvent:FireClient(L_127_forvar2, L_125_arg2, L_2_)
				end	
			end
		end
	end
end)

L_44_.OnServerEvent:connect(function(L_130_arg1, L_131_arg2, L_132_arg3)
	L_131_arg2.SoundId = 'rbxassetid://' .. L_132_arg3
	L_131_arg2:Play()
end)
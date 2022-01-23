local Tool = script.Parent.Parent.Parent

local Settings = {

--// Positioning
	RightArmPos = CFrame.new(-0.902175903, 0.295501232, -1.32277012, 1, 0, 0, 0, 1.19248806e-08, 1, 0, -1, 1.19248806e-08);
	LeftArmPos = CFrame.new(1.06851184, 0.973718464, -2.29667926, 0.787567914, -0.220087856, 0.575584888, -0.615963876, -0.308488727, 0.724860668, 0.0180283934, -0.925416589, -0.378522098);
	GunPos = CFrame.new(0.170139551, -0.495055377, 1.08855903, 1, 0, 0, 0, -2.98023224e-08, -0.99999994, 0, 0.99999994, -2.98023224e-08);
	
	
	RestPos = CFrame.new(0, 0, 0, 0.950535953, -0.105710246, 0.292073309, 0, 0.940307558, 0.340326011, -0.310614645, -0.32349211, 0.893796146);

--// Holstering
	HolsteringEnabled = false;
	HolsterPos = CFrame.new(0.140751064, 0, -0.616261482, -4.10752676e-08, -0.342020065, 0.939692616, -1.49501727e-08, 0.939692557, 0.342020094, -0.99999994, 0, -4.37113847e-08);

--// Patrol Mode
	PatrolPosR = CFrame.new();
	PatrolPosL = CFrame.new();

--// Explosive Settings
	BlastPressue = 500000;
	BlastRadius = 15;
	DestroyJointRadius = 15;
	ExplosionType = Enum.ExplosionType.NoCraters; -- Might wanna leave it like this

	}

return Settings

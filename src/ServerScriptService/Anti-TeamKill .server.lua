--- Make By SteverBayu
function onHumanoidDied(humanoid, player)
		local killer = getKillerOfHumanoidIfStillInGame(humanoid)
		if (killer ~= nil) then
		handleTKs(player, killer)
		end
end

function onPlayerRespawn(property, player)
	-- need to connect to new humanoid
	
	if property == "Character" and player.Character ~= nil then
		local humanoid = player.Character.Humanoid
			local p = player
			local h = humanoid
			humanoid.Died:connect(function() onHumanoidDied(h, p) end )
	end
end

function getKillerOfHumanoidIfStillInGame(humanoid)
	-- returns the player object that killed this humanoid
	-- returns nil if the killer is no longer in the game

	-- check for kill tag on humanoid - may be more than one - todo: deal with this
	local tag = humanoid:findFirstChild("creator")

	-- find player with name on tag
	if tag ~= nil then
		local killer = tag.Value
		if killer.Parent ~= nil then -- killer still in game
			return killer
		end
	end

	return nil
end

function handleTKs(player, killer)
	if (killer.TeamColor == player.TeamColor) then
	killer.Character.Humanoid.Health = 0
	end
end

function onPlayerEntered(newPlayer)
		while true do
			if newPlayer.Character ~= nil then break end
			wait(3)
		end

		local humanoid = newPlayer.Character.Humanoid

		humanoid.Died:connect(function() onHumanoidDied(humanoid, newPlayer) end )
		newPlayer.Changed:connect(function(property) onPlayerRespawn(property, newPlayer) end )
end

game.Players.ChildAdded:connect(onPlayerEntered)
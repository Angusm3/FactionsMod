BaitReinforcements1 = { "e1", "e1", "e1" }
VehicleReinforcements = { "jeep" }
InfantryReinforcements = { "e2", "e2", "e1" }


--FactionAssignment = function()
--		INF1 = MARINF1
--		INF2 = MARINF2
--		V = MARV
--end





InsertionHelicopterType = "tran"


WorldLoaded = function()
	player = OpenRA.GetPlayer("Marzeron")
	player2 = OpenRA.GetPlayer("Baition")
	player3 = OpenRA.GetPlayer("TSA")
	
	p1 = 6
	p2 = 1
	p3 = 13
	
	
	
	OpenRA.RunAfterDelay(1 * 5, function() ReinforceFromSea1(TEAM2INF1) end)
	OpenRA.RunAfterDelay(1 * 5, function() ReinforceFromSea2(TEAM2INF2) end)
	OpenRA.RunAfterDelay(1 * 5, function() ReinforceFromSea3(TEAM2V) end)


	SendMarReinforcements()
	SendInsertionHelicopter()
	SendTSAVehicles()
	
end


SendMarReinforcements = function()
	FactionAssignment()

	Reinforcements.Reinforce(player, TEAM1INF1, MarInsert.Location, MarRally1.Location, Utils.Seconds(0.2), function(actor)
		Actor.SetStance(actor, "Defend")
	end)
	Reinforcements.Reinforce(player, TEAM1INF2, MarInsert.Location, MarRally2.Location, Utils.Seconds(0.2), function(actor)
		Actor.SetStance(actor, "Defend")
	end)
	Reinforcements.Reinforce(player, TEAM1V, MarInsert.Location, MarRally2.Location, Utils.Seconds(1), function(actor)
		Actor.SetStance(actor, "Defend")
	end)

end




ReinforceFromSea1 = function(passengers)
	local hovercraft, troops = Reinforcements.Insert(player2, "LST", passengers, { lcfentry1.Location, lcfdropoff1.Location  }, { lcfentry1.Location })
end

ReinforceFromSea2 = function(passengers)
	local hovercraft, troops = Reinforcements.Insert(player2, "LST", passengers, { lcfentry2.Location, lcfdropoff2.Location  }, { lcfentry2.Location })
end

ReinforceFromSea3 = function(passengers)
	local hovercraft, troops = Reinforcements.Insert(player2, "LST", passengers, { lcfentry3.Location, lcfdropoff3.Location  }, { lcfentry3.Location })
end







SendTSAVehicles = function()
	Reinforcements.Reinforce(player3, TEAM3V, TSAentry1.Location, TSARally1.Location, Utils.Seconds(1), function(actor)
		Actor.SetStance(actor, "Defend")
	end)
end


SendInsertionHelicopter = function()
	local heli, passengers = Reinforcements.Insert(player3, "tran", TEAM3INF1,
		{ TSAEntry2.Location, TSARally2.Location }, { HeliExtract.Location })
	local heli, passengers = Reinforcements.Insert(player3, "tran", TEAM3INF1,
		{ TSAEntry2.Location, TSARally3.Location }, { HeliExtract.Location })
	SendInsertionHelicopter2()
end

SendInsertionHelicopter2 = function()
	local heli, passengers = Reinforcements.Insert(player3, "tran", TEAM3INF1,
		{ TSAEntry2.Location, TSARally2.Location }, { HeliExtract.Location })
	local heli, passengers = Reinforcements.Insert(player3, "tran", TEAM3INF2,
		{ TSAEntry2.Location, TSARally3.Location }, { HeliExtract.Location })

end

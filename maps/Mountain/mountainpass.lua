InsertionHelicopterType = "tran"


WorldLoaded = function()
	player = OpenRA.GetPlayer("NTAA")
	player2 = OpenRA.GetPlayer("Baition")

	
	NTAAStart()
	BAITStart()
	
end


NTAAStart = function()
	local heli, passengers = Reinforcements.Insert(player, "tran", NTAAINF2,
		{ NTAAInfEntry.Location, NTAAHeliDropOff.Location }, { NTAAHeliExit.Location })
		
	Reinforcements.Reinforce(player, NTAAINF1, NTAAInfEntry.Location, NTAAInfRally.Location, Utils.Seconds(0.2), function(actor)
		Actor.SetStance(actor, "Defend")
	end)
	
	Reinforcements.Reinforce(player, NTAAV, NTAAVEntry.Location, NTAAVRally.Location, Utils.Seconds(0.5), function(actor)
		Actor.SetStance(actor, "Defend")
	end)
end


BAITStart = function()

	Reinforcements.Reinforce(player2, BAITINF1, BaitEntry.Location, BaitRally1.Location, Utils.Seconds(0.2), function(actor)
		Actor.SetStance(actor, "Defend")
	end)
	Reinforcements.Reinforce(player2, BAITINF2, BaitEntry.Location, BaitRally1.Location, Utils.Seconds(0.2), function(actor)
		Actor.SetStance(actor, "Defend")
	end)
	Reinforcements.Reinforce(player2, BAITV, BaitEntry.Location, BaitRally1.Location, Utils.Seconds(1), function(actor)
		Actor.SetStance(actor, "Defend")
	end)
end

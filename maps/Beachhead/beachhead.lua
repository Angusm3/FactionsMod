BaitReinforcements1 = { "e1", "e1", "e1" }
VehicleReinforcements = { "jeep" }
InfantryReinforcements = { "e2", "e2", "e1" }
TanyaType = { "TSARIFLEMAN", "TSARIFLEMAN", "TSARIFLEMAN", "TSARIFLEMAN", "TSARIFLEMAN", "TSARIFLEMAN", "TSARIFLEMAN", "TSARIFLEMAN", "TSARIFLEMAN", "TSARIFLEMAN" }
Rockets = { "TSAROCKET", "TSAROCKET", "TSAROCKET", "TSAROCKET", "TSAROCKET", "TSAROCKET", "TSAROCKET", "TSAROCKET", "TSAROCKET", "TSAROCKET", "TSABURSTSNIPER", "TSAMECH", "TSAMECH" }
TSAV = { "TSAHMV", "TSAHMV", "TSAHMV", "TSAHMV", "TSAHMV", "TSAHMV", "MEDTANK", "MEDTANK", "MEDTANK", "MEDTANK", "MEDTANK", "MAMMOTH2", "OSIRIS", "OSIRIS" }
MARINF1 = { "MARRIFLE", "MARRIFLE", "MARRIFLE", "MARRIFLE", "MARRIFLE", "MARRIFLE", "MARRIFLE", "MARRIFLE", "MARRIFLE", "MARRIFLE" }
MARINF2 = { "MARFLAMMENWERFER", "MARFLAMMENWERFER", "MARFLAMMENWERFER", "MARPANZERSHREK", "MARPANZERSHREK", "MARPANZERSHREK", "MARPANZERSHREK" }
MARV = { "MARTCH", "MARTCH", "MARTCH", "MARTCH", "MARTCH", "MARTCH", "MARLTNK", "MARLTNK", "MARLTNK", "MARLTNK", "MARLEOPARD", "MARLEOPARD" }
BAITMG = { "BAITMG", "BAITMG", "BAITMG", "BAITMG", "BAITMG", "BAITMG", "BAITMG", "BAITMG", "BAITMG", "BAITMG" }
BAITINF = { "BAITSMAW", "BAITSMAW", "BAITSMAW", "BAITSMAW", "BAITSMAW", "BAITSNIPER", "BAITFLAMETHROWER", "BAITFLAMETHROWER", "BAITMEDIC", "BAITMORTAR", "BAITMORTAR", "BAITMORTAR" }
BAITV = { "BAITLTNK", "BAITLTNK", "BAITLTNK", "BAITLTNK" }

InsertionHelicopterType = "tran"


WorldLoaded = function()
	player = OpenRA.GetPlayer("Marzeron")
	player2 = OpenRA.GetPlayer("Baition")
	player3 = OpenRA.GetPlayer("TSA")

	
	OpenRA.RunAfterDelay(1 * 5, function() ReinforceFromSea1(BAITMG) end)
	OpenRA.RunAfterDelay(1 * 5, function() ReinforceFromSea2(BAITMG) end)
	OpenRA.RunAfterDelay(1 * 5, function() ReinforceFromSea3(BAITMG) end)
	OpenRA.RunAfterDelay(50 * 5, function() ReinforceFromSea4(BAITMG) end)
	OpenRA.RunAfterDelay(50 * 5, function() ReinforceFromSea5(BAITINF) end)
	OpenRA.RunAfterDelay(50 * 5, function() ReinforceFromSea6(BAITV) end)

	SendMarReinforcements()
	SendInsertionHelicopter()
	SendTSAVehicles()
	
end


SendMarReinforcements = function()

	Reinforcements.Reinforce(player, MARINF1, MarInsert.Location, MarRally1.Location, Utils.Seconds(0.2), function(actor)
		Actor.SetStance(actor, "Defend")
	end)
	Reinforcements.Reinforce(player, MARINF2, MarInsert.Location, MarRally2.Location, Utils.Seconds(0.2), function(actor)
		Actor.SetStance(actor, "Defend")
	end)
	Reinforcements.Reinforce(player, MARV, MarInsert.Location, MarRally2.Location, Utils.Seconds(1), function(actor)
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

ReinforceFromSea4 = function(passengers)
	local hovercraft, troops = Reinforcements.Insert(player2, "LST", passengers, { lcfentry1.Location, lcfdropoff1.Location  }, { lcfentry1.Location })
end

ReinforceFromSea5 = function(passengers)
	local hovercraft, troops = Reinforcements.Insert(player2, "LST", passengers, { lcfentry2.Location, lcfdropoff2.Location  }, { lcfentry2.Location })
end

ReinforceFromSea6 = function(passengers)
	local hovercraft, troops = Reinforcements.Insert(player2, "LST", passengers, { lcfentry3.Location, lcfdropoff3.Location  }, { lcfentry3.Location })
end





SendTSAVehicles = function()
	Reinforcements.Reinforce(player3, TSAV, TSAentry1.Location, TSARally1.Location, Utils.Seconds(1), function(actor)
		Actor.SetStance(actor, "Defend")
	end)
end


SendInsertionHelicopter = function()
	local heli, passengers = Reinforcements.Insert(player3, "tran", TanyaType,
		{ TSAEntry2.Location, TSARally2.Location }, { HeliExtract.Location })
	local heli, passengers = Reinforcements.Insert(player3, "tran", TanyaType,
		{ TSAEntry2.Location, TSARally3.Location }, { HeliExtract.Location })
	SendInsertionHelicopter2()
end

SendInsertionHelicopter2 = function()
	local heli, passengers = Reinforcements.Insert(player3, "tran", TanyaType,
		{ TSAEntry2.Location, TSARally2.Location }, { HeliExtract.Location })
	local heli, passengers = Reinforcements.Insert(player3, "tran", Rockets,
		{ TSAEntry2.Location, TSARally3.Location }, { HeliExtract.Location })

end

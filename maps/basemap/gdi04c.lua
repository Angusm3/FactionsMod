GDIReinforcementsPart1 = { "RFIOMARDER", "RFIOMARDER", "RFIOLEOPARD", "RFIOLEOPARD", "RFIOJEEP", "RFIOJEEP", "RFIOJEEP" }
GDIReinforcementsPart2 = { "RFIOMECH", "e1", "e1", "e1", "RFIOFHTNK", "RFIOHTNK", "RFIOMLRS", "RFIOJEEP", "RFIOJEEP", "RFIOJEEP" }

TSAReinforcements1 = { "MEDTANK", "MEDTANK", "MEDTANK", "MEDTANK", "MEDTANK", "MAMMOTH2", "OSIRIS", "OSIRIS", "OSIRIS" }
TSAReinforcements2 = { "TSARIFLEMAN", "TSARIFLEMAN", "TSARIFLEMAN", "TSARIFLEMAN", "TSARIFLEMAN", "TSARIFLEMAN", "TSARIFLEMAN", "TSARIFLEMAN", "TSARIFLEMAN", "TSARIFLEMAN", "TSARIFLEMAN", "TSARIFLEMAN", "TSARIFLEMAN", "TSARIFLEMAN", "TSARIFLEMAN" }
TSAReinforcements3 = { "TSAROCKET", "TSAROCKET", "TSAROCKET", "TSAROCKET", "TSAROCKET", "TSAROCKET", "TSAROCKET", "TSAROCKET", "TSAROCKET", "TSAROCKET" }
TSAReinforcements4 = { "TSAMECH", "TSAMECH", "TSABURSTSNIPER" }



SendReinforcements = function()
	Reinforcements.Reinforce(player, GDIReinforcementsPart1, GDIReinfEntry1.Location, waypoint12.Location, Utils.Seconds(1), function(actor)
		Actor.SetStance(actor, "Defend")
	end)
	Reinforcements.Reinforce(player, GDIReinforcementsPart2, GDIReinfEntry2.Location, waypoint13.Location, Utils.Seconds(1), function(actor)
		Actor.SetStance(actor, "Defend")
	end)
	

	SendReinforcements2()
end

SendReinforcements2 = function()

	Reinforcements.Reinforce(player2, TSAReinforcements1, Actor16.Location, Actor110.Location, Utils.Seconds(1), function(actor)
		Actor.SetStance(actor, "Defend")
	end)
	
	Reinforcements.Reinforce(player2, TSAReinforcements2, Actor112.Location, Actor21.Location, Utils.Seconds(1), function(actor)
		Actor.SetStance(actor, "Defend")
	end)
	
	Reinforcements.Reinforce(player2, TSAReinforcements2, Actor113.Location, Actor109.Location, Utils.Seconds(1), function(actor)
		Actor.SetStance(actor, "Defend")
	end)
	
	Reinforcements.Reinforce(player2, TSAReinforcements3, Actor112.Location, Actor21.Location, Utils.Seconds(1), function(actor)
		Actor.SetStance(actor, "Defend")
	end)
	
	Reinforcements.Reinforce(player2, TSAReinforcements4, Actor113.Location, Actor109.Location, Utils.Seconds(1), function(actor)
		Actor.SetStance(actor, "Defend")
	end)
end












Tick = function()
	if Mission.RequiredUnitsAreDestroyed(player) then
		OpenRA.RunAfterDelay(Utils.Seconds(1), MissionFailed)
	end
	if Mission.RequiredUnitsAreDestroyed(player2) then
		OpenRA.RunAfterDelay(Utils.Seconds(1), MissionAccomplished)
	end
end

WorldLoaded = function()
	
	player	= OpenRA.GetPlayer("Rufetic")
	player2	= OpenRA.GetPlayer("TSA")
	
	
	SendReinforcements()
	

	OpenRA.SetViewportCenterPosition(Actor6.CenterPosition)

end

MissionAccomplished = function()
	Mission.MissionOver({ player }, nil, false)
	Media.PlayMovieFullscreen("burdet1.vqa")
end

MissionFailed = function()
	Mission.MissionOver(nil, { player }, false)
	Media.PlayMovieFullscreen("gameover.vqa")
end
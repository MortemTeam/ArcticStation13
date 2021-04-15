/datum/antagonist/changeling
	hard_cap = 1
	hard_cap_round = 1
	initial_spawn_req = 1
	initial_spawn_target = 1
	flags = ANTAG_SUSPICIOUS
	blacklisted_jobs = list(
		/datum/job/silicon/cyborg,
	)

	protected_jobs = list(
		/datum/job/command/research_director,
		/datum/job/command/head_of_security,
		/datum/job/security/officer,
		/datum/job/command/chief_personel,
	)

/datum/antagonist/changeling/get_special_objective_text(var/datum/mind/player)
	return "<br><b>Changeling ID:</b> [player.changeling.changelingID].<br><b>Genomes Absorbed:</b> [player.changeling.absorbedcount]"

/datum/antagonist/changeling/update_antag_mob(var/datum/mind/player)
	..()
	player.current.make_changeling()

/datum/antagonist/changeling/create_objectives(var/datum/mind/changeling)
	var/datum/objective/survive/survive_objective = new
	survive_objective.owner = changeling
	changeling.objectives += survive_objective

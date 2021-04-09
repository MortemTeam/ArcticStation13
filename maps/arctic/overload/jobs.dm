/datum/job
	var/allowed_to_game = 0

/get_job_datums()
	var/list/occupations = list()
	var/list/all_jobs = typesof(/datum/job)

	for(var/A in all_jobs)
		var/datum/job/job = new A()
		if(job && job.allowed_to_game)
			occupations += job

	return occupations
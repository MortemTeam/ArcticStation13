/datum/mind/show_memory(mob/recipient)
	var/output = "<B>[current.real_name]'s Memory</B><HR>"
	output += memory

	if(objectives.len>0)
		output += "<HR><B>Objectives:</B>"

		var/obj_count = 1
		for(var/datum/objective/objective in objectives)
			output += "<BR><B>Objective #[obj_count]</B>: [objective.explanation_text]"
			obj_count++
	if(SSgoals.ambitions[src])
		var/datum/goal/ambition/ambition = SSgoals.ambitions[src]
		output += "<HR><B>Ambitions:</B> [ambition.summarize()]<br>"

	var/datum/browser/browser = new(current, "window=memory")
	browser.set_content(output)
	browser.open()
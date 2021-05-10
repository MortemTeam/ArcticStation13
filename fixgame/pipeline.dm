/datum/pipeline/Process()//This use to be called called from the pipe networks
	//Check to see if pressure is within acceptable limits
	var/pressure = air.return_pressure()
	if(pressure > maximum_pressure)
		for(var/obj/machinery/atmospherics/pipe/member in members)
			if(!member.check_pressure(pressure))   // << Delete here
				break //Only delete 1 pipe per process
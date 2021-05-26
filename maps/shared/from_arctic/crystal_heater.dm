/obj/machinery/power/supermatter
	var/thermal_multi = 10

/obj/machinery/power/supermatter/Process()
	..()
	if(world.timeofday > 10 MINUTES)
		for(var/zone/zone as anything in SSair.zones)
			var/datum/gas_mixture/GM = zone.air
			GM.add_thermal_energy((-500 + power) * thermal_multi)
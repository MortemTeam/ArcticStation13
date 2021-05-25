/obj/machinery/power/supermatter
	var/thermal_multi = 10

/obj/machinery/power/supermatter/Process()
	..()
	if(world.time > 5 MINUTES)
		for(var/zone/zone as anything in SSair.zones)
			var/datum/gas_mixture/GM = zone.air
			GM.add_thermal_energy((-1000 + power) * thermal_multi)
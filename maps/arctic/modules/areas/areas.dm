/datum/map/alpha
	post_round_safe_areas = list (
		/area/shuttle/escape/centcom,
		/area/shuttle/escape/station,
		/area/shuttle/escape/transit,
	)

////////////
//SHUTTLES//
////////////
//shuttle areas must contain at least two areas in a subgroup if you want to move a shuttle from one
//place to another. Look at escape shuttle for example.
//All shuttles should now be under shuttle since we have smooth-wall code.

// Command
/area/crew_quarters/heads
	sound_env = MEDIUM_SOFTFLOOR

/area/crew_quarters/heads/ce
	name = "Engineering - CE's Office"

/area/crew_quarters/heads/hos
	name = "Security - HoS' Office"

/area/crew_quarters/heads/rd
	name = "Research - RD's Office"

/area/crew_quarters/heads/cmo
	name = "Medical - MM's Office"

/area/crew_quarters/heads/clown
	name = "Service - Clown's Office"

// Shuttles

/area/shuttle/escape
	name = "Emergency Shuttle"
	area_flags = AREA_FLAG_RAD_SHIELDED

/area/shuttle/escape/station
	name = "Emergency Shuttle Station"
	icon_state = "shuttle2"

/area/shuttle/escape/transit // the area to pass through for 3 minute transit
	name = "Emergency Shuttle Transit"
	icon_state = "shuttle"
	base_turf = /turf/space/transit/north

// Mainenance


/area/maintenance/evahallway
	name = "EVA Maintenance"
	icon_state = "maint_eva"

/area/maintenance/dormitory
	name = "Dormitory Maintenance"
	icon_state = "maint_dormitory"

/area/maintenance/library
	name = "Library Maintenance"
	icon_state = "maint_library"

/area/maintenance/locker
	name = "Locker Room Maintenance"
	icon_state = "maint_locker"

/area/maintenance/medbay
	name = "Medbay Maintenance"
	icon_state = "maint_medbay"



/area/maintenance/security_port
	name = "Security Maintenance - Port"
	icon_state = "maint_security_port"

/area/maintenance/security_starboard
	name = "Security Maintenance - Starboard"
	icon_state = "maint_security_starboard"

// Dank Maintenance
/area/maintenance/sub
	turf_initializer = /decl/turf_initializer/maintenance/heavy
	ambience = list(
		'sound/ambience/ambiatm1.ogg',
		'sound/ambience/ambigen3.ogg',
		'sound/ambience/ambigen4.ogg',
		'sound/ambience/ambigen5.ogg',
		'sound/ambience/ambigen6.ogg',
		'sound/ambience/ambigen7.ogg',
		'sound/ambience/ambigen8.ogg',
		'sound/ambience/ambigen9.ogg',
		'sound/ambience/ambigen10.ogg',
		'sound/ambience/ambigen11.ogg',
		'sound/ambience/ambigen12.ogg',
		'sound/ambience/ambimine.ogg',
		'sound/ambience/ambimo2.ogg',
		'sound/ambience/ambisin4.ogg',
		'sound/effects/wind/wind_2_1.ogg',
		'sound/effects/wind/wind_2_2.ogg',
		'sound/effects/wind/wind_3_1.ogg',
	)

/area/maintenance/sub/relay_station
	name = "Sublevel Maintenance - Relay Station"
	icon_state = "blue2"
	turf_initializer = null

/area/maintenance/sub/fore
	name = "Sublevel Maintenance - Fore"
	icon_state = "sub_maint_fore"

/area/maintenance/sub/aft
	name = "Sublevel Maintenance - Aft"
	icon_state = "sub_maint_aft"

/area/maintenance/sub/port
	name = "Sublevel Maintenance - Port"
	icon_state = "sub_maint_port"

/area/maintenance/sub/starboard
	name = "Sublevel Maintenance - Starboard"
	icon_state = "sub_maint_starboard"

/area/maintenance/sub/central
	name = "Sublevel Maintenance - Central"
	icon_state = "sub_maint_central"

/area/maintenance/sub/command
	name = "Sublevel Maintenance - Command"
	icon_state = "sub_maint_command"
	turf_initializer = null

/////////////
//ELEVATORS//
/////////////
// Hallway

/area/hallway/primary/
	sound_env = LARGE_ENCLOSED

/area/hallway/primary/fore
	name = "Fore Primary Hallway"
	icon_state = "hallF"

/area/hallway/primary/starboard
	name = "Starboard Primary Hallway"
	icon_state = "hallS"

/area/hallway/primary/aft
	name = "Aft Primary Hallway"
	icon_state = "hallA"

/area/hallway/primary/port
	name = "Port Primary Hallway"
	icon_state = "hallP"

/area/hallway/primary/central_one
	name = "Central Primary Hallway"
	icon_state = "hallC1"

/area/hallway/primary/central_two
	name = "Central Primary Hallway"
	icon_state = "hallC2"

/area/hallway/primary/central_three
	name = "Central Primary Hallway"
	icon_state = "hallC3"



// Crew

/area/crew_quarters
	name = "Dormitories"
	icon_state = "Sleep"
	area_flags = AREA_FLAG_RAD_SHIELDED

/area/crew_quarters/locker
	name = "Locker Room"
	icon_state = "locker"

/area/crew_quarters/toilet
	name = "Dormitory Toilets"
	icon_state = "toilet"
	sound_env = SMALL_ENCLOSED

/area/crew_quarters/sleep
	name = "Dormitories"
	icon_state = "Sleep"

/area/crew_quarters/sleep/engi_wash
	name = "Engineering Washroom"
	icon_state = "toilet"
	sound_env = SMALL_ENCLOSED

/area/crew_quarters/sleep/bedrooms
	name = "Dormitory Bedroom One"
	icon_state = "Sleep"
	sound_env = SMALL_SOFTFLOOR

/area/crew_quarters/locker/locker_toilet
	name = "Locker Toilets"
	icon_state = "toilet"
	sound_env = SMALL_ENCLOSED

/area/crew_quarters/fitness
	name = "Fitness Room"
	icon_state = "fitness"

/area/library
 	name = "Library"
 	icon_state = "library"
 	sound_env = LARGE_SOFTFLOOR

//Engineering


// Solars

/area/solar/starboard
	name = "Starboard Auxiliary Solar Array"
	icon_state = "panelsS"

/area/solar/auxport
	name = "Fore Port Solar Array"
	icon_state = "panelsA"

/area/solar/fore
	name = "Fore Solar Array"
	icon_state = "yellow"

/area/maintenance/foresolar
	name = "Solar Maintenance - Fore"
	icon_state = "SolarcontrolA"
	sound_env = SMALL_ENCLOSED

/area/maintenance/portsolar
	name = "Solar Maintenance - Aft Port"
	icon_state = "SolarcontrolP"
	sound_env = SMALL_ENCLOSED

/area/maintenance/starboardsolar
	name = "Solar Maintenance - Aft Starboard"
	icon_state = "SolarcontrolS"
	sound_env = SMALL_ENCLOSED

//Teleporter

/area/gateway
	name = "Gateway"
	icon_state = "teleporter"

//MedBay

/area/medical/medbay
	name = "Medbay Hallway - Port"
	icon_state = "medbay"
	ambience = list('sound/ambience/signal.ogg')

//Medbay is a large area, these additional areas help level out APC load.
/area/medical/medbay2
	name = "Medbay Hallway - Starboard"
	icon_state = "medbay2"
	ambience = list('sound/ambience/signal.ogg')

/area/medical/medbay3
	name = "Medbay Hallway - Fore"
	icon_state = "medbay3"
	ambience = list('sound/ambience/signal.ogg')

/area/medical/medbay4
	name = "Medbay Hallway - Aft"
	icon_state = "medbay4"
	ambience = list('sound/ambience/signal.ogg')

/area/medical/reception
	name = "Medbay Reception"
	icon_state = "medbay"
	ambience = list('sound/ambience/signal.ogg')

/area/medical/psych
	name = "Psych Room"
	icon_state = "medbay3"
	ambience = list('sound/ambience/signal.ogg')

/area/crew_quarters/medbreak
	name = "Break Room"
	icon_state = "medbay3"
	ambience = list('sound/ambience/signal.ogg')

/area/medical/ward
	name = "Recovery Ward"
	icon_state = "patients"

/area/medical/patient_a
	name = "Isolation A"
	icon_state = "patients"

/area/medical/patient_b
	name = "Isolation B"
	icon_state = "patients"

/area/medical/patient_c
	name = "Isolation C"
	icon_state = "patients"

/area/medical/patient_wing
	name = "Patient Wing"
	icon_state = "patients"

/area/medical/patient_wing/washroom
	name = "Patient Wing Washroom"

/area/medical/surgery2
	name = "Operating Theatre 2"
	icon_state = "surgery"

/area/medical/surgeryobs
	name = "Operation Observation Room"
	icon_state = "surgery"

/area/medical/surgeryprep
	name = "Pre-Op Prep Room"
	icon_state = "surgery"

/area/medical/cryo
	name = "Cryogenics"
	icon_state = "cryo"

//Security

/area/security/main
	name = "Security Office"
	icon_state = "security"

/area/security/meeting
	name = "Security Meeting Room"
	icon_state = "security"

/area/security/lobby
	name = "Security Lobby"
	icon_state = "security"

/area/security/brig/processing
	name = "Security - Processing"
	icon_state = "brig"

/area/security/brig/interrogation
	name = "Security - Interrogation"
	icon_state = "brig"

/area/security/brig/solitaryA
	name = "Security - Solitary 1"
	icon_state = "sec_prison"

/area/security/brig/solitaryB
	name = "Security - Solitary 2"
	icon_state = "sec_prison"

/area/security/brig/prison_break()
	for(var/obj/structure/closet/secure_closet/brig/temp_closet in src)
		temp_closet.locked = 0
		temp_closet.icon_state = temp_closet.icon_closed
	for(var/obj/machinery/door_timer/temp_timer in src)
		temp_timer.releasetime = 1
	..()

/area/security/prison/restroom
	name = "Security - Prison Wing Restroom"
	icon_state = "sec_prison"

/area/security/prison/dorm
	name = "Security - Prison Wing Dormitory"
	icon_state = "sec_prison"

/area/security/prison/prison_break()
	for(var/obj/structure/closet/secure_closet/brig/temp_closet in src)
		temp_closet.locked = 0
		temp_closet.icon_state = temp_closet.icon_closed
	for(var/obj/machinery/door_timer/temp_timer in src)
		temp_timer.releasetime = 1
	..()

/area/security/tactical
	name = "Security - Tactical Equipment"
	icon_state = "Tactical"

/area/quartermaster
	name = "Quartermasters"
	icon_state = "quart"

/area/quartermaster/storage
	name = "Warehouse"
	icon_state = "quartstorage"
	sound_env = LARGE_ENCLOSED

// Research


//Storage

/area/storage/art
	name = "Art Supply Storage"
	icon_state = "storage"

/area/storage/emergency
	name = "Starboard Emergency Storage"
	icon_state = "emergencystorage"

/area/storage/emergency2
	name = "Port Emergency Storage"
	icon_state = "emergencystorage"

//HALF-BUILT STATION (REPLACES DERELICT IN BAYCODE, ABOVE IS LEFT FOR DOWNSTREAM)

//AI

/area/turret_protected/ai_server_room
	name = "Messaging Server Room"
	icon_state = "ai_server"
	sound_env = SMALL_ENCLOSED

/area/turret_protected/tcomsat/port
	name = "Telecoms Satellite - Port"

/area/turret_protected/tcomsat/starboard
	name = "Telecoms Satellite - Starboard"

//Misc

// Telecommunications Satellite

/area/tcommsat/entrance
	name = "Telecoms Teleporter"
	icon_state = "tcomsatentrance"

/area/turret_protected/tcomsat
	name = "Telecoms Satellite"
	icon_state = "tcomsatlob"
	ambience = list('sound/ambience/ambisin2.ogg', 'sound/ambience/signal.ogg', 'sound/ambience/signal.ogg', 'sound/ambience/ambigen10.ogg')

/area/turret_protected/tcomfoyer
	name = "Telecoms Foyer"
	icon_state = "tcomsatentrance"
	ambience = list('sound/ambience/ambisin2.ogg', 'sound/ambience/signal.ogg', 'sound/ambience/signal.ogg', 'sound/ambience/ambigen10.ogg')

/area/tcommsat/powercontrol
	name = "Telecommunications Power Control"
	icon_state = "tcomsatwest"

/area/supply/dock
	name = "Supply Shuttle"
	icon_state = "shuttle3"
	requires_power = 0

/area/shuttle/administration/centcom
	name = "Administration Shuttle"
	icon_state = "shuttlered"

// Command

/area/bridge
	name = "Bridge"
	icon_state = "bridge"

/area/bridge/meeting_room
	name = "Heads of Staff Meeting Room"
	icon_state = "bridge"
	ambience = list()
	sound_env = MEDIUM_SOFTFLOOR

/area/crew_quarters/heads
	icon_state = "head_quarters"
D

/area/maintenance/exterior
	name = "Exterior Reinforcements"
	icon_state = "maint_security_starboard"
	area_flags = AREA_FLAG_EXTERNAL
	has_gravity = FALSE
	turf_initializer = /decl/turf_initializer/maintenance/space

// CentCom

/area/centcom/control
	name = "Centcom Control"

/area/centcom/creed
	name = "Creed's Office"

/area/centcom/evac
	name = "Centcom Emergency Shuttle"

/area/centcom/ferry
	name = "Centcom Transport Shuttle"

/area/centcom/living
	name = "Centcom Living Quarters"

/area/centcom/suppy
	name = "Centcom Supply Shuttle"

/area/centcom/test
	name = "Centcom Testing Facility"

// Solars
/area/maintenance/auxsolarport
	name = "Solar Maintenance - Port"
	icon_state = "SolarcontrolP"
	sound_env = SMALL_ENCLOSED

/area/maintenance/auxsolarstarboard
	name = "Solar Maintenance - Starboard"
	icon_state = "SolarcontrolS"
	sound_env = SMALL_ENCLOSED

/area/solar
	area_flags = AREA_FLAG_EXTERNAL
	requires_power = 1
	always_unpowered = 0
	has_gravity = FALSE
	base_turf = /turf/space

/area/solar/auxstarboard
	name = "Fore Starboard Solar Array"
	icon_state = "panelsA"

/area/solar/port
	name = "Port Auxiliary Solar Array"
	icon_state = "panelsP"

// Maintenance

/area/maintenance/disposal
	name = "Waste Disposal"
	icon_state = "disposal"

/area/maintenance/incinerator
	name = "Incinerator"
	icon_state = "disposal"

// Storage

/area/storage/primary
	name = "Primary Tool Storage"
	icon_state = "primarystorage"

/area/storage/tech
	name = "Technical Storage"
	icon_state = "storage"

/area/storage/tools
	name = "Auxiliary Tool Storage"
	icon_state = "auxstorage"

// Holodecks

/area/holodeck
	name = "Holodeck"
	icon_state = "Holodeck"
	dynamic_lighting = 0
	sound_env = LARGE_ENCLOSED

/area/holodeck/alphadeck
	name = "Holodeck Alpha"

/area/holodeck/source_plating
	name = "Holodeck - Off"

/area/holodeck/source_emptycourt
	name = "Holodeck - Empty Court"
	sound_env = ARENA

/area/holodeck/source_boxingcourt
	name = "Holodeck - Boxing Court"
	sound_env = ARENA

/area/holodeck/source_basketball
	name = "Holodeck - Basketball Court"
	sound_env = ARENA

/area/holodeck/source_thunderdomecourt
	name = "Holodeck - Thunderdome Court"
	sound_env = ARENA

/area/holodeck/source_courtroom
	name = "Holodeck - Courtroom"
	sound_env = AUDITORIUM

/area/holodeck/source_beach
	name = "Holodeck - Beach"
	sound_env = PLAIN

/area/holodeck/source_wildlife
	name = "Holodeck - Wildlife Simulation"

/area/holodeck/source_meetinghall
	name = "Holodeck - Meeting Hall"
	sound_env = AUDITORIUM

/area/holodeck/source_theatre
	name = "Holodeck - Theatre"
	sound_env = CONCERT_HALL

/area/holodeck/source_picnicarea
	name = "Holodeck - Picnic Area"
	sound_env = PLAIN

/area/holodeck/source_snowfield
	name = "Holodeck - Snow Field"
	sound_env = FOREST

/area/holodeck/source_desert
	name = "Holodeck - Desert"
	sound_env = PLAIN

/area/holodeck/source_space
	name = "Holodeck - Space"
	has_gravity = 0
	sound_env = SPACE

// Engineering

// Medical

/area/medical/biostorage
	name = "Secondary Storage"
	icon_state = "medbay4"
	ambience = list('sound/ambience/signal.ogg')

/area/medical/chemistry
	name = "Chemistry"
	icon_state = "chem"

/area/medical/exam_room
	name = "Exam Room"
	icon_state = "exam_room"

/area/medical/morgue
	name = "Morgue"
	icon_state = "morgue"
	ambience = list('sound/ambience/ambimo1.ogg','sound/ambience/ambimo2.ogg','sound/music/main.ogg')

/area/medical/sleeper
	name = "Emergency Treatment Centre"
	icon_state = "exam_room"

/area/medical/surgery
	name = "Operating Theatre"
	icon_state = "surgery"

/area/assembly/chargebay
	name = "Mech Bay"
	icon_state = "mechbay"

/area/assembly/robotics
	name = "Robotics Lab"
	icon_state = "robotics"

// Misc
/area/AIsattele
	name = "AI Satellite Teleporter Room"
	icon_state = "teleporter"
	ambience = list('sound/ambience/ambimalf.ogg')

// Shuttles
/area/shuttle/administration/orbital_outpost
	name = "Administration Shuttle"
	icon_state = "shuttlered"

// Security

/area/prison/solitary
	name = "Solitary Confinement"
	icon_state = "brig"

/area/security/armoury
	name = "Security - Armory"
	icon_state = "Warden"

/area/security/checkpoint2
	name = "Security - Checkpoint"
	icon_state = "checkpoint1"

/area/security/detectives_office
	name = "Security - Forensic Office"
	icon_state = "detective"
	sound_env = MEDIUM_SOFTFLOOR

/area/security/nuke_storage
	name = "Vault"
	icon_state = "nuke_storage"

/area/security/range
	name = "Security - Firing Range"
	icon_state = "firingrange"

// Cargo
/area/quartermaster/office
	name = "Supply Office"
	icon_state = "quartoffice"

/area/quartermaster/storage
	name = "Warehouse"
	icon_state = "quartstorage"
	sound_env = LARGE_ENCLOSED

// Crew

/area/crew_quarters/sleep/cryo
	name = "Cryogenic Storage"
	icon_state = "Sleep"

/area/janitor
	name = "Custodial Closet"
	icon_state = "janitor"

// Tcomm
/area/tcommsat/
	ambience = list('sound/ambience/ambisin2.ogg', 'sound/ambience/signal.ogg', 'sound/ambience/signal.ogg', 'sound/ambience/ambigen10.ogg')

/area/tcommsat/chamber
	name = "Telecoms Central Compartment"
	icon_state = "tcomsatcham"

/area/tcommsat/computer
	name = "Telecoms Control Room"
	icon_state = "tcomsatcomp"

// AI

/area/ai_monitored
	name = "AI Monitored Area"

/area/ai_monitored/storage/eva
	name = "EVA Storage"
	icon_state = "eva"

/area/turret_protected/ai
	name = "AI Chamber"
	icon_state = "ai_chamber"
	ambience = list('sound/ambience/ambimalf.ogg')

/area/turret_protected/ai_cyborg_station
	name = "Cyborg Station"
	icon_state = "ai_cyborg"
	sound_env = SMALL_ENCLOSED

/area/turret_protected/ai_upload
	name = "AI Upload Chamber"
	icon_state = "ai_upload"
	ambience = list('sound/ambience/ambimalf.ogg')

/area/turret_protected/ai_upload_foyer
	name = " AI Upload Access"
	icon_state = "ai_foyer"
	ambience = list('sound/ambience/ambimalf.ogg')
	sound_env = SMALL_ENCLOSED

//
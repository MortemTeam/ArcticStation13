#if !defined(using_map_DATUM)
	//CONTENT
	#include "../shared/job/jobs.dm"
	#include "../shared/datums/uniforms.dm"
	#include "../shared/items/cards_ids.dm"
	#include "../shared/items/clothing.dm"
	#include "../../code/modules/lobby_music/generic_songs.dm"

	//SINGLED MODULE
	#include "modules/ambient_occlusion.dm"
	#include "modules/camera_network.dm"
	#include "modules/crystal_heater.dm"
	#include "modules/drill.dm"
	#include "modules/erp_panel.dm"
	#include "modules/lobby_music.dm"
	#include "modules/mob.dm"
	#include "modules/renames.dm"
	#include "modules/detective_guncase.dm"
	#include "modules/spawnpoints.dm"

	//SHUTTLES
	#include "modules/shuttles/shuttle.dm"
	#include "modules/shuttles/chair.dm"

	//ANTAGONISTS
	#include "modules/antagonists/traitor/traitor.dm"
	#include "modules/antagonists/traitor/arsenal/custom.dm"
	#include "modules/antagonists/traitor/arsenal/comintern.dm"
	#include "modules/antagonists/traitor/arsenal/nanotrusten.dm"
	#include "modules/antagonists/traitor/arsenal/third_reich.dm"
	#include "modules/antagonists/traitor/arsenal/spider.dm"

	#include "modules/antagonists/mutant/mutant.dm"
	#include "modules/antagonists/mutant/powers.dm"
	#include "modules/antagonists/mutant/screen_catcher.dm"

	//AREAS
	#include "modules/areas/areas.dm"
	#include "modules/areas/escape.dm"
	#include "modules/areas/hallway.dm"
	#include "modules/areas/research.dm"
	#include "modules/areas/engineering.dm"
	#include "modules/areas/cargo.dm"
	#include "modules/areas/brig.dm"
	#include "modules/areas/heads.dm"
	#include "modules/areas/substation.dm"
	#include "modules/areas/service.dm"
	#include "modules/areas/special.dm"

	//CLOTHING
	#include "modules/clothing/voidsuit.dm"
	#include "modules/clothing/hand_state.dm"
	#include "modules/clothing/tails/items.dm"

	//JIVIN
	#include "modules/jivin/jivin.dm"
	#include "modules/jivin/chemistry.dm"
	#include "modules/jivin/pacman.dm"
	#include "modules/jivin/uplink.dm"

	//JOBS
	#include "modules/jobs/jobs.dm"
	#include "modules/jobs/job_controller.dm"
	#include "modules/jobs/outfit.dm"

	//MAPS
	#include "arctic-1.dmm"
	#include "arctic-2.dmm"

	#define using_map_DATUM /datum/map/arctic

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Alpha
#endif

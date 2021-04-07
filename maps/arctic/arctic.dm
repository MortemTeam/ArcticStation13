#if !defined(using_map_DATUM)

	#include "arctic_announcements.dm"
	#include "arctic_areas.dm"


	//CONTENT
	#include "../shared/job/jobs.dm"
	#include "../shared/datums/uniforms.dm"
	#include "../shared/items/cards_ids.dm"
	#include "../shared/items/clothing.dm"

	#include "job/jobs.dm"

	#include "arctic_gamemodes.dm"
	#include "arctic_presets.dm"
	#include "arctic_shuttles.dm"

	#include "arctic-1.dmm"

	#include "../../code/modules/lobby_music/generic_songs.dm"

	#define using_map_DATUM /datum/map/arctic

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Alpha
#endif

#if !defined(using_map_DATUM)

	#include "arctic_announcements.dm"
	#include "arctic_areas.dm"


	//CONTENT
	#include "../shared/job/jobs.dm"
	#include "../shared/datums/uniforms.dm"
	#include "../shared/items/cards_ids.dm"
	#include "../shared/items/clothing.dm"

	//OVERLOAD
	#include "overload/erppanel.dm"
	#include "overload/outfit.dm"
	#include "overload/jobs.dm"
	#include "overload/browser.dm"
	#include "overload/mob.dm"

	//DEFINES
	#include "defines/ambient_occlusion.dm"
	#include "defines/jobs.dm"
	#include "defines/shuttles.dm"
	#include "defines/clothing/voidsuit.dm"
	#include "defines/areas/research.dm"
	#include "defines/areas/special.dm"
	#include "defines/areas/hallway.dm"
	#include "defines/areas/escape.dm"
	#include "defines/areas/service.dm"

	#include "arctic_gamemodes.dm"
	#include "arctic_presets.dm"
	#include "arctic_shuttles.dm"

	#include "arctic-1.dmm"
	#include "arctic-2.dmm"

	#include "../../code/modules/lobby_music/generic_songs.dm"

	#define using_map_DATUM /datum/map/arctic

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Alpha
#endif

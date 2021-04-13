#if !defined(using_map_DATUM)
	//CONTENT
	#include "../shared/job/jobs.dm"
	#include "../shared/datums/uniforms.dm"
	#include "../shared/items/cards_ids.dm"
	#include "../shared/items/clothing.dm"

	//OVERLOAD
	#include "overload/erppanel.dm"
	#include "overload/outfit.dm"
	#include "overload/jobs.dm"
	#include "overload/mob.dm"

	//ANTAGONISTS
	#include "overload/antagonists/traitor.dm"
	#include "overload/antagonists/arsenal/comintern.dm"
	#include "overload/antagonists/arsenal/nanotrusten.dm"
	#include "overload/antagonists/arsenal/third_reich.dm"
	#include "overload/antagonists/arsenal/yakuza.dm"

	//FIX BROWSER
	#include "overload/fix_browsers/browser.dm"
	#include "overload/fix_browsers/strip.dm"
	#include "overload/fix_browsers/notes.dm"

	//DEFINES
	#include "defines/jivin.dm"
	#include "defines/ambient_occlusion.dm"
	#include "defines/jobs.dm"
	#include "defines/shuttles.dm"
	#include "defines/clothing/voidsuit.dm"

	//AREAS
	#include "defines/areas/research.dm"
	#include "defines/areas/special.dm"
	#include "defines/areas/hallway.dm"
	#include "defines/areas/escape.dm"
	#include "defines/areas/service.dm"

	//SYSTEM
	#include "arctic_announcements.dm"
	#include "arctic_areas.dm"
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

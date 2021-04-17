/log_to_dd(text)
	to_world_log(text) //this comes before the config check because it can't possibly runtime
	if(config && config.log_world_output)
		game_log("DD_OUTPUT", text)
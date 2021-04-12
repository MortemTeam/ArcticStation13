/datum/browser/proc/process_icons(text)
	//taken from to_chat(), processes all explanded \icon macros since they don't work in minibrowser (they only work in text output)
	var/static/regex/icon_replacer = new(@/<IMG CLASS=icon SRC=(\[[^]]+])(?: ICONSTATE='([^']+)')?>/, "g")	//syntax highlighter fix -> '
	while(icon_replacer.Find(text))
		text =\
			copytext(text,1,icon_replacer.index) +\
			icon2html(locate(icon_replacer.group[1]), target = user, icon_state=icon_replacer.group[2]) +\
			copytext(text,icon_replacer.next)
	return text

/datum/browser/add_head_content(nhead_content)
	head_content += process_icons(nhead_content)

/datum/browser/set_content(ncontent)
	content = process_icons(ncontent)

/datum/browser/add_content(ncontent)
	content += process_icons(ncontent)

/datum/browser/get_header()
	var/key
	var/filename
	for (key in stylesheets)
		filename = "[ckey(key)].css"
		user << browse_rsc(stylesheets[key], filename)
		head_content += "<link rel='stylesheet' type='text/css' href='[filename]'>"

	for (key in scripts)
		filename = "[ckey(key)].js"
		user << browse_rsc(scripts[key], filename)
		head_content += "<script type='text/javascript' src='[filename]'></script>"

	var/title_attributes = "class='uiTitle'"
	if (title_image)
		title_attributes = "class='uiTitle icon' style='background-image: url([title_image]);'"

	return {"<!DOCTYPE html>
<html>
	<meta charset=\"utf-8\">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		[head_content]
	</head>
	<body scroll=auto>
		<div class='uiWrapper'>
			[title ? "<div class='uiTitleWrapper'><div [title_attributes]><tt>[title]</tt></div><div class='uiTitleButtons'>[title_buttons]</div></div>" : ""]
			<div class='uiContent'>
	"}
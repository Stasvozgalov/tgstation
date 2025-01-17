/datum/disease/cold9
	name = "Холод"
	max_stages = 3
	spread_text = "При контакте"
	spread_flags = DISEASE_SPREAD_BLOOD | DISEASE_SPREAD_CONTACT_SKIN | DISEASE_SPREAD_CONTACT_FLUIDS
	cure_text = "Антитела к простуде и космоциллин"
	cures = list(/datum/reagent/medicine/spaceacillin)
	agent = "ICE9-риновирус"
	viable_mobtypes = list(/mob/living/carbon/human)
	desc = "Если не лечить, объект будет замедляться, как если бы он был частично заморожен."
	severity = DISEASE_SEVERITY_HARMFUL
	required_organ = ORGAN_SLOT_LUNGS

/datum/disease/cold9/stage_act(seconds_per_tick, times_fired)
	. = ..()
	if(!.)
		return

	switch(stage)
		if(2)
			affected_mob.adjust_bodytemperature(-5 * seconds_per_tick)
			if(SPT_PROB(0.5, seconds_per_tick))
				affected_mob.emote("sneeze")
			if(SPT_PROB(0.5, seconds_per_tick))
				affected_mob.emote("cough")
			if(SPT_PROB(0.5, seconds_per_tick))
				to_chat(affected_mob, span_danger("У меня болит горло."))
			if(SPT_PROB(2.5, seconds_per_tick))
				to_chat(affected_mob, span_danger("Немею."))
			if(SPT_PROB(0.05, seconds_per_tick))
				to_chat(affected_mob, span_notice("Чувствую себя лучше."))
				cure()
				return FALSE
		if(3)
			affected_mob.adjust_bodytemperature(-10 * seconds_per_tick)
			if(SPT_PROB(0.5, seconds_per_tick))
				affected_mob.emote("sneeze")
			if(SPT_PROB(0.5, seconds_per_tick))
				affected_mob.emote("cough")
			if(SPT_PROB(0.5, seconds_per_tick))
				to_chat(affected_mob, span_danger("У меня болит горло."))
			if(SPT_PROB(5, seconds_per_tick))
				to_chat(affected_mob, span_danger("Немею."))

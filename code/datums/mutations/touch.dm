/datum/mutation/human/shock
	name = "Электрошок"
	desc = "Позволяет накапливать крайне высокий заряд статического электричества и при желании разряжаться на выбраную цель при касании."
	quality = POSITIVE
	locked = TRUE
	difficulty = 16
	text_gain_indication = span_notice("Между моими пальцами пробегают разряды молний.")
	text_lose_indication = span_notice("Энергия утекает.")
	power_path = /datum/action/cooldown/spell/touch/shock
	instability = 35
	energy_coeff = 1
	power_coeff = 1

/datum/mutation/human/shock/modify()
	. = ..()
	var/datum/action/cooldown/spell/touch/shock/to_modify =.

	if(!istype(to_modify)) // null or invalid
		return

	if(GET_MUTATION_POWER(src) <= 1)
		to_modify.chain = initial(to_modify.chain)
		return

	to_modify.chain = TRUE

/datum/action/cooldown/spell/touch/shock
	name = "Электрошок"
	desc = "Позволяет накапливать крайне высокий заряд статического электричества и при желании разряжаться на выбраную цель при касании."
	draw_message = "Руку трясет от переполнявшего ее напряжения."
	drop_message = "Сбрасываю заряд."
	button_icon_state = "zap"
	sound = 'sound/weapons/zapbang.ogg'
	cooldown_time = 12 SECONDS
	invocation_type = INVOCATION_NONE
	spell_requirements = NONE
	antimagic_flags = NONE

	//Vars for zaps made when power chromosome is applied, ripped and toned down from reactive tesla armor code.
	///This var decides if the spell should chain, dictated by presence of power chromosome
	var/chain = FALSE
	///Affects damage, should do about 1 per limb
	var/zap_power = 7500
	///Range of tesla shock bounces
	var/zap_range = 7
	///flags that dictate what the tesla shock can interact with, Can only damage mobs, Cannot damage machines or generate energy
	var/zap_flags = ZAP_MOB_DAMAGE

	hand_path = /obj/item/melee/touch_attack/shock

/datum/action/cooldown/spell/touch/shock/cast_on_hand_hit(obj/item/melee/touch_attack/hand, atom/victim, mob/living/carbon/caster)
	if(iscarbon(victim))
		var/mob/living/carbon/carbon_victim = victim
		if(carbon_victim.electrocute_act(15, caster, 1, SHOCK_NOGLOVES | SHOCK_NOSTUN))//doesnt stun. never let this stun
			carbon_victim.dropItemToGround(carbon_victim.get_active_held_item())
			carbon_victim.dropItemToGround(carbon_victim.get_inactive_held_item())
			carbon_victim.adjust_confusion(15 SECONDS)
			carbon_victim.visible_message(
				span_danger("[caster] ударяет [victim] током!"),
				span_userdanger("[caster] ударяет меня током!"),
			)
			if(chain)
				tesla_zap(source = victim, zap_range = zap_range, power = zap_power, cutoff = 1e3, zap_flags = zap_flags)
				carbon_victim.visible_message(span_danger("An arc of electricity explodes out of [victim]!"))
			return TRUE

	else if(isliving(victim))
		var/mob/living/living_victim = victim
		if(living_victim.electrocute_act(15, caster, 1, SHOCK_NOSTUN))
			living_victim.visible_message(
				span_danger("[caster] ударяет [victim] током!"),
				span_userdanger("[caster] ударяет меня током!"),
			)
			if(chain)
				tesla_zap(source = victim, zap_range = zap_range, power = zap_power, cutoff = 1e3, zap_flags = zap_flags)
				living_victim.visible_message(span_danger("An arc of electricity explodes out of [victim]!"))
			return TRUE

	to_chat(caster, span_warning("[victim] никак не реагирует..."))
	return TRUE

/obj/item/melee/touch_attack/shock
	name = "Электрошок"
	desc = "Карманная молния"
	icon = 'icons/obj/weapons/hand.dmi'
	icon_state = "zapper"
	inhand_icon_state = "zapper"

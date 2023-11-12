/obj/item/implant/chem
	name = "микроимплант - 'Химическая мина'"
	desc = "Injects things."
	icon_state = "reagents"
	actions_types = null

/obj/item/implant/chem/get_data()
	var/dat = {"<b>Implant Specifications:</b><BR>
				<b>Name:</b> Robust Corp MJ-420 Prisoner Management Implant<BR>
				<b>Life:</b> Deactivates upon death but remains within the body.<BR>
				<b>Important Notes: Due to the system functioning off of nutrients in the implanted subject's body, the subject<BR>
				will suffer from an increased appetite.</B><BR>
				<HR>
				<b>Implant Details:</b><BR>
				<b>Function:</b> Contains a small capsule that can contain various chemicals. Upon receiving a specially encoded signal<BR>
				the implant releases the chemicals directly into the blood stream.<BR>
				<b>Special Features:</b>
				<i>Micro-Capsule</i>- Can be loaded with any sort of chemical agent via the common syringe and can hold 50 units.<BR>
				Can only be loaded while still in its original case.<BR>
				<b>Integrity:</b> Implant will last so long as the subject is alive."}
	return dat

/obj/item/implant/chem/Initialize(mapload)
	. = ..()
	create_reagents(50, OPENCONTAINER)
	GLOB.tracked_chem_implants += src

/obj/item/implant/chem/Destroy()
	GLOB.tracked_chem_implants -= src
	return ..()

/obj/item/implant/chem/implant(mob/living/target, mob/user, silent = FALSE, force = FALSE)
	. = ..()
	if(.)
		RegisterSignal(target, COMSIG_LIVING_DEATH, PROC_REF(on_death))

/obj/item/implant/chem/removed(mob/target, silent = FALSE, special = FALSE)
	. = ..()
	if(.)
		UnregisterSignal(target, COMSIG_LIVING_DEATH)

/obj/item/implant/chem/proc/on_death(mob/living/source)
	SIGNAL_HANDLER
	INVOKE_ASYNC(src, TYPE_PROC_REF(/obj/item/implant/chem, activate), reagents.total_volume)

/obj/item/implant/chem/activate(cause)
	. = ..()
	if(!cause || !imp_in)
		return
	var/mob/living/carbon/R = imp_in
	var/injectamount = null
	if (cause == "action_button")
		injectamount = reagents.total_volume
	else
		injectamount = cause
	reagents.trans_to(R, injectamount)
	to_chat(R, span_hear("You hear a faint beep."))
	if(!reagents.total_volume)
		to_chat(R, span_hear("You hear a faint click from your chest."))
		qdel(src)


/obj/item/implantcase/chem
	name = "микроимплант - 'Химическая мина'"
	desc = "По команде вводит содержащиеся в нем химические вещества носителю."
	imp_type = /obj/item/implant/chem

/obj/item/implantcase/chem/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/reagent_containers/syringe) && imp)
		W.afterattack(imp, user, TRUE, params)
		return TRUE
	else
		return ..()

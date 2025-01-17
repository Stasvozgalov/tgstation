/datum/mood_event/handcuffed
	description = "<span class='warning'>Кажется мои выходки кто-то заметил.</span>\n"
	mood_change = -5

/datum/mood_event/broken_vow //Used for when mimes break their vow of silence
	description = "<span class='boldwarning'>Моё имя было опозорено нарушением моего обета...</span>\n"
	mood_change = -16

/datum/mood_event/on_fire
	description = "<span class='boldwarning'>ГОРЮ!!!</span>\n"
	mood_change = -24

/datum/mood_event/suffocation
	description = "<span class='boldwarning'>НЕ.. МОГУ... ДЫШАТЬ...</span>\n"
	mood_change = -24

/datum/mood_event/burnt_thumb
	description = "<span class='warning'>Не стоило мне играть с зажигалкой.</span>\n"
	mood_change = -1
	timeout = 2 MINUTES

/datum/mood_event/cold
	description = "<span class='warning'>Тут очень холодно.</span>\n"
	mood_change = -10

/datum/mood_event/hot
	description = "<span class='warning'>Становится жарковато.</span>\n"
	mood_change = -10

/datum/mood_event/creampie
	description = "<span class='warning'>Меня окремили. На вкус как пирог.</span>\n"
	mood_change = -6
	timeout = 3 MINUTES

/datum/mood_event/slipped
	description = "<span class='warning'>Опять поскальзываюсь. Надо быть аккуратней.</span>\n"
	mood_change = -6
	timeout = 3 MINUTES

/datum/mood_event/eye_stab
	description = "<span class='boldwarning'>МНЕ ПРОТКНУЛИ ГЛАЗ!!!</span>\n"
	mood_change = -16
	timeout = 3 MINUTES

/datum/mood_event/delam //SM delamination
	description = "<span class='boldwarning'>Эти инженеры никогда не могут что-то сделать нормально...</span>\n"
	mood_change = -3
	timeout = 4 MINUTES

/datum/mood_event/cascade // Big boi delamination
	description = "<span class='boldwarning'>Я никогда не думал, что увижу каскад резонанса, не говоря уже о том, что сам его испытаю...</span>\n"
	mood_change = -8
	timeout = 5 MINUTES

/datum/mood_event/depression_minimal
	description = "<span class='warning'>Мне немного грустно.</span>\n"
	mood_change = -10
	timeout = 2 MINUTES

/datum/mood_event/depression_mild
	description = "<span class='warning'>Мне грустно без каких-либо причин.</span>\n"
	mood_change = -12
	timeout = 2 MINUTES

/datum/mood_event/depression_moderate
	description = "<span class='warning'>Мне грустно.</span>\n"
	mood_change = -14
	timeout = 2 MINUTES

/datum/mood_event/depression_severe
	description = "<span class='warning'>Хочу умереть.</span>\n"
	mood_change = -16
	timeout = 2 MINUTES

/datum/mood_event/shameful_suicide //suicide_acts that return SHAME, like sord
	description = "<span class='boldwarning'>Даже не могу покончить со всем этим!</span>\n"
	mood_change = -15
	timeout = 60 SECONDS

/datum/mood_event/dismembered
	description = "<span class='boldwarning'>АА-А! МНЕ НУЖНА БЫЛА ЭТА КОНЕЧНОСТЬ!</span>\n"
	mood_change = -10
	timeout = 8 MINUTES

/datum/mood_event/dismembered/add_effects(obj/item/bodypart/limb)
	if(limb)
		description = "<span class='warning>ААА МОЯ [uppertext(ru_parse_zone(limb.plaintext_zone))]! ОНА БЫЛА МНЕ НУЖНА!</span>"

/datum/mood_event/reattachment
	description = "<span class='warning>Ауч! Не чувствую конечность</span>"
	mood_change = -3
	timeout = 2 MINUTES

/datum/mood_event/reattachment/add_effects(obj/item/bodypart/limb)
	if(limb)
		description = "<span class='warning>Ауч! Не чувствую [ru_parse_zone(limb.plaintext_zone)]."

/datum/mood_event/tased
	description = "<span class='warning'>There's no \"z\" in \"taser\". It's in the zap.</span>\n"
	mood_change = -3
	timeout = 2 MINUTES

/datum/mood_event/embedded
	description = "<span class='boldwarning'>Достаньте это из меня, достаньте!</span>\n"
	mood_change = -7

/datum/mood_event/table
	description = "<span class='warning'>Кто-то бросил меня на стол!</span>\n"
	mood_change = -2
	timeout = 2 MINUTES

/datum/mood_event/table/add_effects()
	if(isfelinid(owner)) //Holy snowflake batman!
		var/mob/living/carbon/human/H = owner
		SEND_SIGNAL(H, COMSIG_ORGAN_WAG_TAIL, TRUE, 3 SECONDS)
		description =  "<span class='nicegreen'>Со мной хотят поиграться на столе!</span>\n"
		mood_change = 2

/datum/mood_event/table_limbsmash
	description = "<span class='warning'>Моя голова очень сильно болит!</span>\n"
	mood_change = -3
	timeout = 3 MINUTES

/datum/mood_event/table_limbsmash/add_effects(obj/item/bodypart/banged_limb)
	if(banged_limb)
		description = "<span class='warning'>My fucking [banged_limb.name], man that hurts...</span>\n"

/datum/mood_event/brain_damage
	mood_change = -3

/datum/mood_event/brain_damage/add_effects()
	var/damage_message = pick_list_replacements(BRAIN_DAMAGE_FILE, "brain_damage")
	description = "Hurr durr... [damage_message]"

/datum/mood_event/hulk //Entire duration of having the hulk mutation
	description = "<span class='warning'>ХАЛК КРУШИТЬ</span>\n"
	mood_change = -4

/datum/mood_event/epilepsy //Only when the mutation causes a seizure
	description = "<span class='warning'>Стоило обратить внимание на предупреждение об эпилепсии.</span>\n"
	mood_change = -3
	timeout = 5 MINUTES

/datum/mood_event/photophobia
	description = "<span class='warning'>Свет слишком яркий...</span>\n"
	mood_change = -3

/datum/mood_event/nyctophobia
	description = "<span class='warning'>Здесь темновато...</span>\n"
	mood_change = -3

/datum/mood_event/claustrophobia
	description = "<span class='warning'>Почему я чувствую себя в ловушке?! Выпустите меня!!!</span>\n"
	mood_change = -7
	timeout = 1 MINUTES

/datum/mood_event/bright_light
	description = "<span class='boldwarning'>Ненавижу белых... Хочу срочно стать негром...</span>\n"
	mood_change = -12

/datum/mood_event/family_heirloom_missing
	description = "<span class='warning'>Скучаю по моей семейной реликвии...</span>\n"
	mood_change = -4

/datum/mood_event/healsbadman
	description = "<span class='warning'>Меня держит тонкая нить, и у меня ощущение, что можно развалиться в любой момент!</span>\n"
	mood_change = -4
	timeout = 2 MINUTES

/datum/mood_event/healsbadman/long_term
	timeout = 10 MINUTES

/datum/mood_event/jittery
	description = "<span class='warning'>Нервничаю, нервничаю и не могу стоять ровно!</span>\n"
	mood_change = -2

/datum/mood_event/choke
	description = "<span class='boldwarning'>НЕ МОГУ ДЫШАТЬ!!!</span>"
	mood_change = -10

/datum/mood_event/vomit
	description = "<span class='warning'>Меня только что вырвало. Мерзость.</span>\n"
	mood_change = -2
	timeout = 2 MINUTES

/datum/mood_event/vomitself
	description = "<span class='warning'>Меня только что стошнило на себя. Это отвратительно.</span>\n"
	mood_change = -4
	timeout = 3 MINUTES

/datum/mood_event/painful_medicine
	description = "<span class='warning'>Медицина может быть и хороша для меня, но сейчас она адово жалит!</span>\n"
	mood_change = -5
	timeout = 60 SECONDS

/datum/mood_event/spooked
	description = "<span class='warning'>Дребезжание тех костей... Я не могу это забыть.</span>\n"
	mood_change = -4
	timeout = 4 MINUTES

/datum/mood_event/loud_gong
	description = "<span class='warning'>Этот гонг и правда очень громок!</span>\n"
	mood_change = -3
	timeout = 2 MINUTES

/datum/mood_event/notcreeping
	description = "<span class='warning'>Голоса не рады тому, что я не выполняю своё задание, и они болезненно заставляют мои мысли выполнять его.</span>\n"
	mood_change = -6
	timeout = 3 SECONDS
	hidden = TRUE

/datum/mood_event/notcreepingsevere//not hidden since it's so severe
	description = "<span class='boldwarning'>ОНИИИ ХОТЯЯЯТ ЕГООО!!</span>\n"
	mood_change = -30
	timeout = 3 SECONDS

/datum/mood_event/notcreepingsevere/add_effects(name)
	var/list/unstable = list(name)
	for(var/i in 1 to rand(3,5))
		unstable += copytext_char(name, -1)
	var/unhinged = uppertext(unstable.Join(""))//example Tinea Luxor > TINEA LUXORRRR (with randomness in how long that slur is)
	description = "<span class='boldwarning'>ОНИИИ ХОТЯЯЯТ [unhinged]!!</span>\n"

/datum/mood_event/tower_of_babel
	description = "My ability to communicate is an incoherent babel..."
	mood_change = -1
	timeout = 15 SECONDS

/datum/mood_event/back_pain
	description = "<span class='boldwarning'>Сумки никогда не сидят ровно на моей спине, это очень больно!</span>\n"
	mood_change = -15

/datum/mood_event/sad_empath
	description = "<span class='warning'>Кто-то видимо грустит...</span>\n"
	mood_change = -1
	timeout = 60 SECONDS

/datum/mood_event/sad_empath/add_effects(mob/sadtarget)
	description = "<span class='warning'>[sadtarget.name] кажется грустит...</span>\n"

/datum/mood_event/sacrifice_bad
	description ="<span class='warning'>Эти чёртовы дикари!</span>\n"
	mood_change = -5
	timeout = 2 MINUTES

/datum/mood_event/artbad
	description = "<span class='warning'>У меня получалось и лучше чем это.</span>\n"
	mood_change = -2
	timeout = 2 MINUTES

/datum/mood_event/graverobbing
	description ="<span class='boldwarning'>I just desecrated someone's grave... I can't believe I did that...</span>\n"
	mood_change = -8
	timeout = 3 MINUTES

/datum/mood_event/deaths_door
	description = "<span class='boldwarning'>This is it... I'm really going to die.</span>\n"
	mood_change = -20

/datum/mood_event/gunpoint
	description = "<span class='boldwarning'>This guy is insane! I better be careful....</span>\n"
	mood_change = -10

/datum/mood_event/tripped
	description = "<span class='boldwarning'>I can't believe I fell for the oldest trick in the book!</span>\n"
	mood_change = -5
	timeout = 2 MINUTES

/datum/mood_event/untied
	description = "<span class='boldwarning'>I hate when my shoes come untied!</span>\n"
	mood_change = -3
	timeout = 60 SECONDS

/datum/mood_event/gates_of_mansus
	description = "<span class='boldwarning'>I HAD A GLIMPSE OF THE HORROR BEYOND THIS WORLD. REALITY UNCOILED BEFORE MY EYES!</span>\n"
	mood_change = -25
	timeout = 4 MINUTES

/datum/mood_event/high_five_alone
	description = "<span class='boldwarning'>I tried getting a high-five with no one around, how embarassing!</span>\n"
	mood_change = -2
	timeout = 60 SECONDS

/datum/mood_event/high_five_full_hand
	description = "<span class='boldwarning'>Oh God, I don't even know how to high-five correctly...</span>\n"
	mood_change = -1
	timeout = 45 SECONDS

/datum/mood_event/left_hanging
	description = "<span class='boldwarning'>But everyone loves high fives! Maybe people just... hate me?</span>\n"
	mood_change = -2
	timeout = 90 SECONDS

/datum/mood_event/too_slow
	description = "<span class='boldwarning'>NO! HOW COULD I BE.... TOO SLOW???</span>\n"
	mood_change = -2 // multiplied by how many people saw it happen, up to 8, so potentially massive. the ULTIMATE prank carries a lot of weight
	timeout = 2 MINUTES

/datum/mood_event/too_slow/add_effects(param)
	var/people_laughing_at_you = 1 // start with 1 in case they're on the same tile or something
	for(var/mob/living/carbon/iter_carbon in oview(owner, 7))
		if(iter_carbon.stat == CONSCIOUS)
			people_laughing_at_you++
			if(people_laughing_at_you > 7)
				break

	mood_change *= people_laughing_at_you
	return ..()

//These are unused so far but I want to remember them to use them later
/datum/mood_event/surgery
	description = "<span class='boldwarning'>МЕНЯ РЕЖУТ НА КУСОЧКИ!!</span>\n"
	mood_change = -8

/datum/mood_event/bald
	description = "<span class='warning'>Мне нужно что-то, чтобы закрыть голову...</span>\n"
	mood_change = -3

/datum/mood_event/bald_reminder
	description = "<span class='warning'>Мне напомнили, что я не смогу отрастить волосы! Это ужасно!</span>\n"
	mood_change = -5
	timeout = 4 MINUTES

/datum/mood_event/bad_touch
	description = "<span class='warning'>Я не люблю, когда меня трогают.</span>\n"
	mood_change = -3
	timeout = 4 MINUTES

/datum/mood_event/very_bad_touch
	description = "<span class='boldwarning'>Я не люблю, когда меня трогают!</span>\n"
	mood_change = -5
	timeout = 4 MINUTES

/datum/mood_event/noogie
	description = "Ой! Это как в старших классах..."
	mood_change = -2
	timeout = 60 SECONDS

/datum/mood_event/noogie_harsh
	description = "Ой! Это еще хуже, чем в старших классах..."
	mood_change = -4
	timeout = 60 SECONDS

/datum/mood_event/aquarium_negative
	description = "<span class='warning'>Жалко рыбок...</span>\n"
	mood_change = -3
	timeout = 90 SECONDS

/datum/mood_event/tail_lost
	description = "Мой хвост!! Почему?!"
	mood_change = -8
	timeout = 10 MINUTES

/datum/mood_event/tail_balance_lost
	description = "Мне не хватает моего хвоста."
	mood_change = -2

/datum/mood_event/tail_regained_right
	description = "Мой хвост вернулся, но это было травматично..."
	mood_change = -2
	timeout = 5 MINUTES

/datum/mood_event/tail_regained_wrong
	description = "Это какая-то больная шутка?! Это НЕ тот хвост."
	mood_change = -12 // -8 for tail still missing + -4 bonus for being frakenstein's monster
	timeout = 5 MINUTES

/datum/mood_event/burnt_wings
	description = "Мои крылья! Я не могу летать без них!"
	mood_change = -10
	timeout = 10 MINUTES

/datum/mood_event/holy_smite //punished
	description = "Я был наказан своим божеством!"
	mood_change = -5
	timeout = 5 MINUTES

/datum/mood_event/banished //when the chaplain is sus! (and gets forcably de-holy'd)
	description = "Я был изгнан!"
	mood_change = -10
	timeout = 10 MINUTES

/datum/mood_event/heresy
	description = "<span class='warning'>I can hardly breathe with all this HERESY going on!</span>\n"
	mood_change = -5
	timeout = 5 MINUTES

/datum/mood_event/soda_spill
	description = "Класс! Это нормально, мне идёт..."
	mood_change = -2
	timeout = 1 MINUTES

/datum/mood_event/watersprayed
	description = "<span class='warning'>Я ненавижу, когда меня обливают водой!</span>\n"
	mood_change = -1
	timeout = 30 SECONDS

/datum/mood_event/gamer_withdrawal
	description = "<span class='warning'>Я хочу играть в видеоигры прямо сейчас...</span>\n"
	mood_change = -5

/datum/mood_event/gamer_lost
	description = "<span class='warning'>Я не могу назвать себя геймером, если я не могу выиграть в видеоигры!</span>\n"
	mood_change = -10
	timeout = 10 MINUTES

/datum/mood_event/lost_52_card_pickup
	description = "<span class='warning'>Очень неловко! Мне стыдно подбирать все эти карты с пола...</span>\n"
	mood_change = -3
	timeout = 3 MINUTES

/datum/mood_event/russian_roulette_lose
	description = "<span class='boldwarning'>Я поставил свою жизнь и проиграл! Я думаю, это конец...</span>\n"
	mood_change = -20
	timeout = 10 MINUTES

/datum/mood_event/bad_touch_bear_hug
	description = "<span class='boldwarning'>Я только что был сжат слишком сильно.</span>\n"
	mood_change = -1
	timeout = 2 MINUTES

/datum/mood_event/rippedtail
	description = "<span class='boldwarning'>Я оторвал их хвост, что я наделал!</span>\n"
	mood_change = -5
	timeout = 30 SECONDS

/datum/mood_event/sabrage_fail
	description = "<span class='boldwarning'>Чёрт! Этот трюк не удался!</span>\n"
	mood_change = -2
	timeout = 4 MINUTES

/datum/mood_event/body_purist
	description = "<span class='boldwarning'>Я чувствую протез, прикреплённый ко мне, и мне ЭТО НЕ НРАВИТСЯ!</span>\n"

/datum/mood_event/body_purist/add_effects(power)
	mood_change = power

/datum/mood_event/unsatisfied_nomad
	description = "<span class='warning'>Я здесь слишком долго! Я хочу выйти и исследовать космос!</span>\n"
	mood_change = -3

///Wizard cheesy grand finale - what everyone but the wizard gets
/datum/mood_event/madness_despair
	description = "<span class='boldwarning'>НЕДОСТОЙНЫЙ, НЕДОСТОЙНЫЙ, НЕДОСТОЙНЫЙ!!!</span>\n"
	mood_change = -200
	special_screen_obj = "mood_despair"

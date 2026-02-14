/datum/advclass/mercenary/forlorn
	name = "Forlorn Hope"
	tutorial = "The Forlorn Hope - not to be confused with their extremist cousins - are an ever-growing mercenary company formed off the back of a Ranesheni slave revolt. Drawing from all walks of life, their ranks come from both purchased and liberated slaves. Coin is power, and power is the path to freedom."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/mercenary/forlorn
	class_select_category = CLASS_CAT_RANESHENI
	min_pq = 2
	cmode_music = 'sound/music/combat_blackstar.ogg'
	subclass_languages = list(/datum/language/celestial)
	category_tags = list(CTAG_MERCENARY)
	traits_applied = list(TRAIT_MEDIUMARMOR)
	subclass_stats = list(
		STATKEY_WIL = 2,
		STATKEY_STR = 1,
		STATKEY_SPD = 1,
		STATKEY_CON = 3
	)
	subclass_skills = list(
		/datum/skill/misc/swimming = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/climbing = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/sneaking = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/bows = SKILL_LEVEL_NOVICE,
		/datum/skill/combat/crossbows = SKILL_LEVEL_NOVICE,
		/datum/skill/combat/wrestling = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/unarmed = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/swords = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/maces = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/polearms = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/axes = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/knives = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/reading = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/athletics = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/riding = SKILL_LEVEL_NOVICE,
		/datum/skill/combat/shields = SKILL_LEVEL_APPRENTICE,
	)
	extra_context = "This subclass gains Expert skill in their weapon of choice. They have unique slave-themed armour, and they're equipped with militia weapons."

/datum/outfit/job/roguetown/mercenary/forlorn/pre_equip(mob/living/carbon/human/H)
	..()
	shoes = /obj/item/clothing/shoes/roguetown/boots
	neck = /obj/item/clothing/neck/roguetown/gorget/forlorncollar
	head = /obj/item/clothing/head/roguetown/helmet/heavy/volfplate
	pants = /obj/item/clothing/under/roguetown/brigandinelegs		// They're brigandinejaks. ergo have them start w/the whole thing
	gloves = /obj/item/clothing/gloves/roguetown/fingerless_leather
	wrists = /obj/item/clothing/wrists/roguetown/bracers/brigandine		// They're brigandinejaks. ergo have them start w/the whole thing
	belt = /obj/item/storage/belt/rogue/leather
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/lord
	armor = /obj/item/clothing/suit/roguetown/armor/brigandine/light
	backr = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(
		/obj/item/rogueweapon/huntingknife,
		/obj/item/roguekey/mercenary,
		/obj/item/rogueweapon/scabbard/sheath,
		/obj/item/storage/belt/rogue/pouch/coins/poor
		)
	H.merctype = 5

/datum/outfit/job/roguetown/mercenary/forlorn
	has_loadout = TRUE

/datum/outfit/job/roguetown/mercenary/forlorn/choose_loadout(mob/living/carbon/human/H)
	. = ..()
	var/weapons = list("Revolt Veteran (Warhammer)",
	"Slave Miner (Steel War Pick)", // Militia / Peasant weapons to slay the oppressors
	"Captured Rider (Peasant Falchions & Dual Wielding)",
	"Levyman (Pitchfork Spear)",
	"Gravedigger (War Axe)",
	"Flax Farmer (Thresher)",
	"William's Company (Spiked War Club)") // Any that scales off labor skill isn't included
	var/weapon_choice = input(H, "Choose your weapon.", "ARMS TO SLAY THE OPPRESSORS") as anything in weapons
	switch(weapon_choice)
		if("Revolt Veteran (Warhammer)")
			H.equip_to_slot_or_del(new /obj/item/rogueweapon/mace/warhammer/steel, SLOT_BELT_L)
			H.equip_to_slot_or_del(new /obj/item/rogueweapon/shield/heater, SLOT_BACK_L)
			H.adjust_skillrank_up_to(/datum/skill/combat/maces, SKILL_LEVEL_EXPERT)
			H.adjust_skillrank_up_to(/datum/skill/combat/shields = SKILL_LEVEL_EXPERT)
		if("Slave Miner (Steel War Pick)")
			H.equip_to_slot_or_del(new /obj/item/rogueweapon/pick/militia/steel, SLOT_BELT_L) // The steel war pick is genuinely such an incredible weapon that you don't deserve a shield on principle. You have two pick intents and a two-handed 50 AP stab.
			H.adjust_skillrank_up_to(/datum/skill/combat/axes, SKILL_LEVEL_EXPERT)
		if("Captured Rider (Peasant Falchions & Dual Wielding)")
			H.equip_to_slot_or_del(new /obj/item/rogueweapon/sword/falchion/militia, SLOT_BELT_L)
			H.equip_to_slot_or_del(new /obj/item/rogueweapon/sword/falchion/militia, SLOT_BELT_R)
			H.adjust_skillrank_up_to(/datum/skill/combat/swords, SKILL_LEVEL_EXPERT)
			ADD_TRAIT(H, TRAIT_DUALWIELDER, TRAIT_GENERIC)
		if("Levyman (Pitchfork Spear)")
			H.put_in_hands(new /obj/item/rogueweapon/spear/militia)
			H.equip_to_slot_or_del(new /obj/item/rogueweapon/scabbard/gwstrap, SLOT_BACK_L)
			H.adjust_skillrank_up_to(/datum/skill/combat/polearms, SKILL_LEVEL_EXPERT)
		if("Gravedigger (War Axe)")
			H.put_in_hands(new /obj/item/rogueweapon/greataxe/militia)
			H.equip_to_slot_or_del(new /obj/item/rogueweapon/scabbard/gwstrap, SLOT_BACK_L)
			H.adjust_skillrank_up_to(/datum/skill/combat/axes, SKILL_LEVEL_EXPERT)
		if("Flax Farmer (Thresher)")
			H.put_in_hands(new /obj/item/rogueweapon/flail/peasantwarflail)
			H.equip_to_slot_or_del(new /obj/item/rogueweapon/scabbard/gwstrap, SLOT_BACK_L)
			H.adjust_skillrank_up_to(/datum/skill/combat/polearms, SKILL_LEVEL_EXPERT)
		if("William's Company (Spiked War Club)")						//Let reason rank where rage might reign.
			H.put_in_hands(new /obj/item/rogueweapon/woodstaff/militia)
			H.equip_to_slot_or_del(new /obj/item/rogueweapon/woodstaff/militia, SLOT_BACK_L)
			H.adjust_skillrank_up_to(/datum/skill/combat/polearms, SKILL_LEVEL_EXPERT)



/datum/advclass/mercenary/forlorn/real
	name = "Holy Order of the Forlorn Hope"	//Possible temporary name until I come up with something cooler or better.
	tutorial = "The Holy Order of the Forlorn Hope - not to be confused with their less extremist cousins - was founded in the name of Noc and the banishment of the rot, it's riddled with the wounded, the veterans and the landless of the civil war and subsequent deadite horde that felled Pack Vakran. Take up the banner and reclaim your lyfe, fight in the name of the Ten, or use the pretense of faith and zealotry to make ends meet by any means necessary."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		/datum/species/lupian, 
		/datum/species/vulpkanin)
	outfit = /datum/outfit/job/roguetown/mercenary/forlorn/real
	class_select_category = CLASS_CAT_RANESHENI
	cmode_music = 'sound/music/combat_blackstar.ogg'
	subclass_languages = list(/datum/language/celestial)
	category_tags = list(CTAG_MERCENARY)
	traits_applied = list(TRAIT_CRITICAL_RESISTANCE, TRAIT_NOPAINSTUN)
	subclass_stats = list(
		STATKEY_WIL = 3,
		STATKEY_STR = 2,
		STATKEY_CON = 2
	)
	subclass_skills = list(
		/datum/skill/misc/swimming = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/climbing = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/sneaking = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/bows = SKILL_LEVEL_NOVICE,
		/datum/skill/combat/crossbows = SKILL_LEVEL_NOVICE,
		/datum/skill/combat/wrestling = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/unarmed = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/swords = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/maces = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/knives = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/reading = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/athletics = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/riding = SKILL_LEVEL_NOVICE,
		/datum/skill/combat/shields = SKILL_LEVEL_APPRENTICE,
	)
	extra_context = "This subclass is race-limited to Lupians and Venardines."

/datum/outfit/job/roguetown/mercenary/forlorn/real/pre_equip(mob/living/carbon/human/H)
	..()
	shoes = /obj/item/clothing/shoes/roguetown/boots
	neck = /obj/item/clothing/neck/roguetown/gorget/forlorncollar
	head = /obj/item/clothing/head/roguetown/helmet/heavy/volfplate
	pants = /obj/item/clothing/under/roguetown/brigandinelegs		// They're brigandinejaks. ergo have them start w/the whole thing
	gloves = /obj/item/clothing/gloves/roguetown/fingerless_leather
	wrists = /obj/item/clothing/wrists/roguetown/bracers/brigandine		// They're brigandinejaks. ergo have them start w/the whole thing
	belt = /obj/item/storage/belt/rogue/leather
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/lord
	armor = /obj/item/clothing/suit/roguetown/armor/brigandine/light
	backr = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(
		/obj/item/roguekey/mercenary,
		/obj/item/rogueweapon/scabbard/sheath,
		/obj/item/storage/belt/rogue/pouch/coins/poor
		)
	H.merctype = 5

/datum/outfit/job/roguetown/mercenary/forlorn
	has_loadout = TRUE

/datum/outfit/job/roguetown/mercenary/forlorn/choose_loadout(mob/living/carbon/human/H)
	. = ..()
	var/weapons = list(
	"The Volf (Noccite Warhammer & Shield)",
	"The Jackal (Forlorner Longsword & Hand Mace)",
	"The Venard (Hand Mace & Crossbow)",
	"The Coyote (Falchion & Bow)")
	var/weapon_choice = input(H, "Choose your expertise.", "UNITED THROUGH SUFFERING.") as anything in weapons
	switch(weapon_choice)
		if("The Volf (Noccite Warhammer & Shield)")
			H.equip_to_slot_or_del(new /obj/item/rogueweapon/mace/warhammer/steel/forlorn, SLOT_BELT_L)
			H.equip_to_slot_or_del(new /obj/item/rogueweapon/shield/heater, SLOT_BACK_L)
			H.adjust_skillrank_up_to(/datum/skill/combat/maces, SKILL_LEVEL_EXPERT)
			H.adjust_skillrank_up_to(/datum/skill/combat/shields = SKILL_LEVEL_EXPERT)
		if("The Jackal (Forlorner Longsword)")
			H.equip_to_slot_or_del(new /obj/item/rogueweapon/pick/militia/steel, SLOT_BELT_L) // The steel war pick is genuinely such an incredible weapon that you don't deserve a shield on principle. You have two pick intents and a two-handed 50 AP stab.
			H.adjust_skillrank_up_to(/datum/skill/combat/swords, SKILL_LEVEL_EXPERT)
		if("The Venard (Hand Mace & Crossbow)")
			H.equip_to_slot_or_del(new /obj/item/rogueweapon/sword/falchion/militia, SLOT_BELT_L)
			H.equip_to_slot_or_del(new /obj/item/rogueweapon/sword/falchion/militia, SLOT_BELT_R)
			H.adjust_skillrank_up_to(/datum/skill/combat/swords, SKILL_LEVEL_EXPERT)
			ADD_TRAIT(H, TRAIT_DUALWIELDER, TRAIT_GENERIC)
		if("The Coyote (Noccite Dagger & Bow)")
			H.put_in_hands(new /obj/item/rogueweapon/spear/militia)
			H.equip_to_slot_or_del(new /obj/item/rogueweapon/scabbard/gwstrap, SLOT_BACK_L)
			H.adjust_skillrank_up_to(/datum/skill/combat/polearms, SKILL_LEVEL_EXPERT)


/datum/advclass/heartfelt/retinue/physician
	name = "Heartfeltian Physcian"
	tutorial = "You are the Physician of Heartfelt, once celebrated for your steady hands and healing wisdom, yet powerless to save your barony from its grim fate. \
	Haunted by those you could not protect, you ascend toward the Peak—seeking redemption, renewed purpose, and perhaps a cure for the wounds the world has inflicted."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_NO_GOLEM
	outfit = /datum/outfit/job/roguetown/heartfelt/retinue/physician
	maximum_possible_slots = 1
	pickprob = 100
	category_tags = list(CTAG_HFT_RETINUE)
	class_select_category = CLASS_CAT_HFT_COURT
	subclass_social_rank = SOCIAL_RANK_NOBLE

// HIGH COURT - /ONE SLOT/ Roles that were previously in the Court, but moved here.

/datum/outfit/job/roguetown/heartfelt/retinue/physician/pre_equip(mob/living/carbon/human/H)
	..()
	H.adjust_blindness(-3)
	head = /obj/item/clothing/head/roguetown/physician
	neck = /obj/item/clothing/neck/roguetown/psicross/pestra
	armor = /obj/item/clothing/suit/roguetown/shirt/robe/physician
	shirt = /obj/item/clothing/suit/roguetown/shirt/tunic/black
	gloves = /obj/item/clothing/gloves/roguetown/leather
	pants = /obj/item/clothing/under/roguetown/trou/leather/mourning
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather
	belt = /obj/item/storage/belt/rogue/leather/black
	beltl = /obj/item/storage/belt/rogue/surgery_bag/full/physician
	id = /obj/item/scomstone/bad
	r_hand = /obj/item/rogueweapon/woodstaff
	backl = /obj/item/storage/backpack/rogue/satchel/black
	backpack_contents = list(
		/obj/item/reagent_containers/glass/bottle/rogue/healthpot = 2,
		/obj/item/reagent_containers/glass/bottle/alchemical/healthpotnew = 2,
		/obj/item/natural/worms/leech/cheele = 1, //little buddy
		/obj/item/reagent_containers/glass/bottle/waterskin = 1,
		/obj/item/storage/belt/rogue/pouch/coins/rich = 1,
		/obj/item/recipe_book/alchemy = 1,
	)

	if(H.mind)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/diagnose/secular)
		if(H.patron?.type == /datum/patron/divine/pestra)
			backpack_contents += /obj/item/clothing/mask/rogue/facemask/steel/pestra_beakmask
		else
			backpack_contents += /obj/item/clothing/mask/rogue/physician
	if(H.age == AGE_OLD)
		H.change_stat("speed", -1)
		H.change_stat("intelligence", 2)
		H.change_stat("perception", 1)

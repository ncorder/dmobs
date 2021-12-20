mobs:register_mob("dmobs:owl", {
    type = "animal",
    passive = true,
    hp_min = 12,
    hp_max = 22,
    armor = 130,
    collisionbox = {-0.3, -0.5, -0.3, 0.2, 0.2, 0.2},
    visual = "mesh",
    mesh = "owl.b3d",
    textures = {
        {"dmobs_owl.png"},
    },
    mobs:register_mob("dmobs:owl", {
    blood_texture = "mobs_blood.png",
    visual_size = {x=2, y=2},
    makes_footstep_sound = false,
    walk_velocity = 0,
    run_velocity = 0,
    jump = false,
    water_damage = 2,
    lava_damage = 2,
    light_damage = 0,
    view_range = 1,
   	follow = {
		"farming:seed_wheat",
		"farming:seed_cotton",
		"mobs_bugslive:bug",
		"mobs_butterfly:butterfly",
		"butterflies:butterfly_red",
		"butterflies:butterfly_violet",
		"butterflies:butterfly_white",
		"fireflies:firefly",
                "mobs_animals:rat",
                "mobs_better_rat:rat",
                "mobs_animals:rat",
                "mobs_animals:bee",
                "mobs_animals:bunny",
                "mobs_animals:chicken",
                "mobs_animals:kitten",
                "mobs_fish:tropica",
                "mobs_fish:clownfish",
                "mobs_bat:bat",
                "mobs_birds:bird_sm",
                "dmobs:hedgehog",
	},
    drops = {
        {name="mobs:meat_raw", chance=1, min=0, max=2},
        {name="mobs:chicken_feather", chance=1, min=0, max=2}
    },
    do_custom = function(self)
        local daytime = minetest.get_timeofday()*24000
        if daytime <=6000 then
        self.object:set_properties({
                            textures = {"dmobs_owl_awake.png"},
                            mesh = "owl.b3d",
                        })
        elseif daytime >=6000 then
        self.object:set_properties({
                            textures = {"dmobs_owl.png"},
                            mesh = "owl.b3d",
                        })
        end
    end,
    animation = {
        speed_normal = 1,
        walk_start = 1,
        walk_end = 50,
    },
    on_rightclick = function(self, clicker)

        if mobs:feed_tame(self, clicker, 8, true, true) then
            return
        end
		if mobs:protect(self, clicker) then return end
        mobs:capture_mob(self, clicker, 0, 5, 50, false, nil)
    end,
})

mobs:register_egg("dmobs:owl", "Owl", "default_tree.png", 1)

mobs:spawn_specific("dmobs:owl",
                    {"group:leaves"},
                    {"air"},
                    0, 14, 30, 300000, 2, 0, 5000, false)

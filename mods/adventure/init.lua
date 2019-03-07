minetest.register_on_joinplayer(function(player)
	local name = player:get_player_name()
	player:hud_add({
		hud_elem_type = "text",
		position = {x=0, y=0.85},
		offset = {x=0, y=10},
		alignment = {x=1, y=0},
		number = 0xFFFFFF ,
		text = "For Minetest 	  :  0.4.17.x",
	})
	player:hud_add({
		hud_elem_type = "text",
		position = {x=0, y=0.85},
		offset = {x=0, y=30},
		alignment = {x=1, y=0},
		number = 0xFFFFFF ,
		text = "Game Version	 :  1.11",
	})
end)
minetest.register_on_joinplayer(function(player)
    local inv = player:get_inventory()
    inv:set_size("m", 1)
    local m = inv:get_stack("m", 1):get_count()
    local file = io.open(minetest.get_worldpath().."/adventure", "r")
	local ad = file:read("*l")
    file:close()
	if ad == "1" or ad == "2" or ad == "3" or ad == "4" then
       local override_table = player:get_physics_override()
       override_table.new_move = false
       override_table.sneak_glitch = true
       player:set_physics_override(override_table)
    elseif ad == "5" or ad == "6" then
        if m == 1 then
            local override_table = player:get_physics_override()
            override_table.new_move = true
            override_table.sneak_glitch = false
            player:set_physics_override(override_table)
        else
            local override_table = player:get_physics_override()
            override_table.new_move = false
            override_table.sneak_glitch = true
            player:set_physics_override(override_table)
        end
    end
end)
minetest.register_chatcommand("old", {
	params = "<player>",
	description = "Set old move",
	privs = {},
	func = function(name, param)
		local player = minetest.get_player_by_name(param)
        local inv = player:get_inventory()
        inv:set_size("m", 1)
        inv:set_stack("m", 1, nil)
        local override_table = player:get_physics_override()
        override_table.new_move = false
        override_table.sneak_glitch = true
        player:set_physics_override(override_table)
    end,
})
minetest.register_chatcommand("new", {
	params = "<player>",
	description = "Set new move",
	privs = {},
	func = function(name, param)
		local player = minetest.get_player_by_name(param)
        local inv = player:get_inventory()
        inv:set_size("m", 1)
        inv:set_stack("m", 1, "default:dirt")
        local override_table = player:get_physics_override()
        override_table.new_move = true
        override_table.sneak_glitch = false
        player:set_physics_override(override_table)
    end,
})
minetest.register_chatcommand("fast", {
	params = "<player>",
	description = "Give fast priv",
	privs = {},
	func = function(name, param)
		local player = minetest.get_player_by_name(param)
        local pri = minetest.get_player_privs(param)
        pri["fast"] = true
        minetest.set_player_privs(param, pri)
    end,
})
minetest.register_on_newplayer(function(player)
	local file = io.open(minetest.get_worldpath().."/adventure", "r")
	local ad = file:read("*l")
    file:close()
	if ad == "1" then
		player:setpos({x=41, y=1.5, z=50})
    elseif ad == "2" then
		player:setpos({x=(-34), y=5.5, z=16})
    elseif ad == "3" then
		player:setpos({x=152, y=10.5, z=81})
    elseif ad == "4" then
		player:setpos({x=147, y=12.5, z=39})
    elseif ad == "5" then
		player:setpos({x=3, y=12.5, z=-1})
    elseif ad == "6" then
		player:setpos({x=138, y=9.5, z=188})
	end
end)

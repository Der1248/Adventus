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
	end
end)
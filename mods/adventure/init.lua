minetest.register_on_newplayer(function(player)
	local file = io.open(minetest.get_worldpath().."/adventure", "r")
	local ad = file:read("*l")
	print (ad)
    file:close()
	if ad == "1" then
		player:setpos({x=41, y=1.5, z=50})
	end
    return true
end)
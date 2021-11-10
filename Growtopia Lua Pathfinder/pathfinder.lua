-- Made by HexaG0n Lollers 10-11-21

function asFindPath(x,y,goToPath,delay)
	-- make sure lua-star is in same folder
	if not as then as=require'lua-star' end
	local t=getTiles()t=t[#t].pos

	-- Use this instead because isSolid kinda bugs out
	local function hasFg(x,y)
		local fg = getTile(x,y).fg
		if fg%2<1 and fg>0 then
			return false
		end
		return true
	end

	-- Main A* Pathfinding
	-- Source : https://github.com/wesleywerner/lua-star
	-- NOTE: I modified "getAdjacent"'s px and py clamp calling to 0 instead of 1.
	local result = as:find(
		t.x,t.y,
		{
			x = getLocal().tile.x,
			y = getLocal().tile.y
		},
		{
			x = x,
			y = y
		},
		hasFg
	)
	if not result then return false end

	-- If goToPath is enabled, it will still return the
	-- path table. Default delay is 180ms.
	if goToPath then
		local delay = delay or 180

		for _,v in ipairs(result) do
			findPath(v.x,v.y)
			sleep(delay)
		end
	end
	return result
end
function ascii2()
    -- 多行字串可以利用兩個中括號圈起
    return [[
--Ben Fisher, 2006, Public domain
function ascii_table()
	local padnum = function (nIn)
		if nIn < 10 then return "00"..nIn
		elseif nIn < 100 then return "0"..nIn
		else return nIn
		end
	end
	local overrides = { [0]="(Null)", [9]="(Tab)",[10]="(\\n Newline)", [13]="(\\r Return)", [32]="(Space)"}
	local c
	for n=0,126 do
		if overrides[n] then c = overrides[n] else c = string.char(n) end
		print (padnum(n).."  "..c)
	end
end
ascii_table()
print("up key: 2007")
print("down key: 2008")
print("left key: 2009")
print("right key: 2010")
  ]]
end
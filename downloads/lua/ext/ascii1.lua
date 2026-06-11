function ascii1()
    -- 多行字串可以利用兩個中括號圈起
    return [[
function AsciiTable()
	local overrides = { [0]="(Null)", [9]="(Tab)",[10]="(\\n Newline)", [13]="(\\r Return)", [32]="(Space)"}
	local c
	for n=0,126 do
		if overrides[n] then c = overrides[n] else c = string.char(n) end
		print (string.format("%03d 0x%02x %s", n, n, c))
	end
end
AsciiTable()
print("up key: 2007")
print("down key: 2008")
print("left key: 2009")
print("right key: 2010")
  ]]
end
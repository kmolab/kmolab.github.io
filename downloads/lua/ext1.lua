function fun1()
    -- 多行字串可以利用兩個中括號圈起
    return [[
-- 導入 "js" 模組
local js = require "js"
-- global 就是 javascript 的 window
local global = js.global
local document = global.document
-- html 檔案中 canvas　id 設為 "canvas"
local canvas = document:getElementById("canvas")
-- 將 ctx 設為 canvas 2d 繪圖畫布變數
local ctx = canvas:getContext("2d")

-- 屬性呼叫使用 . 而方法呼叫使用 :
-- 設定填圖顏色
ctx.fillStyle = "rgb(200,0,0)"
-- 設定畫筆顏色
ctx.strokeStyle = "rgb(0,0,200)"

-- 乘上 deg 可轉為徑度單位
deg = math.pi / 180

-- 建立多邊形定點位置畫線函式
function star(radius, xc, yc, n)
    --radius = 100
    --xc = 200
    --yc = 200
    xi = xc + radius*math.cos((360/n)*deg+90*deg)
    yi = yc - radius*math.sin((360/n)*deg+90*deg)
    ctx:beginPath()
    ctx:moveTo(xi,yi)
    for i = 2, n+1 do
        x = xc + radius*math.cos((360/n)*deg*i+90*deg)
        y = yc - radius*math.sin((360/n)*deg*i+90*deg)
        ctx:lineTo(x,y)
    end
end

-- 以下利用多邊形畫線函式呼叫執行畫框線或填入顏色
-- 畫五邊形框線
star(100, 200, 200, 5)
ctx:closePath()
ctx:stroke()

-- 填三角形色塊
star(50, 350, 200, 3)
ctx:closePath()
ctx:fill()

-- 改變畫線顏色後, 畫七邊形框線
ctx.strokeStyle = "rgb(0,200,20)"
star(50, 450, 200, 7)
ctx:closePath()
ctx:stroke()
    ]]
end

function hello()
    return [[
for i = 1, 5 do
    print(i, ": hello world")
end
    ]]
end

function oop1()
    return [[
local myobj = {}
myobj.__index = myobj

function myobj.new(x)
    local self = setmetatable({}, myobj)
    self.x = x
    return self
end
    
function myobj.method1(self, toprint)
    self.toprint = toprint or self.x
    return self.toprint
end

obj1 = myobj.new("這是內定字串")
print(obj1:method1())
print(obj1:method1("這是 Lua 的物件導向應用!"))

-- 重新定義 myobj 的 method1
function myobj.method1(self, toprint)
    self.toprint = "已經重新定義 method1"
    return self.toprint
end

print(obj1:method1())
    ]]
end

function guess1()
    return [[
-- 導入 js 模組
js = require("js")
-- 取得 window
window = js.global
-- 猜小於或等於 n 的整數
big = 100
-- 計算猜測次數, 配合 while 至少會猜一次
num = 1
-- 利用 window:prompt 方法回應取得使用者所猜的整數
guess = window:prompt("請猜一個介於 1 到 "..big.." 的整數")
-- 利用數學模組的 random 函數以亂數產生答案
answer = math.random(big)
output = ""
-- 若沒猜對, 一直猜到對為止
while answer ~= tonumber(guess) do
    if answer > tonumber(guess) then
        output = "猜第 "..num.." 次, guess="..guess..", answer="..answer.." - too small"
        print(output)
    else
        output = "猜第 "..num.." 次, guess="..guess..", answer="..answer.." - too big"
        print(output)
    end 
    guess = window:prompt(output..", 請猜一個介於 1 到 "..big.." 的整數")
    num = num + 1
end
print("總共猜了 "..num.." 次, answer=guess="..answer.." - correct")
    ]]
end

function guess2()
    return [[
-- 利用電腦亂數玩猜數字遊戲
-- 導入 js 模組
js = require("js")
-- 取得 window
window = js.global
execnum = 100
guessnum = 0
playnum = 0
-- 猜小於或等於 n 的整數
for i = 1, execnum do
    small = 1
    big = 100
    -- 計算猜測次數, 配合 while 至少會猜一次
    num = 1
    -- 利用 window:prompt 方法回應取得使用者所猜的整數
    pcguess = math.random(small, big)
    -- guess = window:prompt("請猜一個介於 "..small.." 到 "..big.." 的整數")
    -- 利用數學模組的 random 函數以亂數產生答案
    answer = math.random(small, big)
    output = ""
    playnum = playnum + 1
    print("")
    print("------第 "..playnum.." 次執行")
    print("")
    -- 若沒猜對, 一直猜到對為止
    while answer ~= tonumber(pcguess) do
        if answer > tonumber(pcguess) then
            small = pcguess + 1
            output = "猜第 "..num.." 次, guess="..pcguess..", answer="..answer.." - too small"
            print(output)
        else
            big = pcguess - 1
            output = "猜第 "..num.." 次, guess="..pcguess..", answer="..answer.." - too big"
            print(output)
        end 
        --guess = window:prompt(output..", 請猜一個介於 "..small.." 到 "..big.." 的整數")
        pcguess = math.random(small, big)
        num = num + 1
    end
    print("總共猜了 "..num.." 次, answer=guess="..answer.." - correct")
    guessnum = guessnum + num
end
averagenum = math.floor(guessnum/execnum)
print("----------")
print("平均猜對次數: "..averagenum)
    ]]
end

function scope1()
    return [[
-- var here is global variable
var = 1
for i = 1, 3 do
-- var here is local variable in for loop
    local var = 2
    -- here print the local var value
    print(var)
end
-- here print the global var value
print(var)
    ]]
end

function function1()
    return [[
function myfun(n)
    for i = 1, n do
        print(i)
    end
end

myfun(5)
    ]]
end

function cango1()
    return [[
-- 導入 "js" 模組
local js = require "js"
-- global 就是 javascript 的 window
local window = js.global
local Array = js.global.Array

-- 將 lua table 轉為 new JavaScript Object 的方法
-- e.g. Object{mykey="myvalue"}
local function Object(t)
    local o = js.new(js.global.Object)
    for k, v in pairs(t) do
        assert(type(k) == "string" or js.typeof(k) == "symbol", "JavaScript only has string and symbol keys")
        o[k] = v
    end
    return o
end

-- javascript constructor
local canvas = js.new(window.Cango, "canvas")
local path = js.new(window.Path)
local shape = js.new(window.Shape)
-- Javascript 變數
shapedefs = window.shapeDefs
-- 角度轉為徑度
deg = math.pi/180
canvas:clearCanvas()

canvas:gridboxPadding(10, 10, 5, 7)
canvas:fillGridbox("lightgreen")
canvas:setWorldCoordsRHC(0, 0, 80)
-- 利用自定義的 Object 函式, 將 Lua Table 轉為 Javascript 物件
canvas:drawText("gc.setWorldCoordsRHC() 設為 Y 向上為正", Object{x=2, y=52, fontSize=23, fillColor="black"})
-- Lua 的 Table 轉為 Javascript Array (在 Python 為數列) 的方法
t = {"M",0,0, "L", 35*math.cos(30*deg), 35*math.sin(30*deg), 0, 0}
-- one way to convert t table to javascript array
--t_js_array = js.global:Array(table.unpack(t))
-- better way
t_js_array = js.global:Array()
t_js_array:splice(0, 0, table.unpack(t))
canvas:drawPath(t_js_array)
    ]]
end

function star1()
    return [[
-- 導入 "js" 模組
local js = require "js"
-- global 就是 javascript 的 window
local global = js.global
local document = global.document
-- html 檔案中 canvas　id 設為 "canvas"
-- 準備繪圖畫布
local canvas = document:getElementById("canvas")
-- 將 ctx 設為 canvas 2d 繪圖畫布變數
ctx = canvas:getContext("2d")


-- 準備在 canvas 中繪圖
function draw_line(x1, y1, x2, y2, color)
    color = color or "red"
    ctx:beginPath()
    ctx:moveTo(x1, y1)
    ctx:lineTo(x2, y2)
    ctx.strokeStyle = color
    ctx:stroke()
end

-- x, y 為中心,  r 為半徑, angle 旋轉角,  solid 空心或實心,  color 顏色
function star(x, y, r, angle, solid, color)
    angle = angle or 0
    solid = solid or false
    color = color or "#f00"
    -- 以 x, y 為圓心, 計算五個外點
    local deg = math.pi/180
    -- 圓心到水平線距離
    local a = r*math.cos(72*deg)
    -- a 頂點向右到內點距離
    local b = (r*math.cos(72*deg)/math.cos(36*deg))*math.sin(36*deg)
    -- 利用畢氏定理求內點半徑
    rin = math.sqrt(a*a + b*b)
    -- 查驗 a, b 與 rin
    --print(a, b, rin)
    if (solid) then
        ctx:beginPath()
    end
    for i = 0, 4 do
        xout = (x + r*math.sin((360/5)*deg*i+angle*deg))
        yout = (y + r*math.cos((360/5)*deg*i+angle*deg))
        -- 外點增量 + 1
        xout2 = x + r*math.sin((360/5)*deg*(i+1)+angle*deg)
        yout2 = y + r*math.cos((360/5)*deg*(i+1)+angle*deg)
        xin = x + rin*math.sin((360/5)*deg*i+36*deg+angle*deg)
        yin = y + rin*math.cos((360/5)*deg*i+36*deg+angle*deg)
        -- 查驗外點與內點座標
        --print(xout, yout, xin, yin)
        if (solid) then
            -- 填色
            if (i==0) then
                ctx:moveTo(xout, yout)
                ctx:lineTo(xin, yin)
                ctx:lineTo(xout2, yout2)
            else
                ctx:lineTo(xin, yin)
                ctx:lineTo(xout2, yout2)
            end
        else
            -- 空心
            draw_line(xout, yout, xin, yin, color)
            -- 畫空心五芒星, 無關畫線次序, 若實心則與畫線次序有關
            draw_line(xout2, yout2, xin, yin, color)
        end
    end
    
    if (solid) then
        ctx.fillStyle = color
        ctx:fill()
    end
end

star(100, 100, 30, 0, true, "#f00")
--star(300, 300, 50, 0, false, "#000")
for i = 0, 4 do
    for j = 0, 4 do
        star(200+65*i, 200+65*j, 30, 0, false, "#000")
    end
end
    ]]
end

function flag()
    return [[
-- 導入 "js" 模組
local js = require "js"
-- global 就是 javascript 的 window
local global = js.global
local document = global.document
-- html 檔案中 canvas　id 設為 "canvas"
-- 準備繪圖畫布
local canvas = document:getElementById("canvas")
-- 將 ctx 設為 canvas 2d 繪圖畫布變數
local ctx = canvas:getContext("2d")

-- 以下採用 canvas 原始座標繪圖
flag_w = 600
flag_h = 400
circle_x = flag_w/4
circle_y = flag_h/4

-- 先畫滿地紅
ctx.fillStyle='rgb(255, 0, 0)'
ctx:fillRect(0, 0, flag_w, flag_h)

-- 再畫青天
ctx.fillStyle='rgb(0, 0, 150)'
ctx:fillRect(0, 0, flag_w/2, flag_h/2)

-- 畫十二道光芒白日
ctx:beginPath()
    star_radius = flag_w/8
    angle = 0
    for i = 0, 23 do
        angle = angle + 5*math.pi*2/12
        toX = circle_x + math.cos(angle)*star_radius
        toY = circle_y + math.sin(angle)*star_radius
        -- 只有 i 為 0 時移動到 toX, toY, 其餘都進行 lineTo
        if (i) then
            ctx:lineTo(toX, toY)
        else
            ctx:moveTo(toX, toY)
        end
    end
ctx:closePath()

-- 將填色設為白色
ctx.fillStyle = '#fff'
ctx:fill()

-- 白日:藍圈
ctx:beginPath()
    ctx:arc(circle_x, circle_y, flag_w*17/240, 0, math.pi*2, True)
ctx:closePath()

-- 填色設為藍色
ctx.fillStyle = 'rgb(0, 0, 149)'
ctx:fill()

-- 白日:白心
ctx:beginPath()
    ctx:arc(circle_x, circle_y, flag_w/16, 0, math.pi*2, True)
ctx:closePath()
-- 填色設為白色
ctx.fillStyle = '#fff'
ctx:fill()
    ]]
end

function ga_onemax()
    return [[
--
-- A simple genetic algorithm for function optimization, in lua
-- Copyright (c) 2009 Jason Brownlee
--
-- It uses a binary string representation, tournament selection, 
-- one-point crossover, and point mutations. The test problem is 
-- called one max (a string of all ones)
--

-- configuration
problemSize = 64
mutationRate = 0.005
crossoverRate = 0.98
populationSize = 64
maxGenerations = 50
selectionTournamentSize = 3
seed = os.time()

function crossover(a, b) 
	if math.random() > crossoverRate then
		return ""..a
	end
	local cut = math.random(a:len()-1)
	local s = ""
	for i=1, cut do
		s = s..a:sub(i,i)
	end
	for i=cut+1, b:len() do
		s = s..b:sub(i,i)
	end		
	return s
end

function mutation(bitstring)
	local s = ""
	for i=1, bitstring:len() do
		local c = bitstring:sub(i,i)
		if math.random() < mutationRate then		 
			if c == "0" 
			then s = s.."1"
			else s = s.."0" end
		else s = s..c end
	end
	return s
end

function selection(population, fitnesses)
	local pop = {}
	repeat
		local bestString = nil
		local bestFitness = 0
		for i=1, selectionTournamentSize do
			local selection = math.random(#fitnesses)
			if fitnesses[selection] > bestFitness then
				bestFitness = fitnesses[selection]
				bestString = population[selection]
			end
		end
		table.insert(pop, bestString)
	until #pop == #population
	return pop
end

function reproduce(selected)
	local pop = {}
	for i, p1 in ipairs(selected) do
		local p2 = nil
		if (i%2)==0 then p2=selected[i-1] else p2=selected[i+1] end
		child = crossover(p1, p2)
		mutantChild = mutation(child)
		table.insert(pop, mutantChild);
	end
	return pop
end

function fitness(bitstring)
	local cost = 0
	for i=1, bitstring:len() do
		local c = bitstring:sub(i,i)
		if(c == "1") then cost = cost + 1 end
	end
	return cost
end

function random_bitstring(length)
	local s = ""
	while s:len() < length do
		if math.random() < 0.5
		then s = s.."0"
		else s = s.."1" end
	end 
	return s
end

function getBest(currentBest, population, fitnesses) 	
	local bestScore = currentBest==nil and 0 or fitness(currentBest)
	local best = currentBest
	for i,f in ipairs(fitnesses) do
		if(f > bestScore) then
			bestScore = f
			best = population[i]
		end
	end
	return best
end

function evolve()
	local population = {}
	local bestString = nil
	-- initialize the popuation random pool
	for i=1, populationSize do
		table.insert(population, random_bitstring(problemSize))
	end
	-- optimize the population (fixed duration)
	for i=1, maxGenerations do
		-- evaluate
		fitnesses = {}
		for i,v in ipairs(population) do
			table.insert(fitnesses, fitness(v))
		end
		-- update best
		bestString = getBest(bestString, population, fitnesses)
		-- select
		tmpPop = selection(population, fitnesses)		
		-- reproduce
		population = reproduce(tmpPop)
		print(">gen", i, "best cost=", fitness(bestString), bestString, "\n")
	end	
	return bestString
end

-- run
print("Genetic Algorithm on OneMax, with ", _VERSION, "\n")
best = evolve()
print("Finished!\nBest solution found had the fitness of", fitness(best),  best, "\n")
    ]]
end

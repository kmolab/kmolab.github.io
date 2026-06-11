-- 導入 "js" 模組
local js = require "js"
-- global 就是 javascript 的 window
local global = js.global
local document = global.document
-- html 檔案中 canvas　id 設為 "canvas"
local canvas = document:getElementById("canvas")
-- 將 ctx 設為 canvas 2d 繪圖畫布變數
local ctx = canvas:getContext("2d")

ctx:beginPath()
ctx:moveTo(170, 80)
ctx:bezierCurveTo(130, 100, 190, 150, 230, 150)
ctx:bezierCurveTo(250, 180, 320, 180, 340, 150)
ctx:bezierCurveTo(420, 150, 420, 120, 390, 100)
ctx:bezierCurveTo(430, 40, 370, 30, 340, 50)
ctx:bezierCurveTo(320, 5, 250, 20, 250, 50)
ctx:bezierCurveTo(200, 5, 150, 20, 170, 80)

ctx:closePath()
ctx.lineWidth = 5
ctx.fillStyle = '#8ED6FF'
ctx:fill()
ctx.strokeStyle = 'blue'
ctx:stroke()

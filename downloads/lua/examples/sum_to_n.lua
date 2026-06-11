local js = require "js"
local window = js.global
local n = window:prompt("請輸入由 1 累加到 n 的 n 數值!")

sum = 0

for i=1, n do
    sum = sum + i
end
print(sum)

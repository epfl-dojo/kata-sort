MACHINE=os.getenv('MACHINE')
LANGUAGE="lua"

json = require('json')


local f = assert(io.open("generated_data.json", "rb"))
local content = f:read("*all")
f:close()
local data = json.decode(content)

function array_copy(a)
  local b={}
  for k, v in pairs(a) do
    b[k] = v
  end
  return b
end

function bubble_sort(a)
  for i=#a, 2, -1 do
    local sorted = true
    for j=1, (i-1), 1 do
      if a[j+1] < a[j] then
        a[j+1],a[j] = a[j],a[j+1]
        sorted = false
      end
    end
    if sorted then
      break
    end
  end
end

function partition(a, first, last, pivot)
  a[pivot],a[last] = a[last],a[pivot]
  j = first
  for i=first, last-1, 1 do
    if a[i] <= a[last] then
      a[i], a[j] = a[j], a[i]
      j = j + 1
    end
  end
  a[last], a[j] = a[j], a[last]
  return j
end

function quick_sort(a)
  local first = 1
  local last = #a
  stack = {}
  table.insert(stack, first)
  table.insert(stack, last)
  while #stack>0 do
    last = table.remove(stack, #stack)
    first = table.remove(stack, #stack)
    if first < last then
      pivot = last
      pivot = partition(a, first, last, pivot)
      table.insert(stack, first)
      table.insert(stack, pivot-1)
      table.insert(stack, pivot+1)
      table.insert(stack, last)
    end
  end
end

-- ----------------------------------------------  main
local my_bench_data={}
local algos={bubble = bubble_sort, quick = quick_sort}
for algo, sorter in pairs(algos) do
  for n, data_n in pairs(data) do
    local a=array_copy(data_n["random"])
    local b=array_copy(data_n["reverse"])
    local c=array_copy(data_n["nearly"])
    t0=os.clock()
    sorter(a)
    sorter(b)
    sorter(c)
    dt=os.clock() - t0
    print(string.format("%-8s %-14s %6d %8.3f", LANGUAGE, algo.." sort", n, dt))
    table.insert(my_bench_data, {machine=MACHINE, language=LANGUAGE, algo=algo, n=n, t=dt})
  end
end

local f = assert(io.open("bench_data.json", "rb"))
local content = f:read("*all")
f:close()
local bench_data = json.decode(content)

for _,v in ipairs(my_bench_data) do 
    table.insert(bench_data, v)
end

local f = assert(io.open("bench_data.json", "w+"))
f:write(json.encode(bench_data))
f:close()









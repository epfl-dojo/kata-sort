require "json"
input_data = File.read "generated_data.json"

# time the execution of a block of code
def time_this(title=nil)
  beg_time = Time.now
  yield
  dt = Time.now - beg_time
  puts "#{title}: #{dt}" unless title.nil?

  dt
end

# --------------------------------------------------------- bubble sort
def bubble_sort(a)
  for i in (a.size-1).downto(1)
    sorted = true
    for j in 0..(i-1)
      if a[j+1] < a[j]
        a[j+1],a[j] = a[j],a[j+1]
        sorted = false
      end
    end
    if sorted
      break
    end
  end
  a
end


# --------------------------------------------------------- quick sort
def partition(a, first, last, pivot)
  a[pivot],a[last] = a[last],a[pivot]
  j = first
  for i in first.upto(last-1)
    if a[i] <= a[last]
      a[i], a[j] = a[j], a[i]
      j = j + 1
    end
  end
  a[last], a[j] = a[j], a[last]
  j
end

def recursive_quick_sort(a, first=0, last=nil)
  last = a.size - 1 if last.nil?
  if first < last
    pivot = last
    pivot = partition(a, first, last, pivot)
    quick_sort(a, first, pivot-1)
    quick_sort(a, pivot+1, last)
  end
  a
end

def quick_sort(a, first=0, last=nil)
  last = a.size - 1 if last.nil?
  stack = []
  stack << [first, last]
  while c = stack.pop
    first, last = c
    if first < last
      pivot = last
      pivot = partition( a, first, last, pivot)
      stack << [first, pivot-1]
      stack << [pivot+1, last]
    end
  end
end

# ---------------------------------------------------------------------------------
my_bench_data = {}
for algo in ["bubble", "quick"]
  my_bench_data[algo]={}
  data = JSON.parse(input_data)
  data.each do |n, ndata|
    a = ndata["random"]
    b = ndata["reverse"]
    c = ndata["nearly"]
    dt=time_this("#{algo} sort #{n}") do
      self.send("#{algo}_sort", a)
      self.send("#{algo}_sort", b)
      self.send("#{algo}_sort", c)
    end
    my_bench_data[algo][n]=dt  
  end
end
bench_data = JSON.parse(File.read "bench_data.json")
bench_data ["computer"]=my_bench_data
File.open("bench_data.json", "w+") {|f| JSON.dump(bench_data, f)}

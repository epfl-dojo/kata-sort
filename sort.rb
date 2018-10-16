LANGUAGE="ruby"
MACHINE=ENV["MACHINE"] || "Unknown";

require "json"
input_data = File.read "generated_data.json"

# time the execution of a block of code
def time_this(title=nil)
  beg_time = Time.now
  yield
  Time.now - beg_time
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

def quick_sort(a)
  first = 0
  last = a.size - 1
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
my_bench_data = []
for algo in ["bubble", "quick"]
  data = JSON.parse(input_data)
  data.each do |n, ndata|
    a = ndata["random"]
    b = ndata["reverse"]
    c = ndata["nearly"]
    dt=time_this() do
      self.send("#{algo}_sort", a)
      self.send("#{algo}_sort", b)
      self.send("#{algo}_sort", c)
    end
    puts "%-8s %-14s %6d %8.3f" % [LANGUAGE, "#{algo} sort", n, dt]
    my_bench_data << {"machine" => MACHINE, "language" => LANGUAGE, "algo" => algo, "n" => n, "t" => dt}
  end
end
bench_data = JSON.parse(File.read "bench_data.json")
bench_data = bench_data + my_bench_data
File.open("bench_data.json", "w+") {|f| JSON.dump(bench_data, f)}

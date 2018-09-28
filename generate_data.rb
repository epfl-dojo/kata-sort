require 'json'

# return an array of the integers between 1+ofs and n+ofs
def data_sorted(n, ofs=0)
  ((1+ofs)..(n+ofs)).to_a
end

# return an array of the integers between 1+ofs and n+ofs in reverse order
def data_reverse(n, ofs=0)
  ((1+ofs)..(n+ofs)).to_a.reverse
end

# return an array of the integers between 1+ofs and n+ofs in random order
def data_random(n, ofs=0)
  ((1+ofs)..(n+ofs)).to_a.shuffle
end

# return an array of size n where blocks of size bs are independently shuffled
def data_nearly(n, bs, ofs=0)
  a = []
  for i in 0..n/bs-1
    m = [bs, n-a.size].min
    a += data_random(m, i*bs+ofs)
  end
  a
end

data={}
for n in [100, 1000, 10000] do 
  data["random_#{n}"] = data_random(n)
  data["reverse_#{n}"] = data_reverse(n)
  data["nearly_#{n}"] = data_nearly(n, 100)
end
File.open("generated_data.json", "w+") {|f| JSON.dump(data, f)}

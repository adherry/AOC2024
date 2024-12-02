inputfile = "input1.txt"

arr_left = []
arr_right = []

f = File.read(inputfile)
f.each_line do |line|
 tokens = line.split(" ")
 arr_left << Integer(tokens[0])
 arr_right << Integer(tokens[-1])
end
arr_left.sort!
arr_right.sort!
distance = 0
sum_similarity = 0
arr_left.each do |element|
  sum_similarity += arr_right.select{|e| e == element}.count * element
end

while !arr_left.empty? do
 distance += (arr_left.shift - arr_right.shift).abs
end
puts distance
puts sum_similarity

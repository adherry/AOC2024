inputfile = "input3.txt"
sum_mul = 0
f = File.read(inputfile)
input = f.gsub("\n","")

def mul_inputs(mulstring)
  valid_input_regex = /mul\(\d{1,3},\d{1,3}\)/
  sum_mul = 0
  valid_muls = mulstring.scan(valid_input_regex)

  valid_muls.each do |operation|
    numbers = operation.scan(/\d+/)
    result = numbers[0].to_i * numbers[1].to_i
    sum_mul += result
  end
  sum_mul
end

#part1
result_one = mul_inputs(input)
puts "Untrimmed result #{result_one}"
#do/dont splitter
trimmed_input = input.split("do")
trimmed_input.reject!{|i| i.start_with?("n't()")}
result_two = mul_inputs(trimmed_input.join(""))
puts "Trimmed Result #{result_two}"



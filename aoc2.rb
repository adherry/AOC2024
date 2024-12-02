inputfile = "input2.txt"
measurements = []
valid_lines = 0
f = File.read(inputfile)
f.each_line do |line|
  values = line.split(" ")
  measurements.push(values.map{|e| e.to_i})
end

def within_tolerance?(line)
  line.each_with_index do |value, index|
    next if index == 0
    difference = (value - line[index-1]).abs
    if difference > 3 || difference == 0
      return false
    end
  end
  return true
end

def is_sorted?(line)
  if ((line == line.sort) || (line.reverse == line.sort))
    true
  else
    false
end
end

def is_safe?(line)
  is_sorted?(line) && within_tolerance?(line)
end

measurements.each do |measurement|
  if is_safe?(measurement)
    valid_lines += 1
  else
    measurement.combination(measurement.length - 1).each do |permutation|
      if is_safe?(permutation)
        valid_lines += 1
      break
      end
    end
  end
end
puts valid_lines

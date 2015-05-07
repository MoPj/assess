require "ap"
instructor = { name: 'Steven', age: 27 }
instructor[:location] = 'NYC'
instructor[:empty_array] = [{ name: 'Steven', age: 27 }]
ap instructor
#puts "instructuctor: #{instructor[name:]}"

puts instructor.map{|k,v| k if v.is_a? Array[0]}
keys = instructor.map{|k,v| k if v.is_a? Array}.compact
puts "keys = #{keys}"
puts "instructor: #{instructor}"
puts instructor
instructor[:name]
instructor.key(27)
puts
# another way to inspect the instructor hash
ap instructor
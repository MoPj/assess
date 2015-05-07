details = {uid: "12345", 
			info: [
				{
				name: "Maureen", 
				nickname: " Mo"
				},
				{
				name: "Billy", 
				nickname: " Bill"
				}
			]

name = details[:info] && details[:info][:name](1)
nickname = details[:info] && details[:info][:nickname][1]

puts "name  = #{name}"
puts "nickname = #{nickname}"

puts "refactor code 1st try"
def my_method @blah == foo? :foo_matches : :no_match
end


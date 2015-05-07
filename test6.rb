# Maureen Johnston Flatiron School Assesment


###################################
# 3. Nested Structures
###################################
school = {
  :name => 'Happy Funtime School',
  :location => 'NYC',
  :instructors => [
    {:name=>'Blake', :subject=>'being awesome' },
    {:name=>'Steven', :subject=>'being better than blake'},
    {:name=>'Jeff', :subject=>'karaoke'}
  ],
  :students => [
    {:name => 'Marissa', :grade => 'B'},
    {:name=>'Billy', :grade => 'F'},
    {:name => 'Frank', :grade => 'A'},
    {:name => 'Sophie', :grade => 'C'}
  ]
}

    school[:students].each { |student| student[:semester] = "Summer" }
  puts school[:students][0]
  puts
  puts
# e. Change Steven's subject to 'being almost better than Blake'
  school[:instructors].each { |instructor| instructor[:subject] = "being almost better than Blake" if instructor[:name] == "Steven" }
  puts school[:instructors]
puts
# f. Change Frank's grade from 'A' to 'F'.

  school[:students].each { |student| student[:grade] = "F" if student[:name] == "Frank" }
  puts school[:students]
puts "after students"
  puts
  school[:students].each { |student| puts student[:name] if student[:grade] == "B" }

  puts
  puts school[:students][0][:grade] 
  puts
  puts
 #       def add_new_student(school, new_student)
 #       school[:students] << {:name => new_student, :grade => 'A'}
 #     end
 #     add_new_student(school, "Amanda")
#puts school[:students].keep_if { |student| student[:grade] == "B" } [0][#:name] 
#puts "students"
# puts school[:students]
      school[:students].delete_if { |student| student[:name] == "Billy" }
     puts "asdfasdf"     
  puts school[:students][1]
    puts "asdfasdf"
  
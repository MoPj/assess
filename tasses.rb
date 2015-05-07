# Maureen Johnston Flatiron School Assesment

###################################
# 1. Arrays
###################################
array = ['Blake', 'Steven', 'Jeff']
# a. Add an element to an array
array<<'added element'
# b. Write a statment to print out all the elements of the erray.
array.each { |x| puts x } 
# c. Return the value at index 1
array.values_at(1)
# d. Return the index for the value 'Jeff'.
array.index('Jeff')
###################################
# 2. Hashes
###################################
instructor = { name: 'Steven', age: 27 }
# a. Add a new key for location and give it the value 'NYC'
instructor[:location] = 'NYC'
# b. Write a statement to print out all the key/value pairs in the hash
instructor.each { |key, value| puts "key: #{key} value: #{value}" }
# c. Return the name value for the hash.
puts instructor[:name]
# d. Return the key one for the value 27.
instructor.key(27)
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


# a. Add a key to the school hash called 'founded_in' and set it to the value 2013.
school[:founded_in] = 2013

#  b. Add a student to the school's students' array.
school[:students] << {:name => 'Maureen', :grade => 'A'}

# c. Remove 'Billy' from the students' array.

school[:students].delete_at(1)
#or ... put it back in and find it first then delete
school[:students] << {:name=>'Billy', :grade => 'F'}
i = school[:students].index({:name=>'Billy', :grade => 'F'})
school[:students].delete_at(i)

# d. Add a key to every student in the students array called 'semester' and assign it the value 'Summer'.
school[:students].each do |student|
  student[:semester] = "Summer"
end

# e. Change Steven's subject to 'being almost better than Blake'
# find it first then update it (assuming names are unique)
school[:instructors].each do |instructor|
  if instructor[:name] == "Steven"
    instructor[:subject] = "being almost better than Blake"
  end
 end

# f. Change Frank's grade from 'A' to 'F'.
i = school[:students].index({:name=>'Frank', :grade => 'A', :semester => "Summer"})
school[:students][i][:grade] = 'F'
puts school[:instructors]

# g. Return the name of the student with a 'B'.  This picks up the first student with a B found
#    if you want to pick up all of the students with a B in the array you should fill each one 
#    found into a new array and return that array 
def student school, grade
  school[:students].each do |student|
  if student[:grade] == grade
    return student[:name]
  end
 end
end
student school, "B"
 # h. Return the subject of the instructor 'Jeff'.   

 def instructors school, name
  school[:instructors].each do |instructor|
    if instructor[:name] == name
      return instructor[:subject]
    end
  end
end
instructors school, 'Jeff'

# i. Write a statement to print out all the values in the school.
puts school
# or below or just require ap and ap school
puts "school values:"
school.each do |key, value|
  if value.kind_of?(Array)
    puts "   #{key}:"
    value.each do |value|
      puts "      #{value} "

    end
  else
    puts "   #{key}: #{value}"
  end
end

##########################
# 4. Methods
##########################
# a.  i. Create a method to return the grade of a student, given that student's name   
def student_grade(school, name)
  school[:students].each { |student| 
  	return student[:grade] if student[:name] == name }
end
student_grade(school, "Sophie")
# a.  ii. Then use it to refactor your work in 3.i.
def get_update_student_grade(school, name, grade)
  school[:students].each do |student| 
  	if student[:name] == name
  		if grade != nil 
  			return student[:grade]
  		else
  			student[:grade] = grade
  		end
	end
end
end
get_update_student_grade(school, "Sophie", nil)
get_update_student_grade(school, "Frank", "F")
# b.   i. Create a method to udpate a instructor's subject given the instructor and the new subject.   
def instructor_subject(school, name, subject)
  school[:instructors].each {|instructor| 
  	instructor[:subject] = subject if instructor[:name] == name }
 end
# b.   ii. Then use it to update Blake's subject to 'being terrible'.
instructor_subject(school, "Blake", "being terrible")
puts school[instructor]

# c.  i. Create a method to add a new student to the schools student array.   
def new_student(school, new_student)
  school[:students] << new_student
end
# c.  ii. Then use it to add yourself to the school students array.
puts new_student(school, {:name => 'Maureen', :grade => 'A', :semester => "Summer"})
# d.  i. Create a method that adds a new key at the top level of the school hash, 
#    given a key and a value.   
def new_rank(school, rank, value)
  school[:rank] = value
end
# d. ii. Then use it to add a 'Ranking' key with the value 1.
puts new_rank(school, "rank", 1)
##########################
# 5. Object Orientation
##########################
#  a. Create a bare bones class definition for a School Class
#  b. Define an initialize method for the School class.  
# 		i.   Give your School class the instance variables: name, location,
# 			 ranking, students, instructors.  The varialbes should be of same type
# 			 as the hash above
# 		ii.  Rewrite your initialize method definition to take a parameter for each instance variable 
# 		iii. Initialize each instance variable with the value of the crresponding parameter.
#  c. Create a method to set ranking, given a ranking value.
#  f. Create a method to remove a student from the school, given a name.
#  g. Create an array constant SCHOOLS that stores all instances of your School class
#  h. Create a class method reset that will empty the SCHOOLS constant.
class School
attr_accessor :name, :location, :instructors, :students
attr_reader :ranking
  @@SCHOOLS = []
  def initialize(name, location, ranking, students, instructors)
    @name = name
    @location = location  
    @ranking = ranking
    @students = students
    @instructors = instructors
    @@SCHOOLS << self
  end

  def reset
    @@SCHOOLS.clear
  end
  def set_ranking rank
    @ranking = rank
  end
  def add_student student_passed
    @students.each do |student|
      if student.name == student_passed.name && 
        student.grade == student_passed.grade && 
        student.semester == student_passed.semester
        student.show
        p "already exits please choose a unique name"
        return
      end
    end
         @students << student_passed
   end
# since you've added semester to some of the hash values you have to
#  first find the matching name and get its array index within students
#  I wanted to have a general find so the method could be used for other functions
 #def find_student name
 #   @students.each {|student| :name == name ? return student
 # end
# giving only a name assumes the value of name is a unique variable within the hash array
#   so I changed the add student to be sure each student name added is unique much more to 
#   be done and thought out, like unique student id's...
  def delete_student name
    i = 0
    save_index = nil
    @students.each do |student| 
      save_index = i if student.name == name
      i +=1
    end
    i -= 1
    if i < @students.length
      @students.slice!(save_index)
    else
      puts "Could not find student to delete"
    end
  end
end
class Student
  attr_accessor :name, :grade, :semester
  def initialize(name, grade, semester)
    @name = name
    @grade = grade  
    @semester = semester
  end
  	def to_s
		"Student:#{@name}"
	end
	def show
		p "'#{self}'"
	end
end
my_school = School.new(
  'Happy Funtime School',
  'NYC',
  3,
  students = [
    Student.new('Marissa', 'B', nil),
    Student.new('Billy', 'F', nil),
    Student.new('Frank', 'A', nil),
    Student.new('Sophie', 'C', nil)
  ],
  instructors = [
    {:name=>'Blake', :subject=>'being awesome' },
    {:name=>'Steven', :subject=>'being better than blake'},
    {:name=>'Jeff', :subject=>'karaoke'}
  ]
  )

my_school.set_ranking 4
my_school.add_student Student.new("Mo", "A", "Summer")
my_school.add_student Student.new("Billy", "F", nil)

my_school.delete_student "Mo"
#  Create a class method reset that will empty the SCHOOLS constant.
my_school.reset


# 6. Classes

# 7. Self
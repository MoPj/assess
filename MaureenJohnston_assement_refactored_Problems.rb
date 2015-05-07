# Maureen Johnston Flatiron School Assesment
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
  def self.all_schools
    @@SCHOOLS
  end
  def reset
    SCHOOLS.clear
  end
  def set_ranking rank
    @ranking = rank
  end
  def add_student name, grade, semester
    puts "adding student"
      @students.each do |student|
      if student[:name] == name && student[:grade] == grade && student[:semester] == semester
        puts "The student #{name}, ' ' #{grade}, ' ' #{semester} already exits please choose a unique name"
        return
      end
    end
         @students << {:name => name, :grade => grade, :semester => semester}
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
    @students.each do |student| 
      if :name == name
      i = @students.index({:name=>name, :grade=>grade, :semester=>semester})
      @students.delete_at(i)
      end
    end
  end
end

my_school = School.new(
  'Happy Funtime School',
  'NYC',
  3,
  students = [
    {:name => 'Marissa', :grade => 'B'},
    {:name=>'Billy', :grade => 'F'},
    {:name => 'Frank', :grade => 'A'},
    {:name => 'Sophie', :grade => 'C'}
  ],
  instructors = [
    {:name=>'Blake', :subject=>'being awesome' },
    {:name=>'Steven', :subject=>'being better than blake'},
    {:name=>'Jeff', :subject=>'karaoke'}
  ]
  )
answers = {}

PROBLEMS.each do |problem|
  answers[problem.name] = problem.answer
end

display_problems = Hash[
  PROBLEMS.map do |problem|
    answer = answers[problem.name]
    [problem.name, problem.display_answer(answer)]
  end
]

p display_problems
ap School.all_schools
my_school.set_ranking 4
my_school.add_student "Mo", "A", "Summer"
my_school.add_student "Billy", "F", nil
ap my_school.students
puts my_school.students
puts 
my_school.delete_student "Mo"

puts my_school.students
#  Create a class method reset that will empty the SCHOOLS constant.
SCHOOL
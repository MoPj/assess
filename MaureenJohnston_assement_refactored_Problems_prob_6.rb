# Maureen Johnston Flatiron School Assesment
require 'ap'
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
  def add_student student_passed
    puts "adding student"
    @students.each do |student|
      if student.name == student_passed.name && 
         student.grade == student_passed.grade && 
         student.semester == student_passed.semester
        puts "The student #{student_passed}, already exits please choose a unique name"
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
    i = nil
    @students.each do |student| 
      if student.name == name
        i = @students.index
      end
    end
    puts i
    if i != nil 
      @students.delete_at(i)
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

ap School.all_schools
my_school.set_ranking 4
my_school.add_student Student.new("Mo", "A", "Summer")
my_school.add_student Student.new("Billy", "F", nil)
ap School.all_schools
my_school.delete_student "Mo"

puts my_school.students
#  Create a class method reset that will empty the SCHOOLS constant.
SCHOOL.empty
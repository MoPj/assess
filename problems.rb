require_relative 'MaureenJohnston_assement_refactored_Problems_prob_6.rb'
require 'ap'
# I plan on refactoring this code so the problems can be
#  run with input to change the outcome of each problem but 
#  I have not gotten to it yet 11/17/2014
# Maureen Johnston Flatiron School Assesment
class Problem
  attr_reader :name

  def initialize(name, prompt, choices = nil, display_proc = nil)
    @name = name
    @prompt = prompt
    @choices = choices
    @display_proc = display_proc
  end

  def answer
    if @run_proc
      required_criteria_answer
    else
      simple_answer
    end
  end

  def required_criteria_answer
    answer = nil
    until @choices.include?(answer)
      print @prompt, " "
      answer = gets.chomp
      puts "You must pick an answer from #{@choices}" unless @choices.include?(answer)
    end
    answer
  end

  def simple_answer
    print @prompt, " "
    gets.chomp
  end

end

PROBLEMS = [
  Problem.new(:problem_5_d,
               "Please enter a ranking value for the school"),
  Problem.new(:problem_5_e,
               "Please enter student name, grade and semester to add to the school"),
  Problem.new(:problem_5_f,
               "Please enter student name to remove from the school"),
  Problem.new(:problem_5_g,
               "Please enter 'Y' to reset and clear out all schools")
  ]
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

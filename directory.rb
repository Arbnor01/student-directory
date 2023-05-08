students = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort:  :november},
  {name: "Nurse Ratched", cohort:  :november},
  {name: "Michael Corleone", cohort:  :november},
  {name: "Alex DeLarge", cohort:  :november},
  {name: "The Wicked Witch of the West", cohort:  :november},
  {name: "Terminator", cohort:  :november},
  {name: "Freddy Krueger", cohort:  :november},
  {name: "The Joker", cohort:  :november},
  {name: "Joffrey Baratheon", cohort:  :november},
  {name: "Norman Bates", cohort:  :november}
]

def input_students
  puts "Please enter the name of the students"
  puts "To finish, just hit return twice"
  
  students = []
  
  input = gets.delete_suffix("\n")
  while !input.empty? do

    name, cohort = input.split(',')
    name = name.strip
    cohort = cohort ? cohort.strip.to_sym : :november
     
    students << {name: name, cohort: :november}
    puts "now we have #{students.count} students"
    
    input = gets.delete_suffix("\n")
  end
  
  students
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50)
end

def print(students)
  cohorts = students.map { |student| student[:cohort] }.uniq
  
  cohorts.each do |cohort|
    puts "#{cohort} cohort:".center(50)
    students.each_with_index do |student, index|
      if student[:cohort] == cohort
        puts "#{index+1}. #{student[:name]}".center(50)
      end
    end
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students".center(50)
end


students = input_students
print_header
print(students)
print_footer(students)
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

def interactive_menu
  students = []
  loop do
    # 1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit" 
    # 2. read the input and save it into a variable
    selection = gets.chomp
    # 3. do what the user has asked
    case selection
    when "1"
      students = input_students
    when "2"
      print_header
      print(students)
      print_footer(students)
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
    end
  end
end

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
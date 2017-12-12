#Right now if we have only one student, the user will see a message "Now we have 1 students",
#whereas it should be "Now we have 1 student".
#How can you fix it so that it used singular form when appropriate and plural form otherwise?


def input_students
  puts "Please enter the name of the students"
  puts "To finish, press return twice"

  students = []
  name = gets.chomp

  while !name.empty? do
    puts "What cohort is this student in?"
    cohort = gets.chomp
    if cohort.empty? then cohort = "December" end
    puts "Where is this student from?"
    location = gets.chomp
    puts "Enter some hobbies for this student:"
    hobbies = gets.chomp
    students << {name: name, cohort: cohort, location: location, hobbies: hobbies}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end


def print_header
  puts "The students of Villains Academy".center(100)
  puts "----------".center(100)
end

def menu
  students = []
  loop do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    selection = gets.chomp
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
      puts "I don't know what you mean"
    end
  end
end

def print(students)
  students.each { |name| puts "#{name[:name]}, #{name[:cohort]}, #{name[:location]}, #{name[:hobbies]}" }
end

def no_students(students)
  if students.count == 0
    puts "There is no students at Makers Academy! :("
  else
    print_header
    print(students)
    print_footer(students)
  end
end

def print_footer(students)
    unless students.count == 1
      puts "Overall, we have #{students.count} great students".center(100)
    else
      puts "Overall, we have #{students.count} great student".center(100)
    end
end


menu
no_students(students)

#Right now if we have only one student, the user will see a message "Now we have 1 students",
#whereas it should be "Now we have 1 student".
#How can you fix it so that it used singular form when appropriate and plural form otherwise?

@students = []

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
  @students
end


def print_header
  puts "The students of Villains Academy".center(100)
  puts "----------".center(100)
end

def interactive_menu

  loop do
    print_menu
    selection = gets.chomp
    case selection
    when "1"
      students = input_students
    when "2"
      show_students
    when "9"
      exit
    else
      puts "I don't know what you mean"
    end
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def show_students
  print_header
  print
  print_footer
end

def print
  @students.each { |name| puts "#{name[:name]}, #{name[:cohort]}, #{name[:location]}, #{name[:hobbies]}" }
end

def no_students
  if @students.count == 0
    puts "There is no students at Makers Academy! :("
  else
    print_header
    print
    print_footer
  end
end

def print_footer
    unless @students.count == 1
      puts "Overall, we have #{@students.count} great students".center(100)
    else
      puts "Overall, we have #{@students.count} great student".center(100)
    end
end


interactive_menu
no_students

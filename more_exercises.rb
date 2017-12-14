@students = []

def input_students
  puts "Please enter the name of the students"
  puts "To finish, press return twice"

  name = STDIN.gets.chomp

  while !name.empty? do
    puts "What cohort is this student in?"
    cohort = STDIN.gets.chomp
    if cohort.empty? then cohort = "December" end
    puts "Where is this student from?"
    location = STDIN.gets.chomp
    puts "Enter some hobbies for this student:"
    hobbies = STDIN.gets.chomp
    add_students(name, cohort, location, hobbies)
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp
  end
  success_message
  @students
end


def print_header
  puts "The students of Villains Academy".center(100)
  puts "----------".center(100)
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the studenet list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def process(selection)
  case selection
  when "1"
    success_message
    students = input_students
  when "2"
    success_message
    show_students
  when "3"
    puts success_message
    save_students
  when "4"
    success_message
    load_students
  when "9"
    exit
  else
    puts "I don't know what you mean"
  end
end

def show_students
  print_header
  print_students_list
  print_footer
end

def save_students
  file = File.open("students.csv", "w") #This opens the students file for writing
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:location], student[:hobbies]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
end

def load_students(filename = "students.csv")
  which_file
  @file = File.open(@file, "r")
  @file.readlines.each do |line|
    name, cohort, location, hobbies = line.chomp.split(",")
    add_students(name, cohort, location, hobbies)
  end
end

def try_load_students
    ARGV.first ? @file = ARGV.first : @file = "students.csv"
  return if @file.nil?
elsif File.exists?(@file)
    load_students(@file)
    puts "Loaded #{@students.count} from #{@file}"
  else
    puts "Sorry, #{@file} doesn't exist"
    exit
  end
end

def add_students(name, cohort, location, hobbies)
  @students << {name: name, cohort: cohort, location: location, hobbies: hobbies}
end

def print_students_list
  @students.each { |name| puts "#{name[:name]}, #{name[:cohort]}, #{name[:location]}, #{name[:hobbies]}" }
end

def no_students
  if @students.count == 0
    puts "There is no students at Makers Academy! :("
  else
    print_header
    print_students_list
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

def success_message
  puts "Your action was successful!"
end

def which_file
  puts "Which file would you like to use?"
  @file = STDIN.gets.chomp
end

try_load_students
interactive_menu
no_students

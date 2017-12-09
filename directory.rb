#Modify your program to only print the students whose name begins with a specific letter.
#Modify your program to only print the students whose name is shorter than 12 characters.
#Rewrite the each() method that prints all students using while or until control flow methods (Loops).


def input_students
  puts "Please enter the name of the students"
  puts "To finish, press return twice"

  students = []

  name = gets.chomp

  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end


def print_header
  puts "The students of Villains Academy"
  puts "----------"
end

def print(students)
  x = 0
  while x < students.length
    puts "#{students[x][:name]} (#{students[x][:cohort]} cohort)"
    x += 1
  end
end

def name_starts_with(students)
  students.select {|student| student[:name].start_with?("L")}
end

def short_name(students)
  students.select {|student| student[:name].length < 12 }
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)

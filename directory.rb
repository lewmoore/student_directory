#Modify your program to only print the students whose name begins with a specific letter.
#Modify your program to only print the students whose name is shorter than 12 characters.

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
  students.each.with_index(1) do |student, index|
    puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)"
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
name_starts_with(students)
print_header
print(students)
print_footer(students)

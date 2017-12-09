#5. Our code only works with the student name and cohort. Add more information: hobbies, country of birth, height, etc.


def input_students
  puts "Please enter the name of the students"
  puts "To finish, press return twice"

  students = []
  name = gets.chomp

  while !name.empty? do
    puts "Where is this student from?"
    location = gets.chomp
    puts "Enter some hobbies for this student:"
    hobbies = gets.chomp
    students << {name: name, cohort: :november, location: location, hobbies: hobbies}
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
    puts "#{students[x][:name]}, #{students[x][:location]}, #{students[x][:hobbies]}, (#{students[x][:cohort]} cohort)"
    x += 1
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)

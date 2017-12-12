#5. Our code only works with the student name and cohort. Add more information: hobbies, country of birth, height, etc.
#6. Research how the method center() of the String class works. Use it in your code to make the output beautifully aligned.
#7. In the input_students method the cohort value is hard-coded. How can you ask for both the name and the cohort?
#7. What if one of the values is empty? Can you supply a default value?

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

def print(students)
  cohort_group = students.select {|name| [:cohort].include? "December"}
  cohort_group.map { |name| puts "#{name[:name]}, #{name[:cohort]}, #{name[:location]}, #{name[:hobbies]}" }
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(100)
end

students = input_students
print_header
print(students)
print_footer(students)

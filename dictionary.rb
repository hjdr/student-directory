# list of students at Villains Academy

def get_name
  students = []
  while true
    puts "Enter student name, or enter 'exit' to quit"
    student_name = gets.chomp
    break if student_name == "exit"
    students << {name: student_name, cohort: :November }
    print_footer(students)
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_info(student_info)
  student_info.each { |student| puts "student: #{student[:name]} (#{student[:cohort]} cohort)" }
end

def print_footer(student_info)
  puts "Overall, we have #{student_info.count} great students"
end

students = get_name
puts ""
print_header
print_student_info(students)
print_footer(students)
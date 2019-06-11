# list of students at Villains Academy

def get_name
  students = []
  months = [:January, :February, :March, :April, :May, :June, :July, :August, :September, :October, :November, :December]
  puts "Enter student name"
  student_name = gets.chomp
  while !student_name.empty?
    while true
      puts "Enter student cohort"
      student_cohort = gets.chomp
      student_cohort = "november" if student_cohort.empty?
      if months.include?(student_cohort.chomp.capitalize.to_sym)
        student_cohort = student_cohort.capitalize.to_sym
        break
      else
        puts "invalid month!" 
      end
    end
      puts "Enter student age"
      student_age = gets.chomp
      puts "Enter student hobby"
      student_hobby = gets.chomp
    students << {name: student_name, cohort: student_cohort, age: student_age, hobby: student_hobby }
    print_footer(students)
    puts "Enter student name"
    student_name = gets.chomp
  end
  students.empty? ? "no students attended" : students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_info(student_info)
  if student_info.is_a?(String)
    puts student_info
  else
    student_info.each.with_index(1) do
      |student, index|
      puts "#{index}. #{student[:name]}, age: #{student[:age]}, hobby: #{student[:hobby]} (#{student[:cohort]} cohort)"
    end
  end
end

def print_student_info_with_center(student_info)
  student_info.each.with_index(1) do
    |student, index|
    puts "#{index}. #{student[:name]}".center(20)
    puts "age: #{student[:age]}".center(20)
    puts "hobby: #{student[:hobby]}".center(20)
    puts "cohort: #{student[:cohort]}".center(20)
  end
end

def print_student_info_with_while_loop(student_info)
  counter = 0
  while counter < student_info.length  do
    puts " #{counter + 1}. #{student_info[counter][:name]} (#{student_info[counter][:cohort]} cohort)" 
    counter += 1
  end
end

def print_student_info_with_start_char(student_info)
  student_info.each.with_index(1) do
    |student, index|
    if student[:name][0] == "H"
      puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def print_student_info_less_than_char(student_info)
  student_info.each.with_index(1) do
    |student, index|
    if student[:name].length < 12
      puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def print_footer(student_info)
  if student_info.is_a?(Array)
    student_info.count <= 1 ? puts("Overall, we have #{student_info.count} great student") : puts("Overall, we have #{student_info.count} great students")
  end
end

def print_students_by_cohort(student_info)

  cohort_group = {}
  student_info.each do |students|
    cohort_group[students[:cohort]] = [] if !cohort_group.include?(students[:cohort])
    cohort_group[students[:cohort]] << students[:name]
  end
  cohort_group.each do |key, value|
    puts "#{key} includes #{value.join(", ")}"
  end
end

students = get_name
puts "------------"
print_header
print_student_info(students)
puts "------------"
print_footer(students)
puts "------------"


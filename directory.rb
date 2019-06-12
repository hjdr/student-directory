# list of students at Villains Academy
@students = []

def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save the list of students"
    puts "4. Load the list of students"
    puts "9. Exit"
end

def process_menu_input(user_input)
  case user_input
  when "1"
    get_student_info
  when "2"
    print_all_info
  when "3"
    store_students
    puts "Students saved successfully"
  when "4"
    load_students
  when "9"
    exit
  else
    puts "I don't know what you mean sorry, please try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process_menu_input(STDIN.gets.chomp)
  end
end

def get_student_info
  while true
    puts "Enter student name, or enter 'exit' to quit"
    student_name = STDIN.gets.chomp
    break if student_name == "exit"
    @students << {name: student_name, cohort: :November }
    print_footer
  end
end

def print_header
  puts "-------------"
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_info
  @students.each.with_index(1) do
    |student, index|
    puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "-------------"
  puts "Overall, we have #{@students.count} great students"
    puts "-------------"
end

def print_all_info
  print_header
  print_student_info
  print_footer
end

def store_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]].join(",")
    file.puts student_data
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.split(",")
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def load_students_on_startup
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry #{filename} doesn't exist"
    exit
  end
end

load_students_on_startup
interactive_menu


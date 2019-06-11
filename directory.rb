# list of students at Villains Academy
@students = []

def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
end

def process(user_input)
  case user_input
  when "1"
    get_name
  when "2"
    print_all_info
  when "9"
    exit
  else
    puts "I don't know what you mean sorry, please try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def get_name
  while true
    puts "Enter student name, or enter 'exit' to quit"
    student_name = gets.chomp
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

interactive_menu


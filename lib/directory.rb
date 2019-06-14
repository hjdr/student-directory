

require "CSV"
# list of students at Villains Academy

Students_academy = Class.new

class Students_academy 

  def initialize
    @students = []
  end

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
      filename_user_input("save")
    when "4"
      filename_user_input("load")
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
      add_students_to_array({name: student_name, cohort: :November})
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

  def save_students(filename = "./lib/students.csv")
    file = File.open(filename, "w")
    @students.each do |student|
      student_data = [student[:name], student[:cohort]].join(",")
      file.puts student_data
    end
    file.close
    save_students_success_message
  end

  def save_students_success_message
    puts "-------------"
    puts "Students saved successfully"
    puts "-------------"
  end

  def load_students(filename = "./lib/students.csv")
    counter = 0
    CSV.foreach(filename) do |line|
      name, cohort = line
      add_students_to_array({name: name, cohort: cohort.to_sym})
    end
    load_students_success_message(filename, counter)
  end

  def load_students_success_message(filename, counter)
    puts "-------------"
    puts "Loaded #{counter} from #{filename}"
    puts "-------------"
  end

  def filename_user_input(command)
    puts "Enter filename to load/save from or press enter to use default file"
    filename = STDIN.gets.chomp
    if command == "load"
      filename == "" ? load_students : load_students(filename)
    elsif command == "save"
      filename == "" ? save_students : save_students(filename)
    end
  end

  def load_students_on_startup
    filename = ARGV.first
    return load_students if filename.nil?
    if File.exists?(filename)
      load_students(filename)
    else
      load_students_on_startup_unsuccessful_message(filename)
      exit
    end
  end

  def load_students_on_startup_unsuccessful_message(filename)
    puts "-------------"
    puts "Sorry #{filename} doesn't exist"
    puts "-------------"
  end

  def add_students_to_array(student_info)
    @students << student_info
  end

end

villains = Students_academy.new

villains.load_students_on_startup
villains.interactive_menu
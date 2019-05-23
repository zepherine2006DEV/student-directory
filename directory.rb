@students = []

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  get_names
end

def get_names
  name = STDIN.gets.chomp
  while !name.empty? do
    add_student(name, :november)
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
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
  puts "3. Save the list to file"
  puts "4. Load the list from file"
  puts "9. Exit"
end

def show_students
  print_header
  print_student_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      user_load_students
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end

def save_students
  puts "Please enter the filename, then hit enter."
  filename = STDIN.gets.chomp
  file = File.open(filename, "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]] #create a simple 2 element array based on the student hash
    csv_line = student_data.join(",") #create a string from the array, with the elements joined with a comma
    file.puts csv_line #write the string to the file reference
  end
  file.close
  puts "Students successfully saved to file."
end

def user_load_students
  puts "Please enter the filename, then hit enter."
  filename = STDIN.gets.chomp
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{filename} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r") #open the file read-only
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    add_student(name, cohort.to_sym)
  end
  file.close
  puts "Students successfully loading from file."
end

def try_load_students
  filename = ARGV.first #first arg on command line
  if filename.nil?
    load_students("students.csv")
  elsif File.exists?(filename)
    load_students(filename)
    puts "Loaded #{filename} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def add_student(name, cohort)
  @students << {name: name, cohort: cohort}
end

try_load_students
interactive_menu
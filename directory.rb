@students = []

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  #get the first name
  name = STDIN.gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    add_student(name, :november)
  #  @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    #get another name from the user
    name = gets.chomp
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students
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
  # 1. print the menu and ask the user what to do
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we'll be adding more items
end

def show_students
  print_header
  print_students
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
      load_students
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end

def save_students
  # open file
  file = File.open("students.csv", "w")
  # interate over @students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]] #create a simple 2 element array based on the student hash
    csv_line = student_data.join(",") #create a string from the array, with the elements joined with a comma
    file.puts csv_line #write the string to the file reference
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r") #open the file read-only
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    add_student(name, cohort.to_sym)
#    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
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
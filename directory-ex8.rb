DEFAULT_COHORT = :january
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
  #get the first name
  name = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    students << {name: name, cohort: DEFAULT_COHORT}
    puts "Now we have #{students.count} students"
    #get another name from the user
    name = gets.chomp
  end
  students.each do |student|
    user_entry = ""
    puts "Please enter cohort for #{student[:name]}. Enter to default."
    user_entry = gets.chomp
    if user_entry != ""
      case user_entry
      when "january"
        student[:cohort] = :january
      when "february"
        student[:cohort] = :february
      when "march"
        student[:cohort] = :march
      when "april"
        student[:cohort] = :april
      when "may"
        student[:cohort] = :may
      when "june"
        student[:cohort] = :june
      when "july"
        student[:cohort] = :july
      when "august"
        student[:cohort] = :august
      when "september"
        student[:cohort] = :september
      when "october"
        student[:cohort] = :october
      when "november"
        student[:cohort] = :november
      when "december"
        student[:cohort] = :december
      else
        puts "not a valid entry! Default will be used."
      end
    end  
  end
  students.each do |student|
    puts "Please enter height of #{student[:name]}"
    height = gets.chomp
    student[:height] = height
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  
  #get the list of unique cohorts
  cohorts = students.map { |student| student[:cohort] }
  cohorts.uniq!
  
  #print the students grouped by cohort
  cohorts.each do |cohort|
    students_this_cohort = students.select { |student| student[:cohort] == cohort }
    iterator = 0
    until iterator == students_this_cohort.length
      puts "#{iterator + 1}. #{students_this_cohort[iterator][:name].center(40)} (#{students_this_cohort[iterator][:cohort]} cohort, height #{students[iterator][:height]})"
      iterator += 1
    end
  end

end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
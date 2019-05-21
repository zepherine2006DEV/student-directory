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
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    #get another name from the user
    name = gets.chomp
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
  
  iterator = 0
  
  until iterator == students.length
    puts "#{iterator + 1}. #{students[iterator][:name].center(40)} (#{students[iterator][:cohort]} cohort, height #{students[iterator][:height]})"
    iterator += 1
  end

end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
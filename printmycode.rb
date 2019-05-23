# a simple program which reads its own souce code and prints it!
myfile = File.open(__FILE__, "r")
myfile.readlines.each do |line|
  puts line
end
myfile.close
out_file = File.open('test-results/tab-test-results.txt', 'w')
out_file.puts "size,language,real,user,sys"

the_line = []
size = 0
in_title = false

IO.foreach('test-results/test-results.txt') do |line|
  if line =~ /(^-+$)/
    in_title = false
    size = 0
  elsif line =~ /(^$)/
    in_title = false
  elsif line =~ /(?:^--------- head (.*?) ---------------)/
    size = [$1]
    the_line[0] = [$1]
    in_title = true
  elsif line =~ /^(?:real|user)\s+(.*?)$/
    the_line += [$1]
    in_title = false
  elsif line =~ /^(?:sys)\s+(.*?)$/
    the_line += [$1]
    out_file.puts the_line.join(',')
    the_line = []
    the_line[0] = size
    in_title = true
  elsif in_title
    the_line[1] = line.chomp
  else
    puts "Error: don't know what to do with line #{line}"
  end
end
out_file.close

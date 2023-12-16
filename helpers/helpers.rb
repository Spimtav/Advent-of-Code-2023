STDOUT.sync = true

def run_with_timer(func_list)
  names_results_times = []
  total_time = 0
  longest_name_length = func_list.map(&:length).max

  puts "Launching functions:"
  func_list.each do |func_name|
    print "    Running #{func_name}..."

    start_time = Time.now
    result = Object.send(func_name)
    elapsed_sec = Time.now - start_time

    print "DONE\n"
    STDOUT.flush

    names_results_times.push([func_name, result, elapsed_sec])
    total_time += elapsed_sec
  end

  puts "\nResults:"
  names_results_times.each do |name, result, time|
    num_spaces = longest_name_length - name.length
    puts "    #{name}:#{' ' * num_spaces} #{result} in #{time} s (#{time / total_time * 100}% of total)"
  end
  puts "TOTAL RUNTIME: #{total_time} s"
end


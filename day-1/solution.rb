require "../helpers/helpers.rb"

FILE_NAME='input.txt'
FUNC_NAMES = %w[
  calibration_sum_readable
  calibration_sum_explicit
  calibration_sum_explicit_less_space
  calibration_sum_explicit_less_time
]

def calibration_sum_readable
  calibration_sum = 0

  File.foreach(FILE_NAME) do |line|
    digits = line.each_char.select { |char| char.match?(/[[:digit:]]/) }
    calibration = "#{digits[0]}#{digits[-1]}"
    calibration_sum += calibration.to_i
  end

  calibration_sum
end


def calibration_sum_explicit
  calibration_sum = 0

  File.foreach(FILE_NAME) do |line|
    calibration = ''
    curr_digit = nil

    (0..line.length - 1).each do |i|
      char = line[i]
      next unless char.match?(/[0-9]/)

      calibration += char unless curr_digit
      curr_digit = char
    end
    calibration += curr_digit

    calibration_sum += calibration.to_i
  end

  calibration_sum
end


def calibration_sum_explicit_less_space
  calibration_sum = 0

  File.foreach(FILE_NAME) do |line|
    curr_digit_index = -1

    (0..line.length - 1).each do |i|
      next unless line[i].match?(/[0-9]/)

      calibration_sum += line[i].to_i * 10 unless curr_digit_index >= 0
      curr_digit_index = i
    end

    calibration_sum += line[curr_digit_index].to_i
  end

  calibration_sum
end

def calibration_sum_explicit_less_time
  calibration_sum = 0

  File.foreach(FILE_NAME) do |line|
    curr_pos = 0
    until line[curr_pos].match?(/[0-9]/)
      curr_pos += 1
    end
    calibration_sum += line[curr_pos].to_i * 10

    curr_pos = line.length - 1
    until line[curr_pos].match?(/[0-9]/)
      curr_pos -= 1
    end
    calibration_sum += line[curr_pos].to_i
  end

  calibration_sum
end


def main
  puts calibration_sum_readable
  puts calibration_sum_explicit
  puts calibration_sum_explicit_less_space
  puts calibration_sum_explicit_less_time
end

run_with_timer(FUNC_NAMES)


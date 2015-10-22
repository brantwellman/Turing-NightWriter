require 'pry'

class NightReader

  def initialize(input_file_name = nil, output_file_name = nil)
    if input_file_name != nil
      @input = File.read(input_file_name)
      @output_file = File.open(output_file_name, "w")
      encode_to_english(@input)
      # write(@input)
      puts "Created '#{output_file_name}' containing #{count_characters_in_file(input_file_name)} characters."
    end
    @concated_arr = ["", "", ""]
  end

  def count_characters_in_file(output_file_name)
    lines = File.readlines(output_file_name)
    total_characters = lines.join.size
  end

  def write(output_string)
    @output_file.write(output_string)
  end

  def split_string_at_new_lines(input_string)
    input_string.split("\n")
  end

  def concatenate_every_third_string(array)
    array.each do |str|
      if array.index(str) % 3 == 0
        @concated_arr[0] << str
      elsif array.index(str) % 3 == 1
        @concated_arr[1] << str
      elsif array.index(str) % 3 == 2
        @concated_arr[2] << str
      end
    end
    @concated_arr
  end

  # def create_strings_of_letters
  #   # until @concated_arr[0] == "" do
  #
  #     @concated_arr.each do |str|
  #      str.slice!(0..2)
  #     end
  #     first_letter
  #   # end
  # end

  def encode_to_english(string)
    split_string_at_new_lines(string)
    concatenate_every_third_string(array)
    create_strings_of_letters
  end

end

reader = NightReader.new
# reader = NightReader.new(ARGV[0], ARGV[1])
# p reader.split_string_at_new_lines("00.0.000..\n.0..00.0..\n000.......\n")
# array_test = ["1000000000000000", "2..............", "30000000000000", "4..............", "50000000000000", "6.............."]
# p reader.concatenate_every_third_string(array_test)
# p reader.create_strings_of_letters

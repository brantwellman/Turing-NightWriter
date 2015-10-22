require 'pry'

class NightReader

  def initialize(input_file_name = nil, output_file_name = nil)
    if input_file_name != nil
      @input = File.read(input_file_name)
      @output_file = File.open(output_file_name, "w")
      @string1 = ""
      @string2 = ""
      @string3 = ""
      @string_array3 = ["", "", ""]
      @full_string_array = []
      encode_to_english(@input)
      # write(@input)
      puts "Created '#{output_file_name}' containing #{count_characters_in_file(input_file_name)} characters."
    end



    @input = "ksdurejsks\nsieEDDSkij\nxkdliea:sw\n"
  end

  def count_characters_in_file(output_file_name)
    lines = File.readlines(output_file_name)
    total_characters = lines.join.size
  end

  def write(input)
    @output_file.write(input)
  end

  def split_string_at_new_lines(input_string)
    input_string.split("\n")
  end

  # destructively add string from array to new string
  # iterate through 3 strings
  # def concatenate_every_third_string(array)
  #
  # end
  #
  def encode_to_english(input)
    split_string_at_new_lines(input)
  end

end

reader = NightReader.new
# reader = NightReader.new(ARGV[0], ARGV[1])
p reader.split_string_at_new_lines("ksdurejsks\nsieEDDSkij\nxkdliea:sw\n")

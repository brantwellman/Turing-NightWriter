require 'pry'

class NightReader
  attr_accessor :concated_arr

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
    array = input_string.split("\n")
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

  def create_strings_of_letters
    letter_array = []
    top = @concated_arr[0]
    middle = @concated_arr[1]
    lower = @concated_arr[2]
    top_pairs = []
    middle_pairs = []
    lower_pairs = []
    top.chars.each_slice(2) do |pair|
      top_pairs << pair
    end
    middle.chars.each_slice(2) do |pair|
      middle_pairs << pair
    end
    lower.chars.each_slice(2) do |pair|
      lower_pairs << pair
    end
    top_pairs.each_with_index do |pair, index|
      braille_char = pair.join + middle_pairs[index].join + lower_pairs[index].join
      letter_array[index] = braille_char
    end
    letter_array
  end

  def capital_letter?(braille_char)
    braille_char == ".....0"
  end

  def encode_to_english(string)
    array = split_string_at_new_lines(string)
    concatenate_every_third_string(array)
    letter_array = create_strings_of_letters
  end

end

reader = NightReader.new
# reader = NightReader.new(ARGV[0], ARGV[1])
# p reader.split_string_at_new_lines("00.0.000..\n.0..00.0..\n000.......\n")
# array_test = ["1000000000000000", "2..............", "30000000000000", "4..............", "50000000000000", "6.............."]
# p reader.concatenate_every_third_string(array_test)
reader.concated_arr = ["100435", "200055", "300088"]
p reader.capital_letter?(".....0")
# p reader.create_strings_of_letters
# reader.encode_to_english(".00.....0.....0....0....0...0...0.........0.0...0.......0.0")

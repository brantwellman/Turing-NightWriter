require 'pry'
require './alphabet_eng_to_braille.rb'

class NightWriter
  attr_reader :file_reader, :input

  def initialize(input_file_name = nil, output_file_name = nil)
    @outputs = ["", "", ""]
    @print_string = ""
    if input_file_name != nil
      @input = File.read(input_file_name)
      @output_file = File.open(output_file_name, "w")
      encode_to_braille(@input)
      write(@print_string)
      puts "Created '#{output_file_name}' containing #{count_characters_in_file(input_file_name)} characters."
    end
  end

  def write(print_string)
    @output_file.write(print_string)
    # output_print = []
    # str_length = @outputs[0].length
    # iterations = str_length/80 + 1
    # remainders = str_length % 80
    # iterations.times do |n|
    #   @outputs.each do |output|
    #     @output_file.write(output[80*n..79+80*n] + "\n")
    #   end
    # end
  end

  def strip_new_line_characters(input)
    input.gsub("\n", "")
  end

  def count_characters_in_file(input_file_name)
    lines = File.readlines(input_file_name)
    total_characters = lines.join.size
  end

  def capital_letter?(char)
    "A" <= char && char <= "Z"
  end

  def add_cap_letter_and_shift_to_output(char)
    @outputs[0] = @outputs[0] + (ALPHABET.fetch("cap")[0..1])
    @outputs[1] = @outputs[1] + (ALPHABET.fetch("cap")[2..3])
    @outputs[2] = @outputs[2] + (ALPHABET.fetch("cap")[4..5])
    @outputs[0] = @outputs[0] + (ALPHABET.fetch(char.downcase)[0..1])
    @outputs[1] = @outputs[1] + (ALPHABET.fetch(char.downcase)[2..3])
    @outputs[2] = @outputs[2] + (ALPHABET.fetch(char.downcase)[4..5])
    @outputs
  end

  def add_non_cap_character_to_ouput(char)
    @outputs[0] = @outputs[0] + ALPHABET.fetch(char)[0..1]
    @outputs[1] = @outputs[1] + ALPHABET.fetch(char)[2..3]
    @outputs[2] = @outputs[2] + ALPHABET.fetch(char)[4..5]
    @outputs
  end

  def encode_to_braille(input)
    strip_new_line_characters(input).each_char do |char|
      if capital_letter?(char)
        add_cap_letter_and_shift_to_output(char)
      else
        add_non_cap_character_to_ouput(char)
      end
    end
    # @outputs
    convert_output_array_to_one_string(@outputs)
  end

  def convert_output_array_to_one_string(outputs)
    # outputs.join("\n") + "\n"

    until outputs[0] == "" do
      outputs.each do |output|
        @print_string << output.slice!(0..79) + "\n"
      end
    end
    @print_string
  end

  # iterate through each string in outputs
  #   take first 80 characters and add a \n character to the end
  # =>add this character to new output string
      # continue through each string
      # until each string is empty



# split output strings into lengths of 80
# Tests!

 # def encode_file_to_braille
 #   # I wouldn't worry about testing this method
 #   # unless you get everything else done
 #   plain = reader.read
 #   braille = encode_to_braille(plain)
 # end

end

writer = NightWriter.new(ARGV[0], ARGV[1])
# writer.create_output_file_from_input_file(ARGV[0], ARGV[1])
# p writer.count_characters_in_file ARGV[0]
# p writer.encode_to_braille("Nn\n!")
# puts @outputs
# writer.print_in_three_lines
# p writer.capital_letter?("!")
# writer.add_character_to_ouput_string1("n", "")

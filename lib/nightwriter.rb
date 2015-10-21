require 'pry'
require './lib/alphabet_eng_to_braille.rb'

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
    convert_output_array_to_one_string(@outputs)
  end

  def convert_output_array_to_one_string(outputs)
    until outputs[0] == "" do
      outputs.each do |output|
        @print_string << output.slice!(0..79) + "\n"
      end
    end
    @print_string
  end

end

writer = NightWriter.new(ARGV[0], ARGV[1])

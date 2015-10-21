require 'pry'
require './alphabet_eng_to_braille.rb'

class FileReader
  def read
    filename = ARGV[0]
    File.read(filename)
  end
end

class NightWriter
  attr_reader :file_reader, :input

  def initialize(input_file_name, output_file_name)
    @output_file = File.open(output_file_name, "w")
    @input = File.read(input_file_name)
    @outputs = ["", "", ""]
    encode_to_braille(@input)
    write
  end

  def write
    output_print = []
    str_length = @outputs[0].length
    iterations = str_length/80 + 1
    remainders = str_length % 80
    iterations.times do |n|
      @outputs.each do |output|
        @output_file.write(output[80*n..79+80*n] + "\n")
      end
    end
  end

  def create_output_file_from_input_file(input_filename, output_filename)
    @input = File.open(input_filename)
    # string = @input.read * 3
    output = File.open(output_filename, "w")
    output.write(string)
    puts "Created '#{output_filename}' containing #{count_characters_in_file(input_filename)} characters."
  end

  def count_characters_in_file(input_filename)
    lines = File.readlines(input_filename)
    total_characters = lines.join.size
  end

  def capital_letter?(char)
    "A" <= char && char <= "Z"
  end

  def add_cap_letter_shift_and_cap(char)
    @outputs[0] = @outputs[0] + (ALPHABET.fetch("cap")[0..1])
    @outputs[1] = @outputs[1] + (ALPHABET.fetch("cap")[2..3])
    @outputs[2] = @outputs[2] + (ALPHABET.fetch("cap")[4..5])
    @outputs[0] = @outputs[0] + (ALPHABET.fetch(char.downcase)[0..1])
    @outputs[1] = @outputs[1] + (ALPHABET.fetch(char.downcase)[2..3])
    @outputs[2] = @outputs[2] + (ALPHABET.fetch(char.downcase)[4..5])
  end

  def add_non_cap_character_to_ouput(char)
    @outputs[0] = @outputs[0] + ALPHABET.fetch(char)[0..1]
    @outputs[1] = @outputs[1] + ALPHABET.fetch(char)[2..3]
    @outputs[2] = @outputs[2] + ALPHABET.fetch(char)[4..5]
  end

  def encode_to_braille(input)
    input.gsub("\n", "").each_char do |char|
      if capital_letter?(char)
        add_cap_letter_shift_and_cap(char)
      else
        add_non_cap_character_to_ouput(char)
      end
    end
    @outputs
  end

# split output strings into lengths of 80
# create proper output to terminal "Created file X with x characters"
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

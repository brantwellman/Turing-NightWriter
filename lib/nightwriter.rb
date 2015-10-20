require 'pry'
require './alphabet2.rb'

class FileReader
  def read
    filename = ARGV[0]
    File.read(filename)
  end
end

class NightWriter
  attr_reader :file_reader, :input

  def initialize
   @reader = FileReader.new
   @input = ""
  end

 # def read_file
 #   text = @reader.read("test.txt")
 # end

  def create_output_file_from_input_file(input_filename, output_filename)
    @input = File.open(input_filename)
    string = @input.read * 3
    output = File.open(output_filename, "w")
    output.write(string)
    puts "Created '#{output_filename}' containing #{count_characters_in_file(input_filename)} characters."
  end

  def count_characters_in_file(input_filename)
    lines = File.readlines(input_filename)
    total_characters = lines.join.size
  end

  def encode_to_braille(test)
    output_string = ''
    test.each_char do |char|
      if capital_letter?(char)
        add_cap_letter_shift_and_cap(char, output_string)
      else
        output_string << ALPHABET.fetch(char)
      end
    end
    output_string
  end

  def add_character_to_ouput_strings(char)

  end

  def add_cap_letter_shift_and_cap(char, output_string)
    output_string << ALPHABET.fetch("cap")
    output_string << char.downcase
  end

  def capital_letter?(char)
    "A" <= char && char <= "Z"
  end
 # def encode_file_to_braille
 #   # I wouldn't worry about testing this method
 #   # unless you get everything else done
 #   plain = reader.read
 #   braille = encode_to_braille(plain)
 # end

end

# each_char through input string
  # compare to hash method - if find matching key, then return values...
  # create 3 empty strings -
  # add first array values to string 1
  # add 2nd array values to string 2
  # add 3rd array values to string 3
  # when string length gets to 80 handle.flush

writer = NightWriter.new
# writer.create_output_file_from_input_file(ARGV[0], ARGV[1])
# p writer.count_characters_in_file ARGV[0]
p writer.encode_to_braille("\nEesty-testy!")
# p writer.capital_letter?("!")

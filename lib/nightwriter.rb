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

  def initialize
   @reader = FileReader.new
   @input = ""
   @out_str1 = ""
   @out_str2 = ""
   @out_str3 = ""
   @outputs = ["", "", ""]
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



  def add_character_to_ouput_string1(char, out_str1)
    @out_str1 << ALPHABET.fetch(char)[0..1]
  end

  def add_character_to_ouput_string2(char, out_str2)
    @out_str2 << ALPHABET.fetch(char)[2..3]
  end

  def add_character_to_ouput_string3(char, out_str3)
    @out_str3 << ALPHABET.fetch(char)[4..5]
  end

  def add_cap_letter_shift_and_cap(char)
    @outputs[0] = @outputs[0] + (ALPHABET.fetch("cap")[0..1])
    @outputs[1] = @outputs[1] + (ALPHABET.fetch("cap")[2..3])
    @outputs[2] = @outputs[2] + (ALPHABET.fetch("cap")[4..5])
    @outputs[0] = @outputs[0] + (ALPHABET.fetch(char.downcase)[0..1])
    @outputs[1] = @outputs[1] + (ALPHABET.fetch(char.downcase)[2..3])
    @outputs[2] = @outputs[2] + (ALPHABET.fetch(char.downcase)[4..5])

    # @out_str2 << ALPHABET.fetch("cap")[2..3]
    # @out_str3 << ALPHABET.fetch("cap")[4..5]
    # @out_str1 << ALPHABET.fetch(char.downcase)[0..1]
    # @out_str2 << ALPHABET.fetch(char.downcase)[2..3]
    # @out_str3 << ALPHABET.fetch(char.downcase)[4..5]
  end

  def capital_letter?(char)
    "A" <= char && char <= "Z"
  end

  def encode_to_braille(input)
    input.each_char do |char|
      if capital_letter?(char)
        add_cap_letter_shift_and_cap(char)
      else
        @outputs[0] = @outputs[0] + add_character_to_ouput_string1(char, @out_str1)
        @outputs[1] = @outputs[1] + add_character_to_ouput_string2(char, @out_str2)
        @outputs[2] = @outputs[2] + add_character_to_ouput_string3(char, @out_str3)
      end
    end
    @outputs
  end

 # def encode_file_to_braille
 #   # I wouldn't worry about testing this method
 #   # unless you get everything else done
 #   plain = reader.read
 #   braille = encode_to_braille(plain)
 # end

end

  # when string length gets to 80 handle.flush

writer = NightWriter.new
# writer.create_output_file_from_input_file(ARGV[0], ARGV[1])
# p writer.count_characters_in_file ARGV[0]
p writer.encode_to_braille("n")
puts @outputs
# p writer.capital_letter?("!")
# writer.add_character_to_ouput_string1("n", "")

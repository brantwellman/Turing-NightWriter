require 'pry'
class FileReader
  def read
    filename = ARGV[0]
    File.read(filename)
  end
end

class NightWriter
  attr_reader :file_reader

  def initialize
   @reader = FileReader.new
  end

 # def read_file
 #   text = @reader.read("test.txt")
 # end

  def create_output_file_from_input_file(input_filename, output_filename)
    input = File.open(input_filename)
    string = input.read * 3
    output = File.open(output_filename, "w")
    output.write(string)
    puts "Created '#{output_filename}' containing #{count_characters_in_file(input_filename)} characters."
  end

  def count_characters_in_file(input_filename)
    lines = File.readlines(input_filename)
    total_characters = lines.join.size
  end

 # def encode_file_to_braille
 #   # I wouldn't worry about testing this method
 #   # unless you get everything else done
 #   plain = reader.read
 #   braille = encode_to_braille(plain)
 # end
 #
 # def encode_to_braille(input)
 #   # you've taken in an INPUT string
 #   # do the magic
 #   # send out an OUTPUT string
 # end
end

# puts ARGV.inspect

# reader = FileReader.new
# puts reader.read
# file = File.new(ARGV[1], "w")

writer = NightWriter.new
writer.create_output_file_from_input_file(ARGV[0], ARGV[1])
# p writer.count_characters_in_file ARGV[0]

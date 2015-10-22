require 'minitest'
require 'minitest/autorun'
require './lib/nightreader'

class NightReaderTest < Minitest::Test
  def test_that_it_exists
    reader = NightReader.new
    assert reader
  end

  def test_it_splits_incoming_string_on_new_line_characters
    reader = NightReader.new
    string = "0000...\n....000\n0000..."
    assert_equal ["0000...", "....000", "0000..."], reader.split_string_at_new_lines(string)
  end

  def test_it_concatenates_every_third_string_into_3_strings
    reader = NightReader.new
    array = ["1000", "2000", "3000", "4000", "5000", "6000", "7000", "8000", "9000"]
    assert_equal ["100040007000", "200050008000", "300060009000"], reader.concatenate_every_third_string(array)
  end

  def test_concatenator_works_with_only_three_strings
    reader = NightReader.new
    array = ["1000", "2000", "3000"]
    assert_equal ["1000", "2000", "3000"], reader.concatenate_every_third_string(array)
  end

  # def test_it_creates_arrays_from_the_first_two_elements_of_each_string
  #   reader = NightReader.new
  #   array = ["100435", "200055", "300088"]
  #   assert_equal ["102030", "040000", "355588"], reader.create_strings_of_letters
  # end
end

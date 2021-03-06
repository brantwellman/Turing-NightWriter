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

  def test_it_concatenates_every_third_string_into_3_total_strings
    reader = NightReader.new
    array = ["1000", "2000", "3000", "4000", "5000", "6000", "7000", "8000", "9000"]
    assert_equal ["100040007000", "200050008000", "300060009000"], reader.concatenate_every_third_string(array)
  end

  def test_concatenator_works_with_only_three_strings
    reader = NightReader.new
    array = ["1000", "2000", "3000"]
    assert_equal ["1000", "2000", "3000"], reader.concatenate_every_third_string(array)
  end

  def test_it_creates_arrays_from_the_first_two_elements_of_each_string
    reader = NightReader.new
    array = ["100435", "200055", "300088"]
    reader.concated_arr = array
    assert_equal ["102030", "040000", "355588"],  reader.create_strings_of_letters
  end

  def test_that_it_returns_cap_characters
    reader = NightReader.new
    braille_char = ".....0"
    assert reader.capital_letter?(braille_char)
  end

  def test_that_it_does_not_return_capital_for_lowercase
    reader = NightReader.new
    braille_char = "0....."
    refute reader.capital_letter?(braille_char)
  end

  def test_that_it_does_not_return_capital_for_punctuation
    reader = NightReader.new
    braille_char = "..000."
    refute reader.capital_letter?(braille_char)
  end

  def test_it_adds_proper_lowercase_letter_from_braille_char_to_print_letter_string
    reader = NightReader.new
    braille_char = "0....."
    braille_char2 = "0.0..."
    braille_char3 = ".0000."
    assert_equal "a", reader.add_non_cap_character_to_print_string(braille_char)
    assert_equal "ab", reader.add_non_cap_character_to_print_string(braille_char2)
    assert_equal "abt", reader.add_non_cap_character_to_print_string(braille_char3)
  end

  def test_it_adds_proper_punctuation_from_braille_char_to_print_letter_string
    reader = NightReader.new
    braille_char = "..000."
    braille_char2 = "..0..."
    assert_equal "!", reader.add_non_cap_character_to_print_string(braille_char)
    assert_equal "!,", reader.add_non_cap_character_to_print_string(braille_char2)
  end

  def test_it_adds_proper_cap_letter_from_braille_char_to_print_letter_string
    reader = NightReader.new
    letter_array = ["0.....", "0....."]
    letter_arra2 = ["0.0...", "0.0..."]
    letter_array3 = [".0000.", ".0000."]
    assert_equal "A", reader.build_print_string(letter_array)
    assert_equal "AB", reader.build_print_string(letter_array2)
    assert_equal "ABT", reader.build_print_string(letter_array3)
  end

  def test_it_removes_braille_shift_character_from_letter_array_does_not_add_character_to_print_string
    reader = NightReader.new
    letter_array = [".....0", "0....."]
    assert_equal "", reader.add_cap_letter_to_print_string(letter_array)
  end
end

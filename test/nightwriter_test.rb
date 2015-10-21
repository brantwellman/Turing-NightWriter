require 'minitest'
require 'minitest/autorun'
require_relative '../lib/nightwriter'

class NightWriterTest < Minitest::Test
  def test_that_it_exists
    writer = NightWriter.new
    assert writer
  end

  def test_that_it_checks_for_capital_letters
    writer = NightWriter.new
    assert writer.capital_letter?("A")
  end

  def test_that_it_refutes_capital_letters
    writer = NightWriter.new
    refute writer.capital_letter?("b")
  end

  def test_that_it_refutes_punctuation_as_capital_letters
    writer = NightWriter.new
    refute writer.capital_letter?("!")
  end

  def test_it_adds_a_cap_and_shift_to_output_strings
    writer = NightWriter.new
    outputs = writer.add_cap_letter_and_shift_to_output("A")
    assert_equal "..0.", outputs[0]
    assert_equal "....", outputs[1]
    assert_equal ".0..", outputs[2]
  end

  def test_it_does_not_add_cap_shift_to_punctuation
    writer = NightWriter.new
    outputs = writer.add_non_cap_character_to_ouput("?")
    assert_equal "..", outputs[0]
    assert_equal "0.", outputs[1]
    assert_equal "00", outputs[2]

  end

  def test_it_does_not_add_cap_shift_to_downcase_letter
    writer = NightWriter.new
    outputs = writer.add_non_cap_character_to_ouput("a")
    assert_equal "0.", outputs[0]
    assert_equal "..", outputs[1]
    assert_equal "..", outputs[2]
  end

  def test_it_strips_newline_characters_from_input
    writer = NightWriter.new
    assert_equal "bc!", writer.strip_new_line_characters("bc!\n")
  end

  def test_it_converts_output_array_less_than_80_characters_to_one_string
    writer = NightWriter.new
    assert_equal "000\n...\n000\n", writer.convert_output_array_to_one_string(["000", "...", "000"])
  end

  def test_it_conversts_output_array_of_more_than_80_characters_to_one_string
    writer = NightWriter.new
    expected = <<-EOF
00000000000000000000000000000000000000000000000000000000000000000000000000000000
................................................................................
00000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000
..........
0000000000
EOF
    assert_equal expected, writer.convert_output_array_to_one_string(["000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", "..........................................................................................", "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"])
  end

  def test_it_returns_a_braille_encoded_string
    skip
    writer = NightWriter.new
  end
end

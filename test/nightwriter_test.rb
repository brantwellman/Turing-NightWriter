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

  def test_it_adds_a_cap_to_output_strings
    skip
    writer = NightWriter.new

    assert_equal  , writer.add_cap_letter_shift_and_cap("A")
  end

  def test_it_adds_cap_shift_to_ouput
    skip
    writer = NightWriter.new
  end


  def add_cap_letter_shift_and_cap(char)
    @out_str1 << ALPHABET.fetch("cap")[0..1]
    @out_str2 << ALPHABET.fetch("cap")[2..3]
    @out_str3 << ALPHABET.fetch("cap")[4..5]
    @out_str1 << ALPHABET.fetch(char.downcase)[0..1]
    @out_str2 << ALPHABET.fetch(char.downcase)[2..3]
    @out_str3 << ALPHABET.fetch(char.downcase)[4..5]
    # output_string << ALPHABET.fetch("cap")
    # output_string << char.downcase
  end



  def test_it_does_not_add_cap_shift_to_punctuation
    skip
    writer = NightWriter.new
  end

  def test_it_does_not_add_cap_shift_to_downcase_letter
    skip
    writer = NightWriter.new
  end

  def test_it_returns_true_for_a_cap
    skip
    writer = NightWriter.new
  end

  def test_it_returns_false_for_a_lowercase
    skip
    writer = NightWriter.new
  end

  def test_it_returns_false_for_a_cap_for_punctuation
    skip
    writer = NightWriter.new
  end

  def test_it_returns_a_braille_encoded_string
    skip
    writer = NightWriter.new
  end







end

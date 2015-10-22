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
    string = "This is\nso much\nfun!!!!"
    assert_equal ["This is", "so much", "fun!!!!"], reader.split_string_at_new_lines(string)
  end
end

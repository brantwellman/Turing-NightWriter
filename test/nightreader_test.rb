require 'minitest'
require 'minitest/autorun'
require './lib/nightreader'

class NightReaderTest < Minitest::Test
  def test_that_it_exists
    reader = NightReader.new

    assert reader
  end
end

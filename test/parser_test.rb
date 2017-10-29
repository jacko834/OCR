require_relative "../lib/parser"
require "minitest/autorun"

class ParserTest < MiniTest::Test
  


  def test_valid_file_zero
    
    parser = Parser.new
    
    assert_equal("000000000" , parser.parse(" _  _  _  _  _  _  _  _  _ | || || || || || || || || ||_||_||_||_||_||_||_||_||_|"))

  end

  def test_valid_file_one

    parser = Parser.new

    assert_equal("111111111" , parser.parse("                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |"))

  end

  def test_valid_file_two

    parser = Parser.new

    assert_equal("222222222" , parser.parse(" _  _  _  _  _  _  _  _  _  _| _| _| _| _| _| _| _| _||_ |_ |_ |_ |_ |_ |_ |_ |_ "))

  end

  def test_valid_file_illegible

    parser = Parser.new

    assert_equal("?22222222" , parser.parse("__  _  _  _  _  _  _  _  _  _| _| _| _| _| _| _| _| _||_ |_ |_ |_ |_ |_ |_ |_ |_ "))

  end
end
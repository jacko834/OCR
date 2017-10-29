require_relative "../lib/file_reader"
require "minitest/autorun"

class FileReaderTest < MiniTest::Test


  def test_green_path

    fr = FileReader.new("test/files/bankocr.txt")
    fr.chunk  do | chunk | puts chunk end 
    
  end
  
  
  def test_file_does_not_exist
    assert_raises_with_message(RuntimeError, "file not found nosuchfile.txt") do
      FileReader.new("nosuchfile.txt")
    end
  end


  def test_file_empty
    assert_raises_with_message(RuntimeError, "file not found test/files/bankocr_empty.txt") do
       FileReader.new("test/files/bankocr_empty.txt")
    end
  end


  def test_file_lines_not_multipleof4
    assert_raises_with_message(RuntimeError, "file does not have a multiple of 4 lines test/files/bankocr_lines_incorrect.txt") do
      FileReader.new("test/files/bankocr_lines_incorrect.txt")
    end
  end

  def test_invalid_record_length
    assert_raises_with_message(RuntimeError, "invalid line length") do
      fr = FileReader.new("test/files/bankocr_length_incorrect.txt")
      fr.chunk
    end
  end

  def test_invalid_final_record_length
    assert_raises_with_message(RuntimeError, "invalid final line length") do
      fr = FileReader.new("test/files/bankocr_final_length_incorrect.txt")
      fr.chunk
    end
  end

  private
  #helper method to additionally test the error message returned
  def assert_raises_with_message exp, exp_msg, msg = nil
    msg = message(msg) { "#{mu_pp(exp)} exception expected with message #{mu_pp(exp_msg)}" }

    exception = assert_raises exp do
      yield
    end

    assert_equal exp_msg, exception.message, msg
    exception
  end


end
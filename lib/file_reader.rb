
class FileReader

  LINE_LENGTH = 27
  
  FINAL_LINE_LENGTH = 0
  
  def initialize(file)
    if File.exist? file
      @lines = File.readlines file
      if @lines.size == 0
        raise "file empty " + file
      end
      if @lines.size % 4 != 0
        raise "file does not have a multiple of 4 lines " + file
      end
    else
      raise "file not found " + file
    end
  end

  def chunk
    @lines.each_slice(4) do |  slice |
        chunk  = slice[0..2].each do |line |
          raise "invalid line length" unless line.chomp.length == LINE_LENGTH
        end
        raise "invalid final line length" unless slice[3].chomp.length == FINAL_LINE_LENGTH
        yield chunk.join
    end
  end





end
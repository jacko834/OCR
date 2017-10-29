
class Parser
  
  ACCOUNT_LENGTH = 9
  DIGIT_WIDTH = 3

  TO_DIGIT = {

          "0" => " _ | ||_|",
          
          "1" => "     |  |",
          
          "2" => " _  _||_ ",
          
          "3" => " _  _| _|",
          
          "4" => "   |_|  |",
          
          "5" => " _ |_  _|",

          "6" => " _ |_ |_|",

          "7" => " _   |  |",
          
          "8" => " _ |_||_|",

          "9" => " _ |_| _|"

  }
  

  def parse(input)
    
    input.gsub!(/\n+/, '')


    characters = input.scan /.{#{DIGIT_WIDTH}}/


    
    (0...ACCOUNT_LENGTH).reduce('') do |account_numbers, position|
      account_numbers << get_digit(characters, position)
    end
  end

  private
  def get_digit(text, position)
    #concatanate the parts of the individual digit into a single string
    digit = (0..2).reduce('') do |digit_parts, index|
      offset = position + (index * ACCOUNT_LENGTH)
   
      digit_parts << text[offset]
    end
    #use the concatenated string to lookup the actual digit
    TO_DIGIT.value?(digit) ?  TO_DIGIT.key(digit) : "?" 
  end


end
require_relative '../lib/file_reader'
require_relative '../lib/parser'
require_relative '../lib/account'

class BankOCR

    NEW_LINE = "\n"
  
    fr = FileReader.new("test/files/bankocr.txt")
    parser = Parser.new
    
    fr.chunk do | chunk |
      account_number = parser.parse(chunk)
      account = Account.new(account_number)
      if account.number.include?("?")
        message = " ILL"
      else
        account.checksum? ? message =  message =  "" : message =  " ERR"
      end
      
      
      File.open("output/output.txt","a+") {|f| f.puts(account.number + message + NEW_LINE) }
      
      
  end

end
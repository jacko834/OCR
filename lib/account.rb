
class Account
  
  attr_reader :number
  

  def initialize(number)
    @number = number
  end



  def checksum?

      checksum % 11 == 0 ? true : false

  end
  
  private
  def checksum
    
    (0..@number.length).reduce() do |total , index|

      total += @number[index-1].to_i * ( @number.length - (index-1) )
      
    end

  end


  
  
end
require_relative "../lib/account"
require "minitest/autorun"

class AccountTest < MiniTest::Test
  


  def test_valid_checksum
    
    account = Account.new("012000000")
    
    assert_equal(true , account.checksum?)

  end



  def test_invalid_checksum

    account = Account.new("012300000")

    assert_equal(false , account.checksum?)

  end
  
end
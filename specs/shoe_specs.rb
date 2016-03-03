require('minitest/autorun')
require('minitest/rg')
require_relative('../models/shoes')

class TestShoe < MiniTest::Test

  def setup
   options = {
    'first_name' => 'Sam',
    'last_name' => 'Parkyn',
    'address' => '4/7 Infirmary Street EH1 1LT Edinburgh',
    'quantity' => '2',
    'size' => '8'
   }

   @shoe = Shoe.new(options)
  end


  def test_first_name()
    assert_equal("Sam", @shoe.first_name())
  end

  def test_last_name()
    assert_equal("Parkyn", @shoe.last_name())
  end

  def test_space_between_names()
    assert_equal("Sam Parkyn", @shoe.space_between_names())
  end

  def test_total()
    assert_equal(90, @shoe.total())

  end

end
require( 'minitest/autorun' )
require( 'minitest/rg')
require_relative( '../models/booking' )

class TestBooking < MiniTest::Test

  def setup
    options = {
        'first_name' => 'Tony', 
        'last_name' => 'Goncalves', 
        'nights' => '3', 
        'check_in' => '10',
        'breakfast' => 'true',
        'type' => 'single'
      }
      @booking = Booking.new( options )
  end

  def test_first_name()
    assert_equal( 'Tony', @booking.first_name() )
  end

  def test_second_name()
    assert_equal( 'Goncalves', @booking.last_name() )
  end

  def test_pretty_name()
     assert_equal( 'Tony Goncalves', @booking.pretty_name() )
  end

  def test_nights()
    assert_equal( 3, @booking.nights() )
  end

  def test_breakfast()      
    assert_equal( 'true', @booking.breakfast() )
  end

  def test_total()
    assert_equal(180,@booking.total())
  end

  def test_type()
    assert_equal('single',@booking.type())
  end
end
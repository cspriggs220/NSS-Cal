require 'test/unit'
require './cal_integration'


class CalIntegrationTest < Test::Unit::TestCase

  def test_08_get_month
    cal = Cal.new(1, 2013)
    assert_equal(1, cal.month)
  end

  def test_09a_get_year
    cal = Cal.new(1, 2013)
    assert_equal(2013, cal.year)
  end

  def test_09b_incorrect_month_argument
    assert_raise ArgumentError do
    cal = Cal.new(0, 2013)
    end
  end

  def test_09c_incorrect_month_argument
    assert_raise ArgumentError do
    cal = Cal.new(15, 2013)
    end
  end

  def test_10_get_month_header
    cal = Cal.new(1, 2013)
    assert_equal("    January 2013    ", cal.month_header)
  end

  def test_11_get_month_header
    cal = Cal.new(6, 2001)
    assert_equal("     June 2001      ", cal.month_header)
  end

  def test_12_get_days_header
    cal = Cal.new(1, 2013)
    assert_equal("Su Mo Tu We Th Fr Sa", cal.days_header)
  end

  def test_13_get_full_header
    cal = Cal.new(3, 2003)
    assert_equal("     March 2003     ", cal.month_header)
    assert_equal("Su Mo Tu We Th Fr Sa", cal.days_header)
  end

  def test_14_is_leap_year
    cal = Cal.new(2, 2000)
    assert_equal true, cal.leap_year?
  end

  def test_15_is_leap_year
    cal = Cal.new(1, 1999)
    assert_equal false, cal.leap_year?
  end

  def test_16_first_day_of_the_month_january
    cal = Cal.new(1, 2013)
    assert_equal("Tu", cal.get_first_of_month)
  end

  def test_17_first_day_of_the_month_february
    cal = Cal.new(2, 2016)
    assert_equal("Mo", cal.get_first_of_month)
  end

  def test_18_first_day_of_the_month_weekend
    cal = Cal.new(10, 1803)
    assert_equal("Sa", cal.get_first_of_month)
  end

end
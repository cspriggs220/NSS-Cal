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

  def test_16a_first_day_of_the_month_january
    cal = Cal.new(1, 2013)
    assert_equal("Tu", cal.zeller_to_s)
  end

  def test_16b_first_day_of_the_month_january
    cal = Cal.new(1, 2013)
    assert_equal(3, cal.zeller)
  end

  def test_17_first_day_of_the_month_february
    cal = Cal.new(2, 2016)
    assert_equal("Mo", cal.zeller_to_s)
  end

  def test_18a_first_day_of_the_month_weekend
    cal = Cal.new(10, 1803)
    assert_equal("Sa", cal.zeller_to_s)
  end

  def test_18b_first_day_of_the_month_weekend
    cal = Cal.new(10, 1803)
    assert_equal(0, cal.zeller)
  end

  def test_19_get_correct_blank_space
    cal = Cal.new(10, 1803)
    assert_equal("                  ", cal.blank_space)
  end

  def test_20_get_correct_blank_space
    cal = Cal.new(1, 2014)
    assert_equal("         ", cal.blank_space)
  end

  def test_21_print_first_week
    cal = Cal.new(9, 2013)
    assert_equal(" 1  2  3  4  5  6  7\n", cal.print_week)
  end

  def test_22_print_first_week
    cal = Cal.new(9, 2014)
    assert_equal("    1  2  3  4  5  6\n", cal.print_week)
  end

  def test_23_print_first_week
    cal = Cal.new(10, 1803)
    assert_equal("                   1\n", cal.print_week)
  end

  # def test__print_first_week
  #   cal = Cal.new(10, 1803)
  #   assert_equal("                   1\n 2  3  4  5  6  7  8\n", cal.print_week)
  # end
end
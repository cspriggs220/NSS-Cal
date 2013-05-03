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
    assert_equal("    January 2013", cal.month_header)
  end

  def test_11_get_month_header
    cal = Cal.new(6, 2001)
    assert_equal("     June 2001", cal.month_header)
  end

  def test_12_get_days_header
    cal = Cal.new(1, 2013)
    assert_equal("Su Mo Tu We Th Fr Sa", cal.days_header)
  end

  def test_13_get_full_header
    cal = Cal.new(3, 2003)
    assert_equal("     March 2003", cal.month_header)
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
    assert_equal(3, cal.zeller)
  end

  # def test_17_first_day_of_the_month_february
  #   cal = Cal.new(2, 2016)
  #   assert_equal("Mo", cal.zeller_to_s)
  # end

  def test_18_first_day_of_the_month_weekend
    cal = Cal.new(10, 1803)
    assert_equal(0, cal.zeller)
  end

  def test_19a_get_amount_of_nil_units
    cal = Cal.new(6, 2011)
    assert_equal([nil,nil,nil], cal.nil_units)
  end

  def test_19b_get_amount_of_nil_units
    cal = Cal.new(10, 1803)
    assert_equal([nil,nil,nil,nil,nil,nil], cal.nil_units)
  end

  def test_20a_get_month_array_with_nil_units
    cal = Cal.new(2, 2013)
    assert_equal([nil, nil, nil, nil, nil, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28], cal.month_array_with_nil_units)
  end

  def test_21_get_formatted_weeks
    cal = Cal.new(9, 2013)
    expected = <<EOS
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29 30
EOS
    assert_equal(expected, cal.format_month)
  end

  def test_22_print_first_week
    cal = Cal.new(9, 2014)
    assert_equal("    1  2  3  4  5  6\n", cal.get_week(1))
  end

  def test_23_print_sixth_week
    cal = Cal.new(03, 2013)
    assert_equal("31\n", cal.get_week(6))
  end

  def test_24_print_month
    cal = Cal.new(5, 2013)
    expected = <<EOS
      May 2013
Su Mo Tu We Th Fr Sa
          1  2  3  4
 5  6  7  8  9 10 11
12 13 14 15 16 17 18
19 20 21 22 23 24 25
26 27 28 29 30 31

EOS
    assert_equal(expected, cal.format_calendar)
  end

  def test_25_print_month
    cal = Cal.new(11, 3000)
    expected = <<EOS
   November 3000
Su Mo Tu We Th Fr Sa
                   1
 2  3  4  5  6  7  8
 9 10 11 12 13 14 15
16 17 18 19 20 21 22
23 24 25 26 27 28 29
30
EOS
    assert_equal(expected, cal.format_calendar)
  end


end
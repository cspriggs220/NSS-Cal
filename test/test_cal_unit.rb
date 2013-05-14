require 'test/unit'
require './cal_integration'
require './cal_year'

class CalIntegrationTest < Test::Unit::TestCase

  def test_12a_access_new_month_instance
    cal = CalMonth.new(1, 2013)
    assert_equal(1, cal.month)
  end

  def test_13a_access_new_year_instance
    cal = CalMonth.new(1, 2013)
    assert_equal(2013, cal.year)
  end

  def test_14a_get_month_header
    cal = CalMonth.new(1, 2013)
    assert_equal('    January 2013', cal.month_header)
  end

  def test_15a_get_month_header
    cal = CalMonth.new(6, 2001)
    assert_equal('     June 2001', cal.month_header)
  end

  def test_12_get_full_header
    cal = CalMonth.new(3, 2003)
    expected = <<EOS
     March 2003
Su Mo Tu We Th Fr Sa
EOS
    assert_equal(expected, cal.full_header)
  end

  def test_13_is_leap_year
    cal = CalMonth.new(2, 2000)
    assert_equal true, cal.leap_year?
  end

  def test_14_is_leap_year
    cal = CalMonth.new(1, 1999)
    assert_equal false, cal.leap_year?
  end

  def test_15_first_day_of_the_month_january
    cal = CalMonth.new(1, 2013)
    assert_equal(3, cal.zeller)
  end

  def test_16_first_day_of_the_month_weekend
    cal = CalMonth.new(10, 1803)
    assert_equal(0, cal.zeller)
  end

  def test_17_get_amount_of_weeks_in_month
    cal = CalMonth.new(2, 2037)
    assert_equal(4, cal.all_weeks_in_month_array.size)
  end

  def test_18_get_amount_of_nil_units
    cal = CalMonth.new(6, 2011)
    assert_equal([nil, nil, nil], cal.blank_space_units)
  end

  def test_19_get_amount_of_nil_units
    cal = CalMonth.new(10, 1803)
    expected = [nil, nil, nil, nil, nil, nil]
    assert_equal(expected, cal.blank_space_units)
  end

  def test_20_get_month_array_with_nil_units
    cal = CalMonth.new(2, 2013)
    expected = [nil, nil, nil, nil, nil, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12,
     13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28]
    assert_equal(expected, cal.month_array_includes_blank_units)
  end

  def test_21_get_formatted_weeks
    cal = CalMonth.new(9, 2013)
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
    cal = CalMonth.new(9, 2014)
    assert_equal("    1  2  3  4  5  6", cal.get_week(1))
  end

  def test_23a_print_sixth_week
    cal = CalMonth.new(03, 2013)
    assert_equal("31                  ", cal.get_week(6))
  end

  def test_23b_print_sixth_week
    cal = CalMonth.new(1, 2013)
    assert_equal("                    ", cal.get_week(6))
  end

  def test_24_print_month
    cal = CalMonth.new(5, 2013)
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

  def test_25_print_six_week_month
    cal = CalMonth.new(11, 3000)
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
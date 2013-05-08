require 'test/unit'
require './cal_integration'
require './cal_year'

class CalIntegrationTest < Test::Unit::TestCase

  def test_26_print_year_header
    cal = CalYear.new(2013)
    expected = <<EOS
                             2013

EOS
    assert_equal(expected, cal.year_header)
  end

  def test_27_print_month_header
    cal = CalYear.new(2013)
    expected = <<EOS
      January               February               March
EOS
    assert_equal(expected, cal.month_header)
  end

  def test_28_print_days_of_week
    cal = CalYear.new(2013)
    expected = <<EOS
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
EOS
    assert_equal(expected, cal.days_header)
  end

  def test_29_print_first_week
    cal = CalYear.new(2013)
    expected = <<EOS
       1  2  3  4  5                  1  2                  1  2
EOS
    assert_equal(expected, cal.print_weeks)
  end

end
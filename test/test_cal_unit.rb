require 'test/unit'
require './cal_integration'


class CalIntegrationTest < Test::Unit::TestCase

  def test_08_get_month
    cal = Cal.new(1, 2013)
    assert_equal(1, cal.month)
  end

  def test_09_get_year
    cal = Cal.new(1, 2013)
    assert_equal(2013, cal.year)
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
end
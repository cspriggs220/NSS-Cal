require 'test/unit'
require './cal_integration'

class CalIntegrationTest < Test::Unit::TestCase

  # def test_01_leap_year_integration
  #   assert_equal(`cal 2 2012`,`ruby cal_integration.rb 2 2012`)
  # end

  def test_02_common_year_integration
#     expected = <<EOS
#    February 1999
# Su Mo Tu We Th Fr Sa
#     1  2  3  4  5  6
#  7  8  9 10 11 12 13
# 14 15 16 17 18 19 20
# 21 22 23 24 25 26 27
# 28

# EOS
    calendar = Cal.new(2, 1999)
    assert_equal(`cal 2 1999`, calendar.format_calendar)
  end

  def test_03_leap_century_400_year_integration
    calendar = Cal.new(2, 2000)
    assert_equal(`cal 2 2000`, calendar.format_calendar)
  end

  # def test_04_common_century_100_year_integration
  #   assert_equal(`cal 2 2100`,`ruby cal_integration.rb 2 2100`)
  # end

  # def test_05_month_with_4_weeks_integration
  #   assert_equal(`cal 2 2037`,`ruby cal_integration.rb 2 2037`)
  # end

  def test_06_month_with_5_weeks_integration
    calendar = Cal.new(4, 2013)
    assert_equal(`cal 4 2013`, calendar.format_calendar)
  end

  def test_07_month_with_6_weeks_integration
    calendar = Cal.new(6, 2013)
    assert_equal(`cal 6 2013`, calendar.format_calendar)
  end
end
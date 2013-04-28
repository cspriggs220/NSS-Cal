require 'test/unit'

class CalIntegrationTest < Test::Unit::TestCase

  def test_01_leap_year_integration
    assert_equal(`cal 2 2012`,`ruby cal_integration.rb 2 2012`)
  end

  def test_02_non_leap_year_integration
    assert_equal(`cal 2 1999`,`ruby cal_integration.rb 2 1999`)
  end

  def test_03_century_400_year_leap_integration
    assert_equal(`cal 2 2000`,`ruby cal_integration.rb 2 2000`)
  end

  def test_04_century_100_year_non_leap_integration
    assert_equal(`cal 2 2100`,`ruby cal_integration.rb 2 2100`)
  end

  def test_05_month_with_4_weeks_integration
    assert_equal(`cal 2 2037`,`ruby cal_integration.rb 2 2037`)
  end

  def test_06_month_with_5_weeks_integration
    assert_equal(`cal 4 2013`,`ruby cal_integration.rb 4 2013`)
  end

  def test_07_month_with_6_weeks_integration
    assert_equal(`cal 6 2013`,`ruby cal_integration.rb 6 2013`)
  end
end
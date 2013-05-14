require 'test/unit'
require './cal_integration'

class CalIntegrationTest < Test::Unit::TestCase

  def test_01_leap_year
    assert_equal(`cal 2 2012`, `ruby cal.rb 2 2012`)
  end

  def test_02_common_year
    assert_equal(`cal 2 1999`, `ruby cal.rb 2 1999`)
  end

  def test_03_every_400_years_is_a_leap_year
    assert_equal(`cal 2 2000`, `ruby cal.rb 2 2000`)
  end

  def test_04_most_centuries_divisible_by_100_are_common
    assert_equal(`cal 2 2100`, `ruby cal.rb 2 2100`)
  end

  def test_05_month_with_4_weeks
    assert_equal(`cal 2 2037`, `ruby cal.rb 2 2037`)
  end

  def test_06_month_with_5_weeks
    assert_equal(`cal 4 2013`, `ruby cal.rb 4 2013`)
  end

  def test_07_month_with_6_weeks
    assert_equal(`cal 6 2013`, `ruby cal.rb 6 2013`)
  end

  def test_08a_returns_full_year_if_no_month_given
    assert_equal(`cal 1830`, `ruby cal.rb 1830`)
  end

  def test_08b_returns_full_year_if_no_month_given
    assert_equal(`cal 2278`, `ruby cal.rb 2278`)
  end

  def test_08c_returns_full_year_if_no_month_given
    assert_equal(`cal 1904`, `ruby cal.rb 1904`)
  end

  def test_09_returns_current_month_if_no_arguments_given
    assert_equal(`cal`, `ruby cal.rb`)
  end

  def test_10_bad_month_argument
    assert_equal(`cal 0 2012`, `ruby cal.rb 0 2012`)
  end

  def test_11_bad_month_argument
    assert_equal(`cal 14 2012`, `ruby cal.rb 14 2012`)
  end

end
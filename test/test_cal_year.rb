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

  def test_27_print_month_headers
    cal = CalYear.new(2013)
    expected =
["      January       ",
 "      February      ",
 "       March        ",
 "       April        ",
 "        May         ",
 "        June        ",
 "        July        ",
 "       August       ",
 "     September      ",
 "      October       ",
 "      November      ",
 "      December      "]
    assert_equal(expected, cal.months_header)
  end

  def test_28_print_days_of_week
    cal = CalYear.new(2013)
    expected = <<EOS
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
EOS
    assert_equal(expected, cal.days_header)
  end

#   def test_29a_print_3_months
#     cal = CalYear.new(2013)
#     expected = <<EOS
#       January               February               March
# Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
#        1  2  3  4  5                  1  2                  1  2
#  6  7  8  9 10 11 12   3  4  5  6  7  8  9   3  4  5  6  7  8  9
# 13 14 15 16 17 18 19  10 11 12 13 14 15 16  10 11 12 13 14 15 16
# 20 21 22 23 24 25 26  17 18 19 20 21 22 23  17 18 19 20 21 22 23
# 27 28 29 30 31        24 25 26 27 28        24 25 26 27 28 29 30
#                                             31
# EOS
#     assert_equal(expected, cal.format_year)
#   end

#   def test_29b_print_3_months
#     cal = CalYear.new(2013)
#     expected = <<EOS
#       January               February               March
# Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
#        1  2  3  4  5                  1  2                  1  2
#  6  7  8  9 10 11 12   3  4  5  6  7  8  9   3  4  5  6  7  8  9
# 13 14 15 16 17 18 19  10 11 12 13 14 15 16  10 11 12 13 14 15 16
# 20 21 22 23 24 25 26  17 18 19 20 21 22 23  17 18 19 20 21 22 23
# 27 28 29 30 31        24 25 26 27 28        24 25 26 27 28 29 30
#                                             31
#        April                  May                   June
# Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
#     1  2  3  4  5  6            1  2  3  4                     1
#  7  8  9 10 11 12 13   5  6  7  8  9 10 11   2  3  4  5  6  7  8
# 14 15 16 17 18 19 20  12 13 14 15 16 17 18   9 10 11 12 13 14 15
# 21 22 23 24 25 26 27  19 20 21 22 23 24 25  16 17 18 19 20 21 22
# 28 29 30              26 27 28 29 30 31     23 24 25 26 27 28 29
#                                             30
# EOS
#     assert_equal(expected, cal.format_year)
#   end

#   def test_29c_print_next_3_months
#     cal = CalYear.new(2013)
#     expected = <<EOS
#       January               February               March
# Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
#        1  2  3  4  5                  1  2                  1  2
#  6  7  8  9 10 11 12   3  4  5  6  7  8  9   3  4  5  6  7  8  9
# 13 14 15 16 17 18 19  10 11 12 13 14 15 16  10 11 12 13 14 15 16
# 20 21 22 23 24 25 26  17 18 19 20 21 22 23  17 18 19 20 21 22 23
# 27 28 29 30 31        24 25 26 27 28        24 25 26 27 28 29 30
#                                             31
#        April                  May                   June
# Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
#     1  2  3  4  5  6            1  2  3  4                     1
#  7  8  9 10 11 12 13   5  6  7  8  9 10 11   2  3  4  5  6  7  8
# 14 15 16 17 18 19 20  12 13 14 15 16 17 18   9 10 11 12 13 14 15
# 21 22 23 24 25 26 27  19 20 21 22 23 24 25  16 17 18 19 20 21 22
# 28 29 30              26 27 28 29 30 31     23 24 25 26 27 28 29
#                                             30
#         July                 August              September
# Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
#     1  2  3  4  5  6               1  2  3   1  2  3  4  5  6  7
#  7  8  9 10 11 12 13   4  5  6  7  8  9 10   8  9 10 11 12 13 14
# 14 15 16 17 18 19 20  11 12 13 14 15 16 17  15 16 17 18 19 20 21
# 21 22 23 24 25 26 27  18 19 20 21 22 23 24  22 23 24 25 26 27 28
# 28 29 30 31           25 26 27 28 29 30 31  29 30

# EOS
#     assert_equal(expected, cal.format_year)
#   end

  def test_29d_print_last_3_months
    cal = CalYear.new(2013)
    expected = <<EOS
      January               February               March
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
       1  2  3  4  5                  1  2                  1  2
 6  7  8  9 10 11 12   3  4  5  6  7  8  9   3  4  5  6  7  8  9
13 14 15 16 17 18 19  10 11 12 13 14 15 16  10 11 12 13 14 15 16
20 21 22 23 24 25 26  17 18 19 20 21 22 23  17 18 19 20 21 22 23
27 28 29 30 31        24 25 26 27 28        24 25 26 27 28 29 30
                                            31
       April                  May                   June
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
    1  2  3  4  5  6            1  2  3  4                     1
 7  8  9 10 11 12 13   5  6  7  8  9 10 11   2  3  4  5  6  7  8
14 15 16 17 18 19 20  12 13 14 15 16 17 18   9 10 11 12 13 14 15
21 22 23 24 25 26 27  19 20 21 22 23 24 25  16 17 18 19 20 21 22
28 29 30              26 27 28 29 30 31     23 24 25 26 27 28 29
                                            30
        July                 August              September
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
    1  2  3  4  5  6               1  2  3   1  2  3  4  5  6  7
 7  8  9 10 11 12 13   4  5  6  7  8  9 10   8  9 10 11 12 13 14
14 15 16 17 18 19 20  11 12 13 14 15 16 17  15 16 17 18 19 20 21
21 22 23 24 25 26 27  18 19 20 21 22 23 24  22 23 24 25 26 27 28
28 29 30 31           25 26 27 28 29 30 31  29 30

      October               November              December
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
       1  2  3  4  5                  1  2   1  2  3  4  5  6  7
 6  7  8  9 10 11 12   3  4  5  6  7  8  9   8  9 10 11 12 13 14
13 14 15 16 17 18 19  10 11 12 13 14 15 16  15 16 17 18 19 20 21
20 21 22 23 24 25 26  17 18 19 20 21 22 23  22 23 24 25 26 27 28
27 28 29 30 31        24 25 26 27 28 29 30  29 30 31

EOS
    assert_equal(expected, cal.format_year)
  end

  def test_30_print_formatted_month_header
    cal = CalYear.new(2013)
    expected =
["      January               February               March\n",
"       April                  May                   June\n",
"        July                 August              September\n",
"      October               November              December\n"]
    assert_equal(expected, cal.format_month_header)
  end

end
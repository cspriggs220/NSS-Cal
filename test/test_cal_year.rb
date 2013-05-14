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

  def test_30_print_formatted_month_header
    cal = CalYear.new(2013)
    expected =
["      January               February               March\n",
"       April                  May                   June\n",
"        July                 August              September\n",
"      October               November              December\n"]
    assert_equal(expected, cal.format_month_header)
  end

  def test_31_print_full_year
    cal = CalYear.new(3000)
    expected = <<EOS
                             3000

      January               February               March
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
          1  2  3  4                     1                     1
 5  6  7  8  9 10 11   2  3  4  5  6  7  8   2  3  4  5  6  7  8
12 13 14 15 16 17 18   9 10 11 12 13 14 15   9 10 11 12 13 14 15
19 20 21 22 23 24 25  16 17 18 19 20 21 22  16 17 18 19 20 21 22
26 27 28 29 30 31     23 24 25 26 27 28     23 24 25 26 27 28 29
                                            30 31
       April                  May                   June
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
       1  2  3  4  5               1  2  3   1  2  3  4  5  6  7
 6  7  8  9 10 11 12   4  5  6  7  8  9 10   8  9 10 11 12 13 14
13 14 15 16 17 18 19  11 12 13 14 15 16 17  15 16 17 18 19 20 21
20 21 22 23 24 25 26  18 19 20 21 22 23 24  22 23 24 25 26 27 28
27 28 29 30           25 26 27 28 29 30 31  29 30
                                            
        July                 August              September
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
       1  2  3  4  5                  1  2      1  2  3  4  5  6
 6  7  8  9 10 11 12   3  4  5  6  7  8  9   7  8  9 10 11 12 13
13 14 15 16 17 18 19  10 11 12 13 14 15 16  14 15 16 17 18 19 20
20 21 22 23 24 25 26  17 18 19 20 21 22 23  21 22 23 24 25 26 27
27 28 29 30 31        24 25 26 27 28 29 30  28 29 30
                      31                    
      October               November              December
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
          1  2  3  4                     1      1  2  3  4  5  6
 5  6  7  8  9 10 11   2  3  4  5  6  7  8   7  8  9 10 11 12 13
12 13 14 15 16 17 18   9 10 11 12 13 14 15  14 15 16 17 18 19 20
19 20 21 22 23 24 25  16 17 18 19 20 21 22  21 22 23 24 25 26 27
26 27 28 29 30 31     23 24 25 26 27 28 29  28 29 30 31
                      30                    
EOS
    assert_equal(expected, cal.format_year)
  end

  def test_32_print_full_year
    cal = CalYear.new(3000)
    expected = "                             3000\n\n      January               February               March\nSu Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa\n          1  2  3  4                     1                     1\n 5  6  7  8  9 10 11   2  3  4  5  6  7  8   2  3  4  5  6  7  8\n12 13 14 15 16 17 18   9 10 11 12 13 14 15   9 10 11 12 13 14 15\n19 20 21 22 23 24 25  16 17 18 19 20 21 22  16 17 18 19 20 21 22\n26 27 28 29 30 31     23 24 25 26 27 28     23 24 25 26 27 28 29\n                                            30 31\n       April                  May                   June\nSu Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa\n       1  2  3  4  5               1  2  3   1  2  3  4  5  6  7\n 6  7  8  9 10 11 12   4  5  6  7  8  9 10   8  9 10 11 12 13 14\n13 14 15 16 17 18 19  11 12 13 14 15 16 17  15 16 17 18 19 20 21\n20 21 22 23 24 25 26  18 19 20 21 22 23 24  22 23 24 25 26 27 28\n27 28 29 30           25 26 27 28 29 30 31  29 30\n                                            \n        July                 August              September\nSu Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa\n       1  2  3  4  5                  1  2      1  2  3  4  5  6\n 6  7  8  9 10 11 12   3  4  5  6  7  8  9   7  8  9 10 11 12 13\n13 14 15 16 17 18 19  10 11 12 13 14 15 16  14 15 16 17 18 19 20\n20 21 22 23 24 25 26  17 18 19 20 21 22 23  21 22 23 24 25 26 27\n27 28 29 30 31        24 25 26 27 28 29 30  28 29 30\n                      31                    \n      October               November              December\nSu Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa\n          1  2  3  4                     1      1  2  3  4  5  6\n 5  6  7  8  9 10 11   2  3  4  5  6  7  8   7  8  9 10 11 12 13\n12 13 14 15 16 17 18   9 10 11 12 13 14 15  14 15 16 17 18 19 20\n19 20 21 22 23 24 25  16 17 18 19 20 21 22  21 22 23 24 25 26 27\n26 27 28 29 30 31     23 24 25 26 27 28 29  28 29 30 31\n                      30                    \n"
    assert_equal(expected, cal.format_year)
  end

end
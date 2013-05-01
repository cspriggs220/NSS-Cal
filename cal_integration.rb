class Cal
  attr_reader :month, :year

  # month = ARGV[0]
  # year = ARGV[1]

  # puts `cal #{month} #{year}`

  def initialize(month, year)
    raise ArgumentError, "Month was not recognize. Must be between 1..12" if month <= 0 || month > 12
    @month = month
    @year = year
  end

  # def print_month_year(month, year)
  # end

  def find_month
    month = @month
    cal_array = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    cal_array[month-1]
  end

  def month_header
    month = find_month
    year = @year.to_s
    header = "#{month} #{year}"
    header.center(20)
  end

  def days
    days = %w{Su Mo Tu We Th Fr Sa}
  end

  def days_header
    days.join(" ")
  end

  def zeller
    m = @month
    y = @year
    q = 1
    if m < 3 # for Jan/Feb, use modified m and y values
      y = y - 1
      m += 12
    end
    h = (q + (m+1)*26/10 + y + y/4 + 6*(y/100) + y/400) % 7
  end # returns integer for first day of month
  # 0 = Sa; 1 = Sun; 2 = Mo; 3 = Tu; 4 = We; 5 = Th; 6 = Fr

  def zeller_to_s
    days[zeller-1]
  end

  def numbers_in_month
    long_month = [1, 3, 5, 7, 8, 10, 12]
    short_month = [4, 6, 9, 11]
    if long_month.include?(month)
       (1..31).to_a
    elsif short_month.include?(month)
       (1..30).to_a
    elsif leap_year?
       (1..29).to_a
    else
       (1..28).to_a
    end
  end # returns an array of the number of days in the selected month

  def numbers_joined
    numbers_in_month.join(" ")
  end

  def blank_space
    # below is desired refactored code, but getting NoMethodError
    # put zeller in order from Sun to Sat
    # if zeller == 0
    #   zeller = 6
    # else
    #   zeller - 1
    # end
    # "   " * zeller
    if zeller == 1
      ""
    elsif zeller == 2
      "   "
    elsif zeller == 3
      "      "
    elsif zeller == 4
      "         "
    elsif zeller == 5
      "            "
    elsif zeller == 6
      "               "
    else zeller == 0
      "                  "
    end
  end

# sa (z of 0, range of 7)
# su (z of 1, range of 6)
# mo (z of 2, range of 5)
# tu (z of 3, range of 4)
# we (z of 4, range of 3)
# th (z of 5, range of 2)
# fr (z of 6, range of 1)
# upper_range = 7 - z

  def print_week
    if zeller == 0
      upper_range = 0
      # second_week = upper_range + 1
    else
      upper_range = (7 - zeller)
      # second_week = upper_range + 1
    end
    week = " " + blank_space + numbers_in_month[0..upper_range].join("  ") + "\n"
    # zip enumerable?
    # grab the next 7 days; stick it in second week
    # grab the next 7
    # if the number is one digit, add a blank space to the left?
  end

  def format_month(month, year) # line breaks
  end

  def leap_year?
    year = @year
    if year % 400 == 0
      true
    elsif year % 100 == 0
      false
    elsif year % 4 == 0
      true
    else
      false
    end
  end

    #  Cal implemented in IRB to show newline chars "   February 2000\nSu Mo Tu We Th Fr Sa\n       1  2  3  4  5\n 6  7  8  9 10 11 12\n13 14 15 16 17 18 19\n20 21 22 23 24 25 26\n27 28 29\n\n"
end
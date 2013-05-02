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
    if m < 3
      y = y - 1
      m += 12
    end
    h = (q + (m+1)*26/10 + y + y/4 + 6*(y/100) + y/400) % 7
  end # 0 = Sa; 1 = Sun; 2 = Mo; 3 = Tu; 4 = We; 5 = Th; 6 = Fr

  def zeller_to_s
    days[zeller-1]
  end # currently unused

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
  end # an array of the number of days in the selected month

  def numbers_joined
    numbers_in_month.join(" ")
  end # currently unused

  def nil_units
    if zeller == 1
      days = []
    elsif zeller == 0
      days = [nil] * 6
    else
      days = [nil] * (zeller - 1)
    end
  end # places nil in place of blank space for first week of month

  def month_array_with_nil_units
    numbers_in_month.unshift(nil_units).flatten
  end # array with correct amount of nil units before days

# method for mapping
# method for printing (rjust)
# ljust rjust
# each_slice to grab n chunks of an array
# create simple methods that do 1 thing

# sa (z of 0, range of 7)
# su (z of 1, range of 6)
# mo (z of 2, range of 5)
# tu (z of 3, range of 4)
# we (z of 4, range of 3)
# th (z of 5, range of 2)
# fr (z of 6, range of 1)
# upper_range = 7 - z

  # def print_week (week)
  #   if zeller == 0
  #     upper_range = 0
  #   else
  #     upper_range = (7 - zeller)
  #   end
  #   if week == 1
  #     output = " " + blank_space + numbers_in_month[0..upper_range].join("  ") + "\n"
  #   elsif week == 2
  #     if zeller == 0
  #       output = " " + numbers_in_month[(upper_range+1),7].join("  ") + "\n"
  #     end
  #   end
    # increment through the numbers_in_month array,
    # pulling out the dates for the week,
    # appending a \n at the end of seven days
    # until the array is empty
    # current_day = 0
    # week = 1
    # current_week = numbers_in_month[current_day..upper_range].join("  ")
    # while week <= 2
    #   if week == 1
    #     output = " " + blank_space + current_week + "\n"
    #   else
    #     current_day = (upper_range + 1)
    #     upper_range = (current_day + 6)
    #     current_week = numbers_in_month[current_day..upper_range].join("  ")
    #     output += " " + current_week + "\n"
    #   end
    #   week += 1
    # end
    # output
  # end

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

    #    October 1803\n
    #Su Mo Tu We Th Fr Sa\n
    #                   1\n
    # 2  3  4  5  6  7  8\n
    # 9 10 11 12 13 14 15\n
    #16 17 18 19 20 21 22\n
    #23 24 25 26 27 28 29\n
    #30 31\n"
end
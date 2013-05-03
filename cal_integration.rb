class Cal
  MONTHS = %w{ January February March April May June July August September October November December }

  attr_reader :month, :year


  def initialize(month, year)
    raise ArgumentError, "Month was not recognize. Must be between 1..12" if month <= 0 || month > 12
    @month = month
    @year = year
  end

  # def find_month
    # month = @month
    # cal_array = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    # cal_array[month-1]
  # end # used MONTHS constant instead + moved to header

  def month_header
    month_name = MONTHS[@month-1]
    "#{month_name} #{year}".center(20).rstrip
  end

  def days_header
    %w{Su Mo Tu We Th Fr Sa}.join(" ")
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

  # def zeller_to_s
  #   days_header[zeller]
  # end # currently unused

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
  end # array of the number of days in the selected month

  # def numbers_joined
  #   numbers_in_month.join(" ")
  # end # currently unused

  def nil_units
    if zeller == 1
      days = []
    elsif zeller == 0
      days = [nil] * 6
    else
      days = [nil] * (zeller - 1)
    end
  end # puts nil in place of blank space for first week of month

  def month_array_with_nil_units
    numbers_in_month.unshift(nil_units).flatten
  end # single array with correct amount of nil units before days

  def all_weeks_in_month_array
    month_array_with_nil_units.each_slice(7).to_a
  end # given month array with each week in it's own array

  def format_month
    month = ""
    all_weeks_in_month_array.each do |week_array|
      week_array.collect! do | date |
        date.to_s.rjust(2)
      end
      week = week_array.join(" ") + "\n"
      month += week
    end
    month
  end # a string with the whole month correctly formatted

  def format_weeks
    week_total = []
    all_weeks_in_month_array.each do |week_array|
      week_array.collect! do |date|
        date.to_s.rjust(2)
      end
      week = week_array.join(" ") + "\n"
      week_total << week
    end
    week_total
  end # array of weeks for given month correctly formatted

  def get_week (n)
    format_weeks[n-1]
  end # returns n week for given month

  def format_calendar
    output = month_header
    output << "\n"
    output << days_header + "\n"
    if all_weeks_in_month_array.size == 4
      output << format_month + "\n\n"
    elsif all_weeks_in_month_array.size == 6
      output << format_month
    else
      output << format_month + "\n"
    end
  end # returns month fully formatted

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

end
class Cal
  MONTHS = %w{ January February March April May June July August September October November December }

  attr_reader :month, :year



  def initialize(month, year)  # look into using month = nil, year = nil
    # if month && year
    @month = month
    @year = year
    raise ArgumentError, "#{month} was not recognized. Must be between 1..12" if month <= 0 || month > 12
    # elsif month && year.nil?
    # else
      # FOR CURRENT MONTH
      # @month = Time.now.to_i
      # @year = Time.now.year.to_i
    # end
  end

  def month_header
    month_name = MONTHS[@month-1]
    "#{month_name} #{year}".center(20).rstrip
  end

  def days_header
    "Su Mo Tu We Th Fr Sa"
  end

  def zeller
    # See http://en.wikipedia.org/wiki/Zeller's_congruence for an explanation of Zeller's congruence.
    m = @month
    y = @year
    q = 1
    if m < 3
      y = y - 1
      m += 12
    end
    h = (q + (m+1)*26/10 + y + y/4 + 6*(y/100) + y/400) % 7
  end # 0 = Sa; 1 = Sun; 2 = Mo; 3 = Tu; 4 = We; 5 = Th; 6 = Fr

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

  def nil_blank_space_units
    if zeller == 1
      days = []
    elsif zeller == 0
      days = [nil] * 6
    else
      days = [nil] * (zeller - 1)
    end
  end # puts nil in place of blank space for first week of month

  def month_array_with_nil_units
    numbers_in_month.unshift(nil_blank_space_units).flatten
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

end
class CalMonth
  MONTHS = %w{ January February March April May June July August September October November December }
  DAYS = 'Su Mo Tu We Th Fr Sa'

  attr_reader :month, :year

  def initialize(month = nil, year = nil)
    if month && year
      @month = month
      @year = year
      raise ArgumentError, "#{month} was not recognized. Must be between 1..12" if month <= 0 || month > 12
      raise ArgumentError, "Year is invalid. Please select year between 1800 and 3000." if year < 1800 || year > 3000
    elsif month && year.nil?
      raise ArgumentError, "Please provide a valid year."
    else
      raise ArgumentError, "Please provide a month and a year."
    end
  end

  def month_header
    month_name = MONTHS[@month - 1]
    "#{month_name} #{year}".center(20).rstrip
  end

  def full_header
    output = month_header + "\n"
    output << DAYS + "\n"
  end

  def zeller
    # See http://en.wikipedia.org/wiki/Zeller's_congruence for an explanation of Zeller's congruence.
    m = @month
    y = @year
    if m < 3
      y = y - 1
      m += 12
    end
    (1 + (((m + 1) * 26) / 10) + y + (y / 4) + 6 * (y / 100) + (y / 400)) % 7
  end

  def leap_year?
    # See http://en.wikipedia.org/wiki/Leap_year for explanation of leap year edgecases.
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

  def days_in_month
    months_with_31_days = [1, 3, 5, 7, 8, 10, 12]
    months_with_30_days = [4, 6, 9, 11]
    if months_with_31_days.include?(month)
      (1..31).to_a
    elsif months_with_30_days.include?(month)
      (1..30).to_a
    elsif leap_year?
      (1..29).to_a
    else
      (1..28).to_a
    end
  end

  def blank_space_units
    case zeller
    when 1
      []
    when 0
      [nil] * 6
    else
      [nil] * (zeller - 1)
    end
  end

  def month_array_includes_blank_units
    days_in_month.unshift(blank_space_units).flatten
  end

  def all_weeks_in_month_array
    month_array_includes_blank_units.each_slice(7).to_a
  end

  def format_month
    month = ""
    all_weeks_in_month_array.each do |week_array|
      week_array.collect! { | date | date.to_s.rjust(2) }
      week = week_array.join(" ") + "\n"
      month += week
    end
    month
  end

  def format_weeks
    week_total = []
    all_weeks_in_month_array.each do |week_array|
      week_array.collect! { |date| date.to_s.rjust(2) }
      week = week_array.join(" ")
      week_total << week
    end
    week_total
  end

  def get_week (n)
    format_weeks[n - 1]
  end

  def format_calendar
    output = full_header
    case all_weeks_in_month_array.size
    when 4
      output << format_month + "\n\n"
    when 6
      output << format_month
    else
      output << format_month + "\n"
    end
  end


end
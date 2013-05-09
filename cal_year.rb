require_relative "cal_integration"

class CalYear
  MONTHS = %w{ January February March April May June July August September October November December }
  DAYS = 'Su Mo Tu We Th Fr Sa'

  attr_reader :month, :year

  def initialize(year)
    @year = year
  end

  def year_header
    header = "#{year}".center(62).rstrip
    header += "\n\n"
  end

  def month_header # only works for first 3 months
    month_name = MONTHS[0..2]
    month_name.collect! {|name| "#{name}".center(20)}
    month_name.join("  ").rstrip + "\n"
  end

  def days_header
    header = ((DAYS + "  ") * 3).rstrip
    header += "\n"
  end

  def print_weeks
    # year = [CalMonth.new(1,2012), CalMonth.new(2,2012), CalMonth.new(3,2012)]
    week = []
    all_months = (1..3).to_a.map {|month| CalMonth.new(month, @year)}
    all_months.each_slice(3) { |months|
      (1..6).each {|i| months.map {|cal_month|
        week << cal_month.get_week(i)
        }
      }
    }
    print week
    # week_string = week.join("  ")
    # week_string += "\n"
  end

  def format_year
  end

end

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

  def months_header # only works for first 3 months
    month_name = MONTHS
    month_name.collect! {|name| "#{name}".center(20)}
    month_name #.join("  ").rstrip #+ "\n"
  end

  def days_header
    header = ((DAYS + "  ") * 3).rstrip
    header += "\n"
  end

  def create_months
    # year = [CalMonth.new(1,2012), CalMonth.new(2,2012), CalMonth.new(3,2012)]
    week = []
    all_months = (1..12).to_a.map {|month| CalMonth.new(month, @year)}
    all_months.each_slice(3) { |months|
      (1..6).each {|i| months.map {|cal_month|
        week << cal_month.get_week(i)
        }
      }
    }
    sub = week.each_slice(3).to_a
    puts sub
    sub.collect! {|w| w.join("  ").rstrip + "\n"}
  end

  def format_month_header # single array of string row
    months = months_header.each_slice(3).to_a
    months.collect! {|name|
      name.join("  ").rstrip + "\n"
    }
  end

  def format_year
    year = ""
    h = 0
    start = 0
    stop = 5

    while h < 4
      year += format_month_header[h]
      year += days_header
      year += create_months[start..stop].join("")
      start += 6
      stop += 6
      h += 1
    end
    year
      # year += format_month_header[1]
      # year += days_header
      # year += create_months[6..11].join("")

      # year += format_month_header[2]
      # year += days_header
      # year += create_months[12..17].join("")

      # year += format_month_header[3]
      # year += days_header
      # year += create_months[18..23].join("")
  end

end

class Cal
  attr_reader :month, :year

  # month = ARGV[0]
  # year = ARGV[1]

  # puts `cal #{month} #{year}`

  def initialize(month, year)
    @month = month
    @year = year
  end

  def print_month_year(month, year)
    # month_header
    # days_header
  end

  def find_month
    month = @month
    cal_array = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    get_month = cal_array[month-1]
  end

  def month_header
    month = find_month
    year = @year.to_s
    header = "#{month} #{year}"
    header.center(20)
  end

  def days_header
    "Su Mo Tu We Th Fr Sa"
  end

  # def get_first_of_month(month, year) # Zeller's C
  #   h = (q + [13(m+1)/5] + K + [K/4] + [J/4] - 2J) % 7
  #   h = # day of the week, 0 = Sat, 1=Sunday, 2= Monday...
  #   q = # day of the month
  #   m = # the month 3 = March, 4 = April, 5 = May
  #   K = # year of the century (year % 100)
  #   J = # the actual century (year/100)
  # end

  def format_month(month, year) # line breaks
  end

  def leap_year?
  end

end
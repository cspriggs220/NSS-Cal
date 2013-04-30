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
    get_month = cal_array[month-1]
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

  def get_first_of_month
    m = @month
    y = @year
    q = 1
    if m < 3 # for Jan/Feb, use modified m and y values
      y = y - 1
      m += 12
    end
    h = (q + (m+1)*26/10 + y + y/4 + 6*(y/100) + y/400) % 7
    days[h-1]
  end

  # def format_month(month, year) # line breaks
  # end

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

end
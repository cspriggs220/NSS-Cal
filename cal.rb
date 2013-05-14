require './cal_integration'
require './cal_year'

# month = ARGV[0].to_i
# year = ARGV[1].to_i

# cal = CalMonth.new(month, year)
# cal_year = CalYear.new(ARGV[0].to_i)


# if ARGV[1].nil?
#   puts cal_year.format_year
# else
#   puts cal.format_calendar
# # else ARGV[0].nil? && ARGV[1].nil?
#   # puts current month
# end


if ARGV[0] && ARGV[1]
  month = ARGV[0].to_i
  year = ARGV[1].to_i
  raise ArgumentError, "#{month} is neither a month number (1..12) nor a name" if month <= 0 || month > 12
  raise ArgumentError, "#{year} is invalid. Please select a year between 1800 and 3000" if year < 1800 || year > 3000
  cal = CalMonth.new(month, year)
  puts cal.format_calendar
elsif ARGV[0] && ARGV[1].nil?
  year = ARGV[0].to_i
  raise ArgumentError, "#{year} is invalid. Please select year between 1800 and 3000." if year < 1800 || year > 3000
  cal = CalYear.new(year)
  puts cal.format_year
else
  time = Time.new
  cal = CalMonth.new(time.month, time.year)
  puts cal.format_calendar
end

require './cal_integration'

month = ARGV[0]
year = ARGV[1]

cal = Cal.new(month.to_i, year.to_i)
cal.format_calendar


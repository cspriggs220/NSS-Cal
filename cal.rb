require './cal_integration'

month = ARGV[0].to_i
year = ARGV[1].to_i

cal = Cal.new(month, year)


puts cal.format_calendar


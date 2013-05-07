require './cal_integration'

month = ARGV[0].to_i
year = ARGV[1].to_i

cal = Cal.new(month, year)


puts cal.format_calendar

# write a conditional here that states, if ARGV[1].nil? print CalYear, else print CalMonth
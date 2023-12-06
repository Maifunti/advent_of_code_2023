require_relative 'processor'

sum = Processor.run ARGV[0]

puts "TOTAL = #{sum}"
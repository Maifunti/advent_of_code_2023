module Processor
  extend self

  def run(filename)
    calibrations = File.readlines(filename).each_with_index.map do |line, index|
      decode_line(line, index)
    end

    calibrations.sum
  end

  def decode_line(line, index)
    first, last = nil
    line.chars.each do |char|
      if /\d/ =~ char
        if first.nil?
          first = char
        end
        last = char
      end
    end

    raise "no digit on line #{index}" if first.nil?

    "#{first}#{last}".to_i
  end
end
require_relative 'spec_helper'
require_relative '../processor'

describe Processor do
  describe '.run' do
    {
      "#{__dir__}/files/test1.txt" => 142,
      "#{__dir__}/files/test2.txt" => 55172,
    }.each do |filename, expected|
      specify "processing #{filename} should produce #{expected}" do
        expect(Processor.run(filename)).to eq expected
      end
    end
  end

  describe '.decode_line' do
    {
      "1" => 11,
      "a1" => 11,
      "a12" => 12,
      "a123" => 13,
      "a1b2" => 12,
      "a1xb2" => 12,
      "a1b23c" => 13,
      "a1b23c4" => 14,
    }.each do |input, expected|
      specify "#{input} => #{expected}" do
        expect(Processor.decode_line(input, 3)).to eq expected
      end
    end

    [
      "",
      " ",
      "a",
    ].each do |input|
      specify "line with no number '#{input}' should raise" do
        expect { Processor.decode_line(input, 3) }.to raise_error "no digit on line 3"
      end
    end
  end
end
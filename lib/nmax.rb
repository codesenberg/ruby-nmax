require 'nmax/accumulator'
require 'nmax/extractor'
require 'nmax/version'

module Nmax
  def self.run
    # count of max numbers to return
    how_much = ARGV.shift.to_i

    accumulator = Nmax::Accumulator.new(how_much)

    ARGF.each_with_index { |line, i| accumulator.add(Nmax::Extractor.integers(line)) }

    puts accumulator.result.join(', ')
  end
end
require 'nmax/accumulator'
require 'nmax/extractor'
require 'nmax/version'

# Программа nmax принимает один аргумент (N) — кол-во чисел и
# осуществляет поиск N наибольших чисел во входном потоке (stdin).
module NMax
  def self.run
    how_much = (ARGV.shift || 100).to_i

    begin
      accumulator = NMax::Accumulator.new(how_much)

      ARGF.each_line do |line|
        accumulator.add(NMax::Extractor.integers(line))
      end

      puts accumulator.result.join(', ')
    rescue StandardError => ex
      STDERR.puts ex.message
    end
  end
end

require 'nmax/accumulator'
require 'nmax/extractor'
require 'nmax/scanner'
require 'nmax/version'

# Программа nmax принимает один аргумент (N) — кол-во чисел и
# осуществляет поиск N наибольших чисел во входном потоке (stdin).
module NMax
  def self.run
    how_much = (ARGV.shift || 100).to_i

    begin
      accumulator = NMax::Accumulator.new(how_much)

      scanner = Scanner.new(ARGF)
      accumulator.add(NMax::Extractor.integers(scanner.text)) while scanner.scan

      puts accumulator.result.join(', ')
    rescue StandardError => ex
      STDERR.puts ex.message
    end
  end
end

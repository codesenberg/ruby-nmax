module Nmax
  class Extractor
    class << self
      # @params [String]
      # @return [Array]
      # @example [12, 531, 901, 858567]
      def integers(str)
        purify(str).map(&:to_i)
      end

      # @params [String]
      # @return [Array]
      # @example ["12", "531", "901", "858567"]
      def purify(str)
        str.gsub(/\D/, ' ').split(' ')
      end
    end
  end
end
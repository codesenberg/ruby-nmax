module NMax
  # Extractor содержит вспомогательные методы для извлечения
  # чисел из строки.
  class Extractor
    class << self
      # @params str [String]
      # @return [Array]
      # @example [12, 531, 901, 858567]
      def integers(str)
        purify(str).map!(&:to_i)
      end

      # @params str [String]
      # @return [Array]
      # @example ["12", "531", "901", "858567"]
      # @note
      #   Очищает строку от некорректных последовательностей байт
      #   и находит в ней все числа.
      def purify(str)
        str.scrub.scan(/\d+/)
      end
    end
  end
end

require 'nmax/exceptions'

module NMax
  # Accumulator используется для инкрементального поиска
  # N наибольших чисел в некоей последовательности чисел.
  class Accumulator
    # @params
    #   size: [Fixnum]
    #   data: [Array] optional
    # @note
    #   Инициализируем аккумулятор размерности size,
    #   можно сразу передать массив чисел вторым параметром.
    def initialize(size, data = [])
      if size <= 0
        raise InvalidSizeError,
              "invalid size = #{size} provided"
      end
      @size = size
      @result = []

      update!(data)
    end

    # @params
    #   data: [Array] optional
    # @return [Accumulator]
    # @note
    #   В результат аккумулятора добавляем массив чисел,
    #   на выходе получаем сам объект аккумулятора.
    #   В итоге result будет возвращать массив размера не больше @size,
    #   где числа отсортированы по убыванию.
    def add(data)
      update!(data)
      self
    end

    def result
      @result.reverse
    end

    private

    def update!(data)
      new_elems = nil
      # Если найдено недостаточно чисел, то добавляем все.
      if @result.length < @size
        new_elems = data
      else
        # В противном случае, только те, что больше наименьшего из
        # найденных чисел.
        min = @result.first
        new_elems = data.select { |n| n > min }
      end

      # Если новых чисел не найденно, то @result уже содержит
      # n наибольших чисел в порядке возрастания.
      return if new_elems.length.zero?

      @result.concat(new_elems) && compact!
    end

    def compact!
      @result.sort!
      # Оставляем только @size наибольших чисел (конец массива после
      # сортировки).
      @result.slice!(0, @result.length - @size)
    end
  end
end

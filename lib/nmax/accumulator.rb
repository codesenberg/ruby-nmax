require 'nmax/exceptions'
require 'nmax/heap'

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
      @result = MinHeap.new()

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
      @result.to_a.sort.reverse
    end

    private

    def update!(data)
      idx = 0
      while @result.size < @size && idx < data.length
        @result.push(data[idx])
        idx += 1
      end

      while idx < data.length
        min = @result.min
        new_elem = data[idx]
        if new_elem < min
          idx += 1
          next
        end

        @result.extract_min
        @result.push(new_elem)

        idx += 1
      end
    end
  end
end

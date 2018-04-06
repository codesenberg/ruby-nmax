module Nmax
  class Accumulator

    attr_reader :result

    # @params
    #   size: [Fixnum]
    #   data: [Array] optional
    # @note
    #   Инициализируем аккумулятор размерности n (size),
    #     можно сразу передать массив чисел вторым параметром.
    def initialize(size, data=[])
      @size=size
      @result=prepare(data)
    end

    # @params
    #   data: [Array] optional
    # @return [Accumulator]
    # @note
    #   В результат аккумулятора добавляем массив чисел, на выходе получаем сам объект аккумулятора.
    #   В итоге result будет содержать массив размера не больше size, где числа отсортированы по убыванию.
    def add(data)
      @result+=prepare(data)
      @result=prepare(@result)
      self
    end

    private

    def prepare(data)
      data.sort.reverse.take(@size)
    end

  end
end
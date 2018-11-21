module NMax
  class MinHeap
    def initialize
      @heap = []
    end

    def size
      @heap.length
    end

    def min
      @heap[0]
    end

    def extract_min
      min = @heap[0]
      last = @heap.length-1

      @heap[0], @heap[last] = @heap[last], @heap[0]
      @heap.slice!(last)
      heapify(0)

      min
    end

    def push(item)
      @heap << item

      idx = @heap.length-1
      while idx != 0
        p = parent(idx)
        break if @heap[p] <= @heap[idx]

        @heap[idx], @heap[p] = @heap[p], @heap[idx]
        idx = p
      end
    end

    def to_a
      @heap.dup
    end

    private
    def heapify(idx)
      smallest = idx

      l = left(idx)
      r = right(idx)
      if l < @heap.length && @heap[l] < @heap[smallest]
        smallest = l
      end
      if r < @heap.length && @heap[r] < @heap[smallest]
        smallest = r
      end

      if smallest != idx
        @heap[smallest], @heap[idx] = @heap[idx], @heap[smallest]
        heapify(smallest)
      end
    end

    def parent(idx)
      (idx - 1) / 2
    end

    def left(idx)
      2*idx + 1
    end

    def right(idx)
      2*idx + 2
    end
  end
end

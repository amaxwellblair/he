$LOAD_PATH.unshift(__dir__)

require 'complete_binary_tree'
require 'pry'

class Heap
  attr_accessor :heapie, :tree

  def initialize(args = {})
    @operand = args.fetch(:operand, lambda{|x,y| x > y})
    if args[:tree].nil?
      @heapie = args.fetch(:heap, [])
      @tree = []
    else
      @heapie = heap_balance(args[:tree])
    end
  end

  def operand(x, y)
    @operand.call(x, y)
  end

  def parent(index)
    (index - 1).abs / 2
  end

  def insert num
    heapie.push(num)
    heap_balance
  end

  def heap_balance (heap = heapie)
    if balanced?(heap)
      return heap
    else
      heap.length.times do |index|
        if operand(heap[index], heap[parent(index)])
          bubble_up(heap, index)
        end
      end
    end
  end

  def balanced?(heap)
    heap.length.times do |index|
      parent_index = (index - 1).abs / 2
      if operand(heap[index], heap[parent_index])
        return false
      end
    end
    true
  end


end

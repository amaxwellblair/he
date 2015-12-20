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
      @heapie = heap_balance(args[:tree].tree)
    end
  end

  def operand(x, y)
    @operand.call(x, y)
  end

  def parent(index)
    (index - 1).abs / 2
  end

  def insert num
    if data_valid?(num)
      heapie.push(num)
      heap_balance
    end
  end

  def extract num
    if heapie.include?(num)
      heapie[heapie.index(num)] = heapie.pop
      heap_balance
      num
    else
      puts "Data does not exist in current heap"
    end
  end

  def heap_balance (heap = heapie)
    if balanced?(heap)
      heap
    else
      heapify(heap)
      heap_balance(heap)
    end
  end

  def heapify(heap)
    heap.length.times do |index|
      if operand(heap[index], heap[parent(index)])
        if (parent(index) - index) == 2 || heap[index+1].nil?
          swap(heap, index)
        elsif operand(heap[index+1], heap[index])
          swap(heap, index+1)
        else
          swap(heap, index)
        end
      end
    end
  end

  def swap(heap, index)
    swap = heap[parent(index)]
    heap[parent(index)] = heap[index]
    heap[index] = swap
  end

  def balanced?(heap)
    heap.length.times do |index|
      parent_index = (index - 1).abs / 2
      return false if operand(heap[index], heap[parent_index])
    end
    true
  end

  def data_valid?(data)
    if data.class == Fixnum
      true
    else
      puts "Invalid data"
    end
  end
end

$LOAD_PATH.unshift(__dir__)

require 'complete_binary_tree'
require 'pry'

class Heap
  attr_accessor :heap, :operand, :tree

  def initialize(args = {})
    @operand = args.fetch(:operand, ">=")
    if args[:tree].nil?
      @heap = args.fetch(:heap, [])
      @tree = []
    else
      @heap = heap_convert(args[:tree])
    end
  end

end

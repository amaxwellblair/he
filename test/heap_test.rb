$LOAD_PATH.unshift('../lib/')
require 'simplecov'
SimpleCov.start
require 'heap'
require 'minitest'

class HeapTest < Minitest::Test
  attr_reader :pile, :binarytree

  def setup
    @pile = Heap.new
  end

  def test_create_class
    assert_equal Heap, pile.class
  end

  def test_create_blank_heap
    args = {operand: ">="}
    pile = Heap.new(args)
    assert_equal [], pile.heap
  end

  def test_read_in_heap
    args = {operand: ">=", heap: [10, 1, 5]}
    pile = Heap.new(args)
    assert_equal [10, 1, 5], pile.heap
  end

  def test_create_one_item_on_heap
    skip
    args = {operand: ">="}
    pile = Heap.new(args)
    pile.insert(10)
    assert_equal [10], pile.heap
  end

  def test_create_three_item_on_heap
    skip
    args = {operand: ">="}
    pile = Heap.new(args)
    pile.insert(10)
    pile.insert(11)
    pile.insert(5)
    assert_equal [10], pile.heap
  end

  def test_insert_creation_max_heap
    skip
    args = {operand: ">="}
    pile = Heap.new(args)
    pile.insert(5)
    pile.insert(9)
    pile.insert(10)
    assert_equal [10, 9, 5], pile.heap
  end

  def test_insert_creation_min_heap
    skip
    args = {operand: "<="}
    pile = Heap.new(args)
    pile.insert(10)
    pile.insert(9)
    pile.insert(5)
    assert_equal [5, 9, 10], pile.heap
  end

  def test_create_from_bintree_max_heap_small
    skip
    binarytree.insert(5)
    binarytree.insert(9)
    binarytree.insert(10)
    args = {:tree => binarytree, :operand => ">="}
    pile = Heap.new(args)
    assert_equal [10, 9, 5], pile.heap
  end

  def test_create_from_bintree_min_heap_small
    skip
    binarytree.insert(10)
    binarytree.insert(9)
    binarytree.insert(5)
    args = {:tree => binarytree, :operand => "<="}
    pile = Heap.new(args)
    assert_equal [5, 9, 10], pile.heap
  end

  def test_create_from_bintree_max_heap_large
    skip
    binarytree.insert(10)
    binarytree.insert(9)
    binarytree.insert(5)
    binarytree.insert(52)
    binarytree.insert(98)
    binarytree.insert(1)
    args = {:tree => binarytree, :operand => ">="}
    pile = Heap.new(args)
    assert_equal [98, 52, 5, 10, 9, 1], pile.heap
  end

  def test_create_from_bintree_min_heap
    skip
    binarytree.insert(10)
    binarytree.insert(9)
    binarytree.insert(5)
    binarytree.insert(52)
    binarytree.insert(98)
    binarytree.insert(1)
    args = {:tree => binarytree, :operand => "<="}
    pile = Heap.new(args)
    assert_equal [1, 9, 5, 52, 98, 10], pile.heap
  end

  def test_extract_max_heap_small_return_value
    skip
    binarytree.insert(5)
    binarytree.insert(9)
    binarytree.insert(10)
    args = {:tree => binarytree, :operand => ">="}
    pile = Heap.new(args)
    assert_equal 9, pile.extract(9)
  end

  def test_extract_min_heap_small_return_value
    skip
    binarytree.insert(10)
    binarytree.insert(9)
    binarytree.insert(5)
    args = {:tree => binarytree, :operand => "<="}
    pile = Heap.new(args)
    assert_equal 9, pile.extract(9)
  end

  def test_extract_max_heap_large
    skip
    binarytree.insert(10)
    binarytree.insert(9)
    binarytree.insert(5)
    binarytree.insert(52)
    binarytree.insert(98)
    binarytree.insert(1)
    args = {:tree => binarytree, :operand => ">="}
    pile = Heap.new(args)
    pile.extract(52)
    assert_equal [98, 10, 5, 1, 9], pile.heap
  end

  def test_extract_min_heap_large
    skip
    binarytree.insert(10)
    binarytree.insert(9)
    binarytree.insert(5)
    binarytree.insert(52)
    binarytree.insert(98)
    binarytree.insert(1)
    args = {:tree => binarytree, :operand => "<="}
    pile = Heap.new(args)
    pile.extract(9)
    assert_equal [1, 10, 5, 52, 98], pile.heap
  end


end

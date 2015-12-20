$LOAD_PATH.unshift('../lib/')
require 'simplecov'
SimpleCov.start
require 'heap'
require 'minitest'

class HeapTest < Minitest::Test
  attr_reader :pile, :binarytree

  def setup
    @pile = Heap.new
    @binarytree = CompleteBinaryTree.new
  end

  def test_create_class
    assert_equal Heap, pile.class
  end

  def test_create_blank_heap
    args = {operand: lambda{|x,y| x > y}}
    pile = Heap.new(args)
    assert_equal [], pile.heapie
  end

  def test_insert_of_non_fixnum
    args = {operand: lambda{|x,y| x > y}}
    pile = Heap.new(args)
    pile.insert(10)
    pile.insert("a")
    assert_equal [10], pile.heapie
  end

  def test_insert_of_two_of_same_number
    args = {operand: lambda{|x,y| x > y}}
    pile = Heap.new(args)
    pile.insert(10)
    pile.insert(10)
    assert_equal [10, 10], pile.heapie
  end

  def test_read_in_heap
    args = {operand: lambda{|x,y| x > y}, heap: [10, 1, 5]}
    pile = Heap.new(args)
    assert_equal [10, 1, 5], pile.heapie
  end

  def test_create_one_item_on_heap
    args = {operand: lambda{|x,y| x > y}}
    pile = Heap.new(args)
    pile.insert(10)
    assert_equal [10], pile.heapie
  end

  def test_balanced_true_max_heap
    args = {operand: lambda{|x,y| x > y}, heap: [10, 1, 5]}
    pile = Heap.new(args)
    assert_equal true, pile.balanced?(pile.heapie)
  end

  def test_balanced_false_max_heap
    args = {operand: lambda{|x,y| x > y}, heap: [1, 10, 5,]}
    pile = Heap.new(args)
    assert_equal false, pile.balanced?(pile.heapie)
  end

  def test_balanced_true_min_heap
    args = {operand: lambda{|x,y| x < y}, heap: [1, 1, 5]}
    pile = Heap.new(args)
    assert_equal true, pile.balanced?(pile.heapie)
  end

  def test_balanced_false_min_heap
    args = {operand: lambda{|x,y| x < y}, heap: [10, 11, 5,]}
    pile = Heap.new(args)
    assert_equal false, pile.balanced?(pile.heapie)
  end

  def test_balance_min_heap_three
    args = {operand: lambda{|x,y| x < y}, heap: [10, 11, 5,]}
    pile = Heap.new(args)
    pile.heap_balance
    assert_equal true, pile.balanced?(pile.heapie)
  end

  def test_balance_max_heap_three
    args = {operand: lambda{|x,y| x < y}, heap: [10, 11, 5,]}
    pile = Heap.new(args)
    pile.heap_balance
    assert_equal true, pile.balanced?(pile.heapie)
  end

  def test_create_three_item_on_heap
    args = {operand: lambda{|x,y| x > y}}
    pile = Heap.new(args)
    pile.insert(10)
    pile.insert(11)
    pile.insert(5)
    assert_equal [11,10,5], pile.heapie
  end

  def test_insert_creation_max_heap
    args = {operand: lambda{|x,y| x > y}}
    pile = Heap.new(args)
    pile.insert(5)
    pile.insert(9)
    pile.insert(10)
    assert_equal [10, 5, 9], pile.heapie
  end

  def test_insert_creation_min_heap
    args = {operand: lambda{|x,y| x < y}}
    pile = Heap.new(args)
    pile.insert(10)
    pile.insert(9)
    pile.insert(5)
    assert_equal [5, 10, 9], pile.heapie
  end

  def test_create_from_bintree_max_heap_small
    binarytree.insert(5)
    binarytree.insert(9)
    binarytree.insert(10)
    args = {:tree => binarytree, :operand => lambda{|x,y| x > y}}
    pile = Heap.new(args)
    assert_equal [10, 9, 5], pile.heapie
  end

  def test_create_from_bintree_min_heap_small
    binarytree.insert(10)
    binarytree.insert(9)
    binarytree.insert(5)
    args = {:tree => binarytree, :operand => lambda{|x,y| x < y}}
    pile = Heap.new(args)
    assert_equal [5, 9, 10], pile.heapie
  end

  def test_create_from_bintree_max_heap_large
    binarytree.insert(10)
    binarytree.insert(9)
    binarytree.insert(5)
    binarytree.insert(52)
    binarytree.insert(98)
    binarytree.insert(1)
    args = {:tree => binarytree, :operand => lambda{|x,y| x > y}}
    pile = Heap.new(args)
    assert_equal [98, 52, 5, 10, 9, 1], pile.heapie
  end

  def test_create_from_bintree_max_heap_three_of_same_number
    binarytree.insert(10)
    binarytree.insert(9)
    binarytree.insert(5)
    binarytree.insert(52)
    binarytree.insert(98)
    binarytree.insert(1)
    binarytree.insert(1)
    binarytree.insert(1)
    args = {:tree => binarytree, :operand => lambda{|x,y| x > y}}
    pile = Heap.new(args)
    assert_equal [98, 52, 5, 10, 9, 1, 1, 1], pile.heapie
  end

  def test_create_from_bintree_min_heap
    binarytree.insert(10)
    binarytree.insert(9)
    binarytree.insert(5)
    binarytree.insert(52)
    binarytree.insert(98)
    binarytree.insert(1)
    args = {:tree => binarytree, :operand => lambda{|x,y| x < y}}
    pile = Heap.new(args)
    assert_equal [1, 9, 5, 52, 98, 10], pile.heapie
  end

  def test_extract_max_heap_small_return_value
    binarytree.insert(5)
    binarytree.insert(9)
    binarytree.insert(10)
    args = {:tree => binarytree, :operand => lambda{|x,y| x > y}}
    pile = Heap.new(args)
    assert_equal 9, pile.extract(9)
  end

  def test_extract_number_that_does_not_exist
    binarytree.insert(5)
    binarytree.insert(9)
    binarytree.insert(10)
    args = {:tree => binarytree, :operand => lambda{|x,y| x > y}}
    pile = Heap.new(args)
    assert_equal nil, pile.extract(13)
  end

  def test_extract_max_heap_large
    binarytree.insert(10)
    binarytree.insert(9)
    binarytree.insert(5)
    binarytree.insert(52)
    binarytree.insert(98)
    binarytree.insert(1)
    args = {:tree => binarytree, :operand => lambda{|x,y| x > y}}
    pile = Heap.new(args)
    pile.extract(52)
    assert_equal [98, 10, 5, 1, 9], pile.heapie
  end

  def test_extract_min_heap_large
    binarytree.insert(10)
    binarytree.insert(9)
    binarytree.insert(5)
    binarytree.insert(52)
    binarytree.insert(98)
    binarytree.insert(1)
    args = {:tree => binarytree, :operand => lambda{|x,y| x < y}}
    pile = Heap.new(args)
    pile.extract(9)
    assert_equal [1, 10, 5, 52, 98], pile.heapie
  end

  def test_edge_cases
    skip
    #same number twice; inserting: nil, blank, non-fixnum, etc; extracting a
  end


end

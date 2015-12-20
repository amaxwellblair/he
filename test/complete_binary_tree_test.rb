$LOAD_PATH.unshift('../lib/')
require 'simplecov'
SimpleCov.start
require 'complete_binary_tree'
require 'minitest'

class CompleteBinaryTreeTest < Minitest::Test
  attr_reader :binarytree

  def setup
    @binarytree = CompleteBinaryTree.new
  end

  def test_create_class
    assert_equal CompleteBinaryTree, binarytree.class
  end

  def test_create_binary_tree
    assert_equal [], binarytree.tree
  end

  def test_create_binary_tree_with_arguments
    binarytree = CompleteBinaryTree.new([1,9,9])
    assert_equal [1,9,9], binarytree.tree
  end

  def test_insert_binary_tree_root
    binarytree.insert(9)
    assert_equal [9], binarytree.tree
  end

  def test_insert_binary_tree_root_and_some_leaves
    binarytree.insert(9)
    binarytree.insert(10)
    binarytree.insert(11)
    assert_equal [9,10,11], binarytree.tree
  end

  def test_extract_binary_tree
    binarytree.insert(10)
    binarytree.insert(9)
    binarytree.insert(5)
    binarytree.insert(52)
    binarytree.insert(98)
    binarytree.insert(1)
    binarytree.extract(9)
    assert_equal [10, 1, 5, 52, 98], binarytree.tree
  end

  def test_perfect_tree_true
    binarytree.insert(9)
    binarytree.insert(10)
    binarytree.insert(11)
    assert_equal true, binarytree.perfect_tree?
  end

  def test_perfect_tree_false
    binarytree.insert(9)
    binarytree.insert(10)
    assert_equal false, binarytree.perfect_tree?
  end

  def test_insert_same_number
    binarytree.insert(9)
    binarytree.insert(9)
    assert_equal [9, 9], binarytree.tree
  end

  def test_insert_nil
    binarytree.insert(9)
    binarytree.insert(nil)
    assert_equal [9], binarytree.tree
  end

  def test_insert_not_fixnum
    binarytree.insert(9)
    binarytree.insert("a")
    assert_equal [9], binarytree.tree
  end

end

$LOAD_PATH.unshift('../lib/')
require 'simplecov'
SimpleCov.start
require 'binarytree'
require 'minitest'

class BinaryTreeTest < Minitest::Test
  attr_reader :binarytree

  def setup
    skip
    @binarytree = BinaryTree.new
  end

  def test_create_class
    skip
    assert_equal BinaryTree, pile.class
  end

  def test_create_binary_tree
    skip
    binarytree.create
    assert_equal [], binarytree.tree
  end

  def test_create_binary_tree_root
    skip
    binarytree.create
    binarytree.insert(9)
    assert_equal [9], binarytree.tree
  end

  def test_create_binary_tree_root_and_some_leaves
    skip
    binarytree.create
    binarytree.insert(9)
    binarytree.insert(10)
    binarytree.insert(11)
    assert_equal [9,10,11], binarytree.tree
  end

  def test_perfect_tree_true
    skip
    binarytree.create
    binarytree.insert(9)
    binarytree.insert(10)
    binarytree.insert(11)
    assert_equal true, binarytree.perfect_tree?
  end

  def test_perfect_tree_false
    skip
    binarytree.create
    binarytree.insert(9)
    binarytree.insert(10)
    assert_equal false, binarytree.perfect_tree?
  end

end

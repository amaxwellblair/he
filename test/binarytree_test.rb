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

  def test_other
    skip
  end
end

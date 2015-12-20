
class CompleteBinaryTree
  attr_accessor :tree

  def initialize complete_tree = []
    @tree = complete_tree
  end

  def insert num
    tree << num if data_valid?(num)
  end

  def extract num
    if tree.include?(num)
      removed_index = tree.index(num)
      tree[removed_index] = tree.pop
      num
    else
      "Data point does not exist within tree"
    end
  end

  def perfect_tree?
    perfect_num = 1
    while perfect_num <= tree.length
      return true if perfect_num == tree.length
      perfect_num = perfect_num * 2 + 1
    end
    false
  end

  def data_valid?(data)
    if data.class == Fixnum
      true
    else
      puts "Invalid data"
    end
  end

end

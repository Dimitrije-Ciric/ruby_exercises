# frozen_string_literal: true

require_relative 'node'

class Tree
  attr_accessor :root

  def initialize(array = [])
    self.root = Tree.build_tree(array.sort.uniq)
  end

  def self.build_tree(array)
    return nil if array.empty?
    return Node.new(array[0]) if array.count == 1

    mid = array.count / 2
    left_array = array[0...mid]
    right_array = array[(mid + 1)...array.count]

    Node.new(array[mid], build_tree(left_array), build_tree(right_array))
  end

  private

  def perform_insert(node, value)
    return if node.nil? || node.value == value

    if value < node.value # ==> go left
      if node.left.nil?
        node.left = Node.new(value)
      else # node.left != nil
        perform_insert(node.left, value)
      end
    else # value > node ==> go right
      if node.right.nil?
        node.right = Node.new(value)
      else # node.right != nil
        perform_insert(node.right, value)
      end
    end

    nil
  end

  public

  def insert(value)
    if root.nil?
      self.root = Node.new(value)
    else
      perform_insert(root, value)
    end
  end

  private

  def min_value(node) # returns minimum value from subtree
    return if node.nil?
    return node.value if node.left.nil?

    min_value(node.left)
  end

  def perform_delete(node = root, value)
    return node if node.nil? 

    if value < node.value # ==> go left
      node.left = perform_delete(node.left, value)
    elsif value > node.value # ==> go right
      node.right = perform_delete(node.right, value)
    else # value == node
      if node.left.nil?
        node = node.right
      elsif node.right.nil?
        node = node.left
      else # have 2 children
        min_value = min_value(node.right)
        perform_delete(node, min_value)
        node.value = min_value
      end
    end

    node
  end

  public

  def delete(value)
    if root.nil? && root.value == value
      self.root = nil
    else
      perform_delete(root, value)
    end
  end

  def find(node = root, value)
    return nil if node.nil?
    return node if node.value == value

    left_search = find(node.left, value)
    return find(node.right, value) if left_search.nil?

    left_search
  end

  def level_order(&block)
    queue = [root]
    values = []

    until queue.empty?
      node = queue.first
      queue.delete_at(0)

      if defined? yield # defined? yield same as block_given?, but faster
        block.call(node)
      else
        values << node.value
      end

      queue << node.left unless node.left.nil?
      queue << node.right unless node.right.nil?
    end

    return values unless block_given?
  end

  def inorder(node = root, values = [], &block)
    return if node.nil?

    inorder(node.left, values, &block)

    if defined? yield # defined? yield same as block_given?, but faster
      block.call(node)
    else
      values << node.value
    end

    inorder(node.right, values, &block)

    values unless defined? yield 
  end

  def preorder(node = root, values = [], &block)
    return if node.nil?

    if defined? yield # defined? yield same as block_given?, but faster
      block.call(node)
    else
      values << node.value
    end


    preorder(node.left, values, &block)
    preorder(node.right, values, &block)
    values unless defined? yield 
  end

  def postorder(node = root, values = [], &block)
    return if node.nil?

    postorder(node.left, values, &block)
    postorder(node.right, values, &block)

    if defined? yield # defined? yield same as block_given?, but faster
      block.call(node)
    else
      values << node.value
    end

    values unless defined? yield 
  end

  def height(node = root)
    return 0 if node.nil?

    1 + [height(node.left), height(node.right)].max
  end

  def depth(target_node, node = root)
    return 0 if node.nil?

    1 + case target_node <=> node 
        when -1 then depth(target_node, node.left)
        when 0 then 0
        when 1 then depth(target_node, node.right)
        end
  end

  def balanced?(node = root)
    return true if node.nil?

    return  balanced?(node.left) && 
            balanced?(node.right) && 
            (height(node.left) - height(node.right)).abs <= 1
  end

  def rebalance
    self.root = Tree.build_tree(inorder)

    nil
  end

  def to_s(node = root, prefix = '', is_left = true)
    return '' if node.nil?

    right_s = to_s(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false)
    left_s = to_s(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true)

    "#{right_s}#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}\n#{left_s}"
  end
end
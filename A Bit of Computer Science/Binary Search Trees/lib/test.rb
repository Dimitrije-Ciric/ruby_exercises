# frozen_string_literal: true

require_relative 'tree'

t1 = Tree.new([1, 5, 6])
puts t1

t2 = Tree.new([1, 2, 43, 6, 7, 45])
puts t2

t2.insert(102)
t2.insert(42)
t2.insert(44)
t2.insert(1)
t2.insert(5)
puts t2

puts t2.find(102).value
puts t2.find(42).value
puts t2.find(7).value

t2.delete(42)
puts t2.find(42).class
t2.delete(43)
puts t2.balanced?
puts t2

puts t2.find(5).value, ''

t2.delete(7)

puts t2

puts t2.level_order
puts t2.level_order { |node| print node.value, " " }

puts t2.height

puts t2.depth(t2.find(5))

puts t2.balanced?

t2.insert(103)
puts t2.height
puts t2, t2.balanced?


print t2.inorder, "\n"
print t2.preorder, "\n"
print t2.postorder, "\n"

puts t2, t2.balanced?
t2.rebalance
puts t2, t2.balanced?
print t2.inorder, "\n"
print t2.preorder, "\n"
print t2.postorder, "\n"


puts "\nTie it all together"
puts "Tests from The Odin Project\n\n"

tree = Tree.new(Array.new(15) { rand(1..100) } )
puts "Tree generated"
puts tree, ''

puts "Tree is#{tree.balanced? ? '' : ' not' } balanced"

tree_orders = ->(tree) do
  print "Level order: #{tree.level_order}\n"
  print "Pre order  : #{tree.preorder}\n"
  print "Post order : #{tree.postorder}\n"
  print "In order   : #{tree.inorder}\n"
end
tree_orders.call(tree)

puts '', 'Adding few values to the tree...'
tree.insert(101)
tree.insert(102)
tree.insert(103)
tree.insert(104)
puts "Tree is#{tree.balanced? ? '' : ' not' } balanced"
puts tree

puts '', 'Rebalancing tree...'
tree.rebalance
puts "Tree is#{tree.balanced? ? '' : ' not' } balanced again"
puts tree

tree_orders.call(tree)
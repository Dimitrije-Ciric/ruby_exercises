#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'linked_list'

l1 = LinkedList.new
puts l1, l1.size

l1.append(15)
l1.insert_at(150, 0)
puts l1
l1.remove_at(0)
puts l1
l1.prepend(10)
l1.prepend(20)
#l1.prepend(30)
puts "----- before #{l1}"
l1.remove_at(2)
puts "----- after remove #{l1}"
l1.append(15)
l1.insert_at(150, 0)
puts l1, l1.size

puts l1

l1.insert_at(120, 2)
l1.insert_at(120, 0)
puts l1

puts "remove first"
l1.remove_at(0)
puts l1

puts l1.contains?(1), l1.contains?(15), l1.contains?(20)
puts l1.at(30), l1.at(0), l1.at(3)

puts "----------- before remove 3", l1
l1.remove_at(4)
puts "----------- after remove, before remove 1", l1
l1.remove_at(3)
puts "----------- before pop #{l1.size}", l1
l1.pop
puts "----------- after pop size #{l1.size}", l1

puts l1.contains?(1), l1.contains?(15), l1.contains?(20)
puts l1.at(30), l1.at(0), l1.at(2)

puts l1.pop, l1, l1.find(10), l1.find(20)

puts l1.contains?(1), l1.contains?(15), l1.contains?(20)
puts l1.at(30), l1.at(0), l1.at(1)
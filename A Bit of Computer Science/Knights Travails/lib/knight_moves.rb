# frozen_string_literal: true

require_relative 'knight'

def knight_moves(start_position, end_position)
  queue = [KnightNode.new(start_position)]
  
  current_node = nil
  until queue.empty?
    current_node = queue.first
    queue.delete_at(0)
    
    return current_node.path if current_node.position == end_position

    current_node.next_moves.each { |node| queue << node}
  end
end
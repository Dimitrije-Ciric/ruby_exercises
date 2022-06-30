# frozen_string_literal: true

class KnightNode
  attr_reader :position

  protected

  attr_accessor :parent
  attr_writer :position

  public

  @@visited = []

  def initialize(position, parent = nil)
    self.position = position
    self.parent = parent
    @@visited |= position
  end

  MOVES = [[2, 1], [2, -1], [-2, 1], [-2, -1], [1, 2], [1, -2], [-1, 2], [-1, -2]].freeze

  def self.valid_move?(position)
    position[0].between?(0, 7) && position[1].between?(0, 7)
  end

  def next_moves
    MOVES.map { |move| [position[0] + move[0], position[1] + move[1]] }
         .keep_if { |move| KnightNode.valid_move?(move) }
         .reject { |move| @@visited.include?(move) }
         .map { |move| KnightNode.new(move, self) }
  end

  # path from this node to root
  def path(&block)
    shortest_path = []

    tmp_node = self
    until tmp_node.nil?
      if defined? yield
        yield tmp_node
      else
        shortest_path.unshift(tmp_node.position)
      end

      tmp_node = tmp_node.parent
    end

    shortest_path unless block_given?
  end
end

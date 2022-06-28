# frozen_string_literal: true

class Node
  include Comperable

  attr_accessor :value, :left, :right

  def initialize(value = nil, left = nil, right = nil)
    self.value = value
    self.left = left
    self.right = right
  end

  def <=>(other)
    return nil unless other.respond_to?(:value)

    return -1 if value < other.value
    return 0 if value == other.value
    return 1 if value > other.value
  end
end
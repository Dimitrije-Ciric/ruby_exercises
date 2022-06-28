# frozen_string_literal: true

require_relative 'node'

class LinkedList
  attr_reader :head, :tail, :size

  private

  attr_writer :head, :tail, :size

  public

  def initialize
    self.head = self.tail = nil
    self.size = 0
  end

  def append(value)
    if size == 0
      self.head = self.tail = Node.new(value)

      self.size = 1
    elsif size == 1 # -> head == tail
      self.tail = Node.new(value)
      head.next_node = tail

      self.size = 2
    else
      self.tail.next_node = Node.new(value)
      self.tail = tail.next_node

      self.size += 1
    end
  end

  def prepend(value)
    if size == 0
      self.head = self.tail = Node.new(value)

      self.size = 1
    elsif size == 1 # -> head == tail
      self.head = Node.new(value, tail)

      self.size = 2
    else
      tmp = Node.new(value, head)
      self.head = tmp

      self.size += 1
    end
  end

  def at(index)
    tmp = head
    while tmp != nil && index > 0
      tmp = tmp.next_node
      index -= 1
    end

    tmp
  end

  def pop
    return if size == 0

    if size == 1
      self.head = self.tail = nil

      self.size = 0
    elsif size == 2
      head.next_node = nil
      self.tail = head
      puts "pop", self
      self.size = 1
    else
      new_tail = at(size - 2)
      new_tail.next_node = nil
      self.tail = new_tail
      
      self.size -= 1
    end
  end

  def contains?(value)
    tmp = head
    while tmp != nil
      return true if tmp.value == value
      tmp = tmp.next_node
    end

    false
  end

  def find(value)
    tmp = head
    index = 0
    while tmp != nil
      return index if tmp.value == value

      tmp = tmp.next_node
      index += 1
    end

    nil
  end

  def insert_at(value, index)
    return nil if index >= size

    if index == 0
      self.head = Node.new(value, head)
    else
      insert_after = at(index - 1)
      insert_before = if index == size - 1
                        tail
                      else
                        insert_after.next_node
                      end

      tmp = Node.new(value, insert_before)

      insert_after.next_node = tmp
    end

    self.size += 1
  end

  def remove_at(index)
    return nil if index >= size

    if index == 0
      self.head = head.next_node
    else
      remove_after = at(index - 1)
      remove_after.next_node =  if index == size - 1
                                  self.tail = remove_after
                                  nil
                                else
                                  remove_after.next_node.next_node
                                end
    end

    self.size -= 1

    if size == 0
      self.head = self.tail = nil
    elsif size == 1
      self.head = tail
    end
  end

  def to_s
    s = ''
    tmp = head
    while tmp != nil
      s += tmp.to_s + ' -> '
      tmp = tmp.next_node
    end

    s += 'nil'
  end
end

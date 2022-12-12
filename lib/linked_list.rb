# frozen_string_literal: true

require_relative 'node'

class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def tail
    node = @head

    return node if !node.next_node
    return node if !node.next_node while (node = node.next_node)
  end

  def append(data)
    if @head
      tail.next_node = Node.new(data)
    else 
      @head = Node.new(data)
    end
  end

  def prepend(data)
    if @head
      @head = Node.new(data, @head)
    else
      @head = Node.new(data)
    end
  end

  def size
    node = @head
    counter = 0

    until node.nil?
      counter += 1
      node = node.next_node
    end
    counter
  end

  def at(index)
    node = @head
    counter = 0

    until counter == index
      node = node.next_node
      counter += 1
    end
    node
  end

  def pop
    node = @head

    if size == 1
      @head = nil
    else
      node = node.next_node until node.next_node == tail
      node.next_node = nil
      tail = node
    end
  end

  def contains?(value)
    node = @head
    contains = false

    until node.nil?
      contains = true if node.data == value
      node = node.next_node
    end
    contains
  end

  def find(value)
    node = @head
    index = 0

    until node.nil?
      return index if node.data == value
      index += 1
      node = node.next_node
    end
  end

  def to_s
    node = @head

    until node.nil?
      print "(#{node.data}) -> "
      node = node.next_node
    end
  end
end

list = LinkedList.new

list.append(10)
list.append(20)
list.append(30)

puts "Size: #{list.size}"
# puts list.print

p list.contains?(10)
p list.find(40)
p list.to_s



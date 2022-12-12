# frozen_string_literal: true

# Class to create and manage nodes
class Node
  attr_accessor :data, :next_node

  def initialize(data = nil, next_node = nil)
    @data = data
    @next_node = next_node
  end

  def print
    puts @data
  end
end
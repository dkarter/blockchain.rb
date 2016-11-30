# frozen_string_literal: true
module Blockchain
  # Creates a linked list with hashing verification
  class List
    attr_reader :head, :tail

    def initialize(data)
      @head = ListNode.new(data: data)
      @tail = @head
    end

    def push(data)
      @tail = ListNode.new(data: data, prev: tail)
    end

    def valid?
      current = tail
      until current == head
        return false if current.prev_fingerprint != current.prev.fingerprint
        current = current.prev
      end

      true
    end
  end
end

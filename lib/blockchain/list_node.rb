# frozen_string_literal: true
require 'digest'

module Blockchain
  # Represents a node in a blockchain list
  class ListNode
    attr_reader(
      :data,
      :prev,
      :fingerprint,
      :prev_fingerprint
    )

    def initialize(data:, prev: nil)
      @data = data
      @fingerprint = Digest::SHA256.digest data
      @prev = prev
      @prev_fingerprint = prev.fingerprint if prev
    end
  end
end

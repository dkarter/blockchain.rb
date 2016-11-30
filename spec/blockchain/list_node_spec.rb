# frozen_string_literal: true
require 'spec_helper'
require 'base64'

RSpec.describe Blockchain::ListNode do
  describe '.new' do
    it 'stores the data supplied to initializer' do
      subject = described_class.new(data: 'someval')
      expect(subject.data).to eq('someval')
    end

    it 'stores a hash of the value supplied to the initializer' do
      subject = described_class.new(data: 'someval')
      encoded_hash = Base64.urlsafe_encode64(subject.fingerprint)
      expect(encoded_hash).to eq('YhxVy1fmuUKYY5cB-HtXXH5TJyV7R12_n48t3Dy32Uc=')
    end

    it 'stores a fingerprint of prev node' do
      prev = described_class.new(data: 'someval')
      subject = described_class.new(data: 'otherval', prev: prev)
      encoded_hash = Base64.urlsafe_encode64(subject.prev_fingerprint)
      expect(encoded_hash).to eq('YhxVy1fmuUKYY5cB-HtXXH5TJyV7R12_n48t3Dy32Uc=')
    end
  end
end

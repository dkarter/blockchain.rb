# frozen_string_literal: true
require 'spec_helper'

RSpec.describe Blockchain::List do
  describe '.new' do
    it 'can be initialized with a value' do
      bc = described_class.new('something')
      expect(bc.head.data).to eq('something')
      expect(bc.tail.data).to eq('something')
    end
  end

  describe '#push' do
    it 'pushes an element to the end of the list' do
      bc = described_class.new('first')
      bc.push('second')
      expect(bc.tail.data).to eq('second')
    end
  end

  describe '#valid?' do
    it 'returns true if all fingerprints to prev are correct' do
      subject = described_class.new('first')
      subject.push('second')
      expect(subject).to be_valid
    end

    it 'returns false if there is a discrepency in fingerprints' do
      subject = described_class.new('first')
      subject.push('second')
      allow(subject.tail).to receive(:prev_fingerprint) { '1234' }
      expect(subject).to_not be_valid
    end
  end
end

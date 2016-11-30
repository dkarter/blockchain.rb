# frozen_string_literal: true
require 'spec_helper'

RSpec.describe Blockchain do
  it 'has a version number' do
    expect(Blockchain::VERSION).not_to be nil
  end
end

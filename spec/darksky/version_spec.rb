require 'spec_helper'

describe 'Darksky::VERSION' do
  specify 'should be the correct version' do
    expect(Darksky::VERSION).to eq('2.0.1')
  end
end

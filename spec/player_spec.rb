require 'spec_helper'

describe Player do
  subject(:player1) { Player.new('Dave') }

  it 'returns its name' do
    expect(player1.name).to eq('Dave')
  end
end

require "player"

describe Player do
  subject{ described_class.new("Antony") }

  describe '#name' do
    it 'has a name' do
      expect(subject.name).to eq "Antony"
    end
  end
end

require "player"

describe Player do
  subject{ described_class.new("Antony") }

  describe '#name' do
    it 'has a name' do
      expect(subject.name).to eq "Antony"
    end
  end

  describe '#hp' do
		it 'has hp' do
			expect(subject.hp).to eq 60
		end
  end

  describe '#damage' do
  	it 'reduces the players health' do
  		subject.damage(10)
  		expect(subject.hp).to eq 50
  	end
  end

  describe '#dead?' do
  	it 'returns true if a players health is <= 0' do
  		subject.damage(60)
  		expect(subject).to be_dead 
  	end
  end
end

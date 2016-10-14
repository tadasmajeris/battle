require 'attack'

 describe Attack do
   subject {described_class.new(player)}
   let(:player) { double :player }

   describe '#run' do
     it 'damages the player' do
       expect(player).to receive(:receive_damage)
       subject.run
     end
   end
end

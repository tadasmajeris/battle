require 'attack'

 describe Attack do
   subject(:attack_class) { described_class }
   let(:player) { double :player }

   describe '.use' do
     it 'damages the player' do
       expect(player).to receive(:receive_damage)
       attack_class.use(player)
     end
   end
end

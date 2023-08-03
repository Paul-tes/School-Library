require_relative 'spec_helper'

RSpec.describe ClassRoom do
  let(:class_room) { ClassRoom.new('Math') }
  let(:stud1) { double('Student', 'to_hash': { name: 'Alice' }) }
  let(:stdu2) { double('Student', 'to_hash': { name: 'Paul' }) }

  describe '#initialize' do
    it 'sets the lable attribute ' do
      expect(class_room.label).to eq('Math')
    end

    it 'creates an empty students array' do
      expect(class_room.students).to eq([])
    end
  end

  describe '#to_hash' do
    it 'returns a hash of the classroom attributes and each student' do
      class_room.students << stud1
      class_room.students << stdu2
      expect(class_room.to_hash).to eq({
        lable: 'Math',
        students: [
          { name: 'Alice' },
          { name: 'Paul' }
        ]
      })
    end
  end
end

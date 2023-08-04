require_relative 'spec_helper'

RSpec.describe Person do
  let(:person) { Person.new(20) }
  let(:book) { Book.new('Game of throns', 'Gamilian') }

  describe ' =>  can_use_services? -> ' do
    context 'when the person if of age' do
      it 'returns true' do
        expect(person.can_use_services?).to be true
      end
    end

    context 'if the person is not of age but has a parent permission' do
      let(:person) { Person.new(15, parent_permission: true) }
      it 'returns true' do
        expect(person.can_use_services?).to be true
      end
    end

    context 'if the person is not of age and has not parent permission' do
      let(:person) { Person.new(15, parent_permission: false) }
      it 'returns false' do
        expect(person.can_use_services?).to be false
      end
    end
  end

  describe ' => add_rental -> ' do
    it 'create a new rental with given book and date' do
      rental = person.add_rental(book, '2020-20-01')
      expect(rental.date).to eq '2020-20-01'
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)
    end
  end
end

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

RSpec.describe CapitalizeDecorator do
  let(:nameable) { double('Nameable') }
  let(:decorator) { CapitalizeDecorator.new(nameable) }

  describe ' => correct_name -> ' do
    it 'capitalizes the correct_name of the wrapped nameable object' do
      expect(nameable).to receive(:correct_name).and_return('paul tes')
      expect(decorator.correct_name).to eq('Paul tes')
    end
  end
end

RSpec.describe TrimmerDecorator do
  let(:nameable) { double('Nameable') }
  let('decorator') { TrimmerDecorator.new(nameable) }

  describe ' => correct_name ' do
    context 'when the correct_name is longer that 10 characters' do
      it 'returns the first 10 characters of the correct_name' do
        expect(nameable).to receive(:correct_name).and_return('Paul Tesfaye Demmissie')
        expect(decorator.correct_name).to eq('Paul Tesfa')
      end
    end
  end
end

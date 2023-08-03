require_relative 'spec_helper'

RSpec.describe Book do
  let(:person) { Person.new(23, name: 'Paul') }
  let(:book) { Book.new('The Great Gatsby', 'F. Scott Fitzgerald') }

  describe '#Add rental' do
    it 'it creates a new rental for the book and person' do
      rental = book.add_rental(person, '2020/20/01')
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)
      expect(rental.date).to eq('2020/20/01')
    end
  end

  describe '#to_hash' do
    it 'returns a hash of the book attributes' do
      expect(book.to_hash).to eq({ title: 'The Great Gatsby', author: 'F. Scott Fitzgerald' })
    end
  end
end

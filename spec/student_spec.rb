require_relative 'spec_helper'

RSpec.describe Student do
  let(:student) { Student.new(23, parent_permission: false, name: 'paul') }

  describe ' -> initialize()' do
    it 'sets the stduent attribure values' do
      expect(student.name).to eq('paul')
    end
  end

  describe ' -> to_hash()' do
    it 'returnes the hash object values of the student attribute' do
      expect(student.to_hash).to eq({ type: 'student', age: 23, parent_permission: false, name: 'paul' })
    end
  end
end

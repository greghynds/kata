require 'password_strength'

RSpec.describe Validator do
  context 'password validator' do
    it 'password with less than 7 characters is invalid' do
      password = "a1"
      sut = Validator.new

      result = sut.validate(password)

      expect(result).to eq false
    end
  end
end
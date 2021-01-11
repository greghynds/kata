require 'password_validator'
require 'includes_letters'


RSpec.describe PasswordValidator do
    it 'password with no letters is invalid' do
        password = "12345678"
        admin = false
        sut = PasswordValidator.with([IncludesLetters.new])

        result = sut.validate(password, admin)

        expect(result[:valid]).to eq false
        expect(result[:errors]).to include("Must include at least one letter")
    end
end 
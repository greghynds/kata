require 'password_validator'

RSpec.describe PasswordValidator do
    it 'password with less than 7 characters is invalid' do
        password = "a1"
        admin = false
        sut = PasswordValidator.new

        result = sut.validate(password, admin)

        expect(result[:valid]).to eq false
        expect(result[:errors]).to include("Minimum 7 characters")
    end
    it 'password with no letters is invalid' do
        password = "12345678"
        admin = false
        sut = PasswordValidator.new

        result = sut.validate(password, admin)

        expect(result[:valid]).to eq false
        expect(result[:errors]).to include("Must include at least one letter")
    end
    it 'password with no numbers is invalid' do
        password = "abcdefg"
        admin = false
        sut = PasswordValidator.new

        result = sut.validate(password, admin)

        expect(result[:valid]).to eq false
        expect(result[:errors]).to include("Must include at least one number")
    end
    it 'admin password with less than 10 characters is invalid' do
        password = "1!cdefg"
        admin = true
        sut = PasswordValidator.new

        result = sut.validate(password, admin)

        expect(result[:valid]).to eq false
        expect(result[:errors]).to include("Minimum 10 characters")
    end
    it 'admin password with no special characters is invalid' do
        password = "1bcdefghij"
        admin = true
        sut = PasswordValidator.new

        result = sut.validate(password, admin)

        expect(result[:valid]).to eq false
        expect(result[:errors]).to include("Must include at least one special character (!@#$%^&*)")
    end
end
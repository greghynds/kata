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
    it 'password with all requirements is valid' do
        password = "123ABcd"
        admin = false
        sut = PasswordValidator.new

        result = sut.validate(password, admin)

        expect(result[:valid]).to eq true
    end
    it 'empty password returns all invalid reasons' do
        password = ""
        admin = false
        sut = PasswordValidator.new
        errors = [
            "Minimum 7 characters",
            "Must include at least one letter",
            "Must include at least one number"
        ]

        result = sut.validate(password, admin)

        expect(result[:errors]).to match_array(errors)
    end
    it 'empty admin password returns all invalid reasons' do
        password = ""
        admin = true
        sut = PasswordValidator.new
        errors = [
            "Minimum 10 characters",
            "Must include at least one letter",
            "Must include at least one number",
            "Must include at least one special character (!@#$%^&*)"
        ]

        result = sut.validate(password, admin)

        expect(result[:errors]).to match_array(errors)
    end
end
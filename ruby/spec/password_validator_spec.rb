require 'password_validator'

RSpec.describe PasswordValidator do
    it 'returns an error for passwords with less than 7 characters' do
        password = "a1"
        admin = false
        sut = PasswordValidator.new

        result = sut.validate(password, admin)

        expect(result[:valid]).to eq false
        expect(result[:errors]).to include("Minimum 7 characters")
    end
    it 'returns an error for passwords which don\'t include letters' do
        password = "12345678"
        admin = false
        sut = PasswordValidator.new

        result = sut.validate(password, admin)

        expect(result[:valid]).to eq false
        expect(result[:errors]).to include("Must include at least one letter")
    end
    it 'returns an error for passwords which don\'t include numbers' do
        password = "abcdefg"
        admin = false
        sut = PasswordValidator.new

        result = sut.validate(password, admin)

        expect(result[:valid]).to eq false
        expect(result[:errors]).to include("Must include at least one number")
    end
    it 'returns an error for admin passwords with less than 10 characters' do
        password = "1!cdefg"
        admin = true
        sut = PasswordValidator.new

        result = sut.validate(password, admin)

        expect(result[:valid]).to eq false
        expect(result[:errors]).to include("Minimum 10 characters")
    end
    it 'returns an error for admin passwords which don\'t include special characters' do
        password = "1bcdefghij"
        admin = true
        sut = PasswordValidator.new

        result = sut.validate(password, admin)

        expect(result[:valid]).to eq false
        expect(result[:errors]).to include("Must include at least one special character (!@#$%^&*)")
    end
    it 'validates passwords which satisfy all requirements' do
        password = "123ABcd"
        admin = false
        sut = PasswordValidator.new

        result = sut.validate(password, admin)

        expect(result[:valid]).to eq true
    end
    it 'returns multiple errors for empty passwords' do
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
    it 'returns multiple errors for empty admin passwords' do
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
    it 'validates passwords with all upper case letters' do
        password = "123ABCD"
        admin = false
        sut = PasswordValidator.new

        result = sut.validate(password, admin)

        expect(result[:valid]).to eq true
    end
    it 'validates password with all lower case letters' do
        password = "123abcd"
        admin = false
        sut = PasswordValidator.new

        result = sut.validate(password, admin)

        expect(result[:valid]).to eq true
    end
    it 'validates admin passwords which satisfy all requirements' do
        password = "!1cdefghij"
        admin = true
        sut = PasswordValidator.new

        result = sut.validate(password, admin)

        expect(result[:valid]).to eq true
    end
end

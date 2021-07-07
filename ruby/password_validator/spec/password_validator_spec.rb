require 'password_validator'

describe PasswordValidator do
    it 'returns an error for passwords with less than 7 characters' do
        password = "a1"
        userType = :regular_user
        sut = PasswordValidator.new

        result = sut.validate(password, userType)

        expect(result[:valid]).to eq false
        expect(result[:errors]).to include("Minimum 7 characters")
    end
    it 'returns an error for passwords which don\'t include letters' do
        password = "12345678"
        userType = :regular_user
        sut = PasswordValidator.new

        result = sut.validate(password, userType)

        expect(result[:valid]).to eq false
        expect(result[:errors]).to include("Must include at least one letter")
    end
    it 'returns an error for passwords which don\'t include numbers' do
        password = "abcdefg"
        userType = :regular_user
        sut = PasswordValidator.new

        result = sut.validate(password, userType)

        expect(result[:valid]).to eq false
        expect(result[:errors]).to include("Must include at least one number")
    end
    it 'returns an error for admin passwords with less than 10 characters' do
        password = "1!cdefg"
        userType = :admin_user
        sut = PasswordValidator.new

        result = sut.validate(password, userType)

        expect(result[:valid]).to eq false
        expect(result[:errors]).to include("Minimum 10 characters")
    end
    it 'returns an error for admin passwords which don\'t include special characters' do
        password = "1bcdefghij"
        userType = :admin_user
        sut = PasswordValidator.new

        result = sut.validate(password, userType)

        expect(result[:valid]).to eq false
        expect(result[:errors]).to include("Must include at least one special character (!@#$%^&*)")
    end
    it 'validates passwords which satisfy all requirements' do
        password = "123ABcd"
        userType = :regular_user
        sut = PasswordValidator.new

        result = sut.validate(password, userType)

        expect(result[:valid]).to eq true
    end
    it 'returns multiple errors for empty passwords' do
        password = ""
        userType = :regular_user
        sut = PasswordValidator.new
        errors = [
            "Minimum 7 characters",
            "Must include at least one letter",
            "Must include at least one number"
        ]

        result = sut.validate(password, userType)

        expect(result[:errors]).to match_array(errors)
    end
    it 'returns multiple errors for empty admin passwords' do
        password = ""
        userType = :admin_user
        sut = PasswordValidator.new
        errors = [
            "Minimum 10 characters",
            "Must include at least one letter",
            "Must include at least one number",
            "Must include at least one special character (!@#$%^&*)"
        ]

        result = sut.validate(password, userType)

        expect(result[:errors]).to match_array(errors)
    end
    it 'validates passwords with all upper case letters' do
        password = "123ABCD"
        userType = :regular_user
        sut = PasswordValidator.new

        result = sut.validate(password, userType)

        expect(result[:valid]).to eq true
    end
    it 'validates password with all lower case letters' do
        password = "123abcd"
        userType = :regular_user
        sut = PasswordValidator.new

        result = sut.validate(password, userType)

        expect(result[:valid]).to eq true
    end
    it 'validates admin passwords which satisfy all requirements' do
        password = "!1cdefghij"
        userType = :admin_user
        sut = PasswordValidator.new

        result = sut.validate(password, userType)

        expect(result[:valid]).to eq true
    end
end
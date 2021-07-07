require 'password_condition'
require 'user_type'

class MinimumLength < PasswordCondition

    def check(password, admin)
        checkType(password, UserType.from(admin))
    end

    def checkType(password, userType)
        return case userType
        when :admin_user; checkLength(password, 10)
        else; checkLength(password, 7)
        end
    end

    def checkLength(password, minLength)
        valid = password.length() >= minLength
        valid ? nil : "Minimum #{minLength} characters"
    end
end


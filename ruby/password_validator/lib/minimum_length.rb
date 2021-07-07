require 'password_condition'
require 'user_type'

class MinimumLength < PasswordCondition
    MINIMUM_LENGTHS = {:admin_user => 10, :regular_user => 7}

    def check(password, userType)
        minLength = MINIMUM_LENGTHS[userType]
        valid = password.length() >= minLength
        valid ? nil : "Minimum #{minLength} characters"
    end
end


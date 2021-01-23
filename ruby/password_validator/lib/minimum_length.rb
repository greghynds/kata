require 'password_condition'

class MinimumLength < PasswordCondition
    def check(password, admin)
        minLength = admin ? 10 : 7
        valid = password.length() >= minLength
        valid ? nil : "Minimum #{minLength} characters"
    end
end
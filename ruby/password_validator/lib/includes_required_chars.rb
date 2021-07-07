require 'password_condition'

class IncludesRequiredChars < PasswordCondition
    def check(password, userType)
        valid = !(userType == :admin_user) || !(password =~ /[!@#$%^&*]/).nil?
        valid ? nil : "Must include at least one special character (!@#$%^&*)"
    end
end
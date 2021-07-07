require 'password_condition'

class IncludesRequiredChars < PasswordCondition
    def check(password, admin)
        checkType(password, UserType.from(admin))
    end

    def checkType(password, userType)
        valid = case userType
        when :admin_user; !(password =~ /[!@#$%^&*]/).nil?
        else; true
        end
        return valid ? nil : "Must include at least one special character (!@#$%^&*)"
    end
end
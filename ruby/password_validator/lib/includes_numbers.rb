require 'password_condition'

class IncludesNumbers < PasswordCondition
    def check(password, userType)
        valid = !(password =~ /[0-9]/).nil?
        valid ? nil : "Must include at least one number"
    end
end
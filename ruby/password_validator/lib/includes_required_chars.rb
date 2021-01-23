require 'password_condition'

class IncludesRequiredChars < PasswordCondition
    def check(password, admin)
        valid = !admin || !(password =~ /[!@#$%^&*]/).nil?
        valid ? nil : "Must include at least one special character (!@#$%^&*)"
    end
end
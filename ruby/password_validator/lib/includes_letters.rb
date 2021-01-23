require 'password_condition'

class IncludesLetters < PasswordCondition
    def check(password, admin)
        valid = !(password =~ /[a-zA-Z]/).nil?
        valid ? nil : "Must include at least one letter"
    end
end
require 'includes_letters'
require 'minimum_length'


class PasswordValidator
    def initialize
        @conditions = [IncludesLetters.new, MinimumLength.new]
    end

    def validate(password, admin)
        errors = @conditions
            .map { |condition| condition.check(password, admin) }
            .filter { |result| result != nil}

        { valid: !errors.length, errors: errors }
    end
end
require 'includes_letters'
require 'includes_numbers'
require 'includes_required_chars'
require 'minimum_length'

class PasswordValidator
    def initialize
        @conditions = [
            IncludesLetters.new, 
            IncludesNumbers.new,
            IncludesRequiredChars.new,
            MinimumLength.new
        ]
    end

    def validate(password, admin)
        errors = @conditions
            .map { |condition| condition.check(password, admin) }
            .filter { |error| !error.nil? }

        { valid: errors.empty?, errors: errors }
    end
end
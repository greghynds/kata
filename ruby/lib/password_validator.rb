class PasswordValidator
    def initialize(conditions)
        @conditions = [IncludesLetters.new]
    end

    def self.with(conditions) 
        new(conditions)
    end

    def validate(password, admin)
        errors = @conditions
            .map { |condition| condition.check(password, admin) }
            .filter { |result| result != nil}

        { valid: !errors.length, errors: errors }
    end
end
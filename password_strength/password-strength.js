const {
    requiredCharsValidator,
    includesLettersValidator,
    includesNumberValidator,
    minLengthValidator
} = require('./validators.js');

const validate = (password, isAdmin) => {
    const validators = [
        requiredCharsValidator,
        includesLettersValidator,
        includesNumberValidator,
        minLengthValidator
    ];

    return combineValidators(validators)(password, isAdmin);
}

const combineValidators = (validators) => {
    return (password, isAdmin) => {
        const validations = [];
        const reasons = [];

        validators.forEach(validator => {
            const { valid, reason } = validator(password, isAdmin);
            validations.push(valid);
            reasons.push(reason);
        });

        return {
            valid: !validations.includes(false),
            reasons: reasons
        };
    }
}

module.exports = validate;
const validators = require('./validators');

const validate = (password, isAdmin) => {
    return validateWith(validators)(password, isAdmin);
}

const validateWith = (validators) => {
    return (password, isAdmin) => {
        const errors = validators
            .map(validate => validate(password, isAdmin))
            .filter(x => x);

        return {
            valid: !errors.length,
            errors: errors
        };
    }
}

module.exports = { validate };
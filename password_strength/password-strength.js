const validate = (validators, password, isAdmin) => {
    const errors = validators
        .map(validator => validator(password, isAdmin))
        .filter(x => x);

    return {
        valid: !errors || !errors.length,
        errors: errors
    };
}

module.exports = { validate };
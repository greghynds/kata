const requiredCharsValidator = (password, isAdmin) => {
    const valid = !isAdmin || /[!@#$%^&*]/.test(password);
    const error = "Must include at least one special character (!@#$%^&*)";

    return (valid ? undefined : error);
};

const includesLettersValidator = (password) => {
    const valid = /[a-zA-Z]/.test(password);
    const error = "Must include at least one letter";

    return (valid ? undefined : error);
};

const includesNumberValidator = (password) => {
    const valid = /[0-9]/.test(password);
    const error = "Must include at least one number";

    return (valid ? undefined : error);
}

const minLengthValidator = (password, isAdmin) => {
    const minLength = (isAdmin ? 10 : 7);
    const valid = password.length >= minLength;
    const error = "Minimum " + minLength + " characters";

    return (valid ? undefined : error);
};

const validators = [
    requiredCharsValidator,
    includesLettersValidator,
    includesNumberValidator,
    minLengthValidator
];

module.exports = validators;
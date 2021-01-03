
const REQUIRED_CHARS_ERROR = "Must include at least one special character (!@#$%^&*)";
const requiredCharsValidator = (password, isAdmin) => {
    return (!isAdmin || /[!@#$%^&*]/.test(password) ? undefined : REQUIRED_CHARS_ERROR);
};

const INCLUDES_LETTERS_ERROR = "Must include at least one letter";
const includesLettersValidator = (password) => {
    return (/[a-zA-Z]/.test(password) ? undefined : INCLUDES_LETTERS_ERROR);
};

const INCLUDES_NUMBER_ERROR = "Must include at least one number";
const includesNumberValidator = (password) => {
    return (/[0-9]/.test(password) ? undefined : INCLUDES_NUMBER_ERROR);
}

const minLengthError = (minLength) => "Minimum " + minLength + " characters";
const minLengthValidator = (password, isAdmin) => {
    const minLength = (isAdmin ? 10 : 7);
    return (password.length >= minLength ? undefined : minLengthError(minLength));
};

const validators = [
    requiredCharsValidator,
    includesLettersValidator,
    includesNumberValidator,
    minLengthValidator
];

module.exports = validators;
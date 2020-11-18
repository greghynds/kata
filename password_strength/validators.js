const requiredCharsValidator = (password, isAdmin) => {
    return {
        valid: !isAdmin || /[!@#$%^&*]/.test(password),
        reason: "Must include at least one special character (!@#$%^&*)"
    };
};

const includesLettersValidator = (password) => {
    return {
        valid: /[a-zA-Z]/.test(password),
        reason: "Must include at least one letter"
    };
};

const includesNumberValidator = (password) => {
    return {
        valid: /[0-9]/.test(password),
        reason: "Must include at least one number"
    }
}

const minLengthValidator = (password, isAdmin) => {
    const minLength = (isAdmin ? 10 : 7);
    
    return {
        valid: password.length >= minLength,
        reason: "Minimum " + minLength + " characters"
    };
};

module.exports = {
    requiredCharsValidator,
    includesLettersValidator,
    includesNumberValidator,
    minLengthValidator
};
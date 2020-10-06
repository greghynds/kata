
function validate(password, isAdmin) {
    const includesRequiredCharacters = !isAdmin || /[!@#$%^&*]/.test(password);
    const includesLetters = /[a-zA-Z]/.test(password);
    const includesNumbers = /[0-9]/.test(password);
    const isMinimumLength = password.length >= (isAdmin ? 10 : 7);

    return {
        valid: includesLetters && includesNumbers && isMinimumLength && includesRequiredCharacters,
        reasons: getReasons(
            {
                noRequiredCharacters: !includesRequiredCharacters,
                noLetters: !includesLetters,
                noNumbers: !includesNumbers,
                lessThanMinimumLength: !isMinimumLength
            },
            isAdmin
        )
    };
}

function getReasons(failures, isAdmin) {
    const reasons = [];

    if (failures.lessThanMinimumLength) {
        reasons.push("Minimum " + (isAdmin ? 10 : 7) + " characters");
    }

    if (failures.noLetters) {
        reasons.push("Must include at least one letter");
    }

    if (failures.noNumbers) {
        reasons.push("Must include at least one number");
    }

    if (failures.noRequiredCharacters) {
        reasons.push("Must include at least one special character (!@#$%^&*)");
    }

    return reasons;
}

module.exports = validate;
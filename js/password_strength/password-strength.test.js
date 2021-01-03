const { validate } = require('./password-strength');

test('password with less than 7 characters is invalid', () => {
    const password = "a1";
    const isAdmin = false;
    
    const result = validate(password, isAdmin);

    expect(result.valid).toBe(false);
    expect(result.errors).toContain("Minimum 7 characters");
});

test('password with no letters is invalid', () => {
    const password = "12345678";
    
    const result = validate(password);

    expect(result.valid).toBe(false);
    expect(result.errors).toContain("Must include at least one letter");
});

test('password with no numbers is invalid', () => {
    const password = "abcdefg";
    
    const result = validate(password);

    expect(result.valid).toBe(false);
    expect(result.errors).toContain("Must include at least one number");
});

test('admin password with less than 10 characters is invalid', () => {
    const password = "1!cdefg";
    
    const result = validate(password, true);

    expect(result.valid).toBe(false);
    expect(result.errors).toContain("Minimum 10 characters");
});

test('admin password with no special characters is invalid', () => {
    const password = "1bcdefghij";
    const isAdmin = true;
    
    const result = validate(password, isAdmin);

    expect(result.valid).toBe(false);
    expect(result.errors).toContain("Must include at least one special character (!@#$%^&*)");
});

test('empty password returns all invalid reasons', () => {
    const password = "";
    const errors = [
        "Minimum 7 characters",
        "Must include at least one letter",
        "Must include at least one number"
    ]
    
    const result = validate(password);

    expect(result.errors).toEqual(expect.arrayContaining(errors));
});

test('empty admin password returns all invalid reasons', () => {
    const password = "";
    const errors = [
        "Minimum 10 characters",
        "Must include at least one letter",
        "Must include at least one number",
        "Must include at least one special character (!@#$%^&*)"
    ]
    
    const result = validate(password, true);

    expect(result.errors).toEqual(expect.arrayContaining(errors));
});

test('password with all requirements is valid', () => {
    const password = "123ABcd";
    
    const result = validate(password);  

    expect(result.valid).toBe(true);
});

test('password with numbers and only upper case letters is valid', () => {
    const password = "123ABCD";
    
    const result = validate(password);

    expect(result.valid).toBe(true);
});

test('password with numbers and only lower case letters is valid', () => {
    const password = "123abcd";
    
    const result = validate(password);

    expect(result.valid).toBe(true);
});

test('admin password with all requirements is valid', () => {
    const password = "!1cdefghij";
    
    const result = validate(password, true);

    expect(result.valid).toBe(true);
});

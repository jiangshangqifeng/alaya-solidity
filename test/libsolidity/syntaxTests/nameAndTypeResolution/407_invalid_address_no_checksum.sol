contract C {
    function f() pure public {
        address x = 'apt1lg9le9lys3vyjnxds4lp4pwuj8mlqprw2zm444';
        x;
    }
}
// ----
// SyntaxError 9429: (64-106): This looks like an address but has an invalid checksum. Correct checksummed address: "0xfA0bFc97E48458494Ccd857e1A85DC91F7F0046E". If this is not used as an address, please prepend '00'. For more information please see https://docs.soliditylang.org/en/develop/types.html#address-literals

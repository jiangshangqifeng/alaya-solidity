contract C {
    receive(bytes2) {}
}
contract D is C {
    receive() {}
}
// ----
// SyntaxError 4937: (17-35): No visibility specified. Did you intend to add "external"?
// SyntaxError 4937: (60-72): No visibility specified. Did you intend to add "external"?
// DeclarationError 7793: (17-35): Receive atp function must be payable, but is "nonpayable".
// DeclarationError 4095: (17-35): Receive atp function must be defined as "external".
// DeclarationError 6857: (24-32): Receive atp function cannot take parameters.

library C {
    receive() external payable {}
}
// ----
// DeclarationError 4549: (16-45): Libraries cannot have receive atp functions.
// TypeError 7708: (16-45): Library functions cannot be payable.

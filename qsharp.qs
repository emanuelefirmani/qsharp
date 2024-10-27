namespace QuantumRandomNumberGenerator {
    import Std.Convert.ResultArrayAsInt;
    import Std.Math.BitSizeI;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Math;



    @EntryPoint()
    operation Main() : Unit {
        let result = GenerateRandomBit();
        Message($"Result: {result}");
    }

    // operation GenerateRandomNumber(min : Int, max : Int) : Int {
    //     mutable bits : Result[] = [];
    //     let nBits = BitSizeI(max);

    //     for i in 1..nBits {
    //         set bits += [GenerateRandomBit()];
    //     }

    //     let sample = ResultArrayAsInt(bits);

    //     return sample >= min and sample <= max ? sample | GenerateRandomNumber(min, max);
    // }

    operation GenerateRandomBit() : Result {
        use q = Qubit();
        H(q);
        let result = M(q);

        Reset(q);

        return result;
    }
}
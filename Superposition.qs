namespace ExploringSuperposition {
    import Std.Diagnostics.DumpMachine;
    import Std.Convert.ResultArrayAsBoolArray;
    import Std.Convert.BoolArrayAsInt;
    import Std.Arrays.ForEach;
    import Std.Math.Sqrt;
    import Std.Math.ArcCos;
    open Microsoft.Quantum.Diagnostics;

    @EntryPoint()
    operation GenerateRandomBit() : Int {
        use qBits = Qubit[3];
        ApplyToEach(H, qBits);

        Message("Initialized qubits:");
        DumpMachine(); // First dump

        mutable result = [];
        for q in qBits {
            Message(" ");
            set result += [M(q)];
            Message($"{result}");
            DumpMachine();
        }

        Message("Qubit after the measurement:");
        DumpMachine(); // Third dump

        ResetAll(qBits);
        Message("Qubit after resetting:");
        DumpMachine(); // Fourth dump
        Message(" ");
        return BoolArrayAsInt(ResultArrayAsBoolArray(result));
    }
}
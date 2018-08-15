namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;

    operation Solve (N : Int, Uf : ((Qubit[], Qubit) => ())) : Bool
    {
        body
        {
            mutable isConstant = true;
            
            // Initialize N+1 qubits in the Zero state
            using(qubits = Qubit[N+1]){

                // Put one qubit in the One state
                X(qubits[N]);

                // Apply Hadamard gate to all qubits
                for(index in 0..N){
                    H(qubits[index]);
                }

                // Apply f function using Uf
                Uf(qubits[0..N-1], qubits[N]);

                // Reapply Hadamard gates to all N qubits
                for(index in 0..N-1){
                    H(qubits[index]);
                }

                // Function is balanced if any of the resulting qubits are in the
                // One state. Resets state of all qubits.
                for(index in 0..N-1){
                    if(M(qubits[index]) == One){
                        set isConstant = false;
                    }
                    Reset(qubits[index]);
                }
                Reset(qubits[N]);
            }

            return isConstant;
        }
    }
}
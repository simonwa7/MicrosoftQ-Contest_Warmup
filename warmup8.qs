namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;

    operation Solve (x : Qubit[], y : Qubit) : ()
    {
        body
        {
            // Each CNOT gate will flip the value of the y
            // state if that qubit is in the One state. Therefore
            // an even number of One state qubits will result in y being
            // left in the Zero state and One if otherwise.
            for(index in 0..Length(x)-1){
                CNOT(x[index], y);
            }
        }
    }
}
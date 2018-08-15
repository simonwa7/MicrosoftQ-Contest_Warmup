namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;

    operation Solve (qs : Qubit[], bits0 : Bool[], bits1 : Bool[]) : Int
    {
        body
        {
            // Loop through list of qubits
            for(index in 0..Length(bits0)-1){
                // Continue to loop until the bit strings differ
                if(bits0[index] != bits1[index]){
                    // If the measured qubit is in the Zero state, then check
                    // to see if the associated bit in the bits0 string is 
                    // false. If it is, return 0, otherwise return 1
                    if(M(qs[index]) == Zero){
                        if(bits0[index] == false){
                            return 0;
                        }
                        return 1;
                    }else{
                    // If the measured qubit is in the One state, then check
                    // to see if the associated bit in the bits0 string is 
                    // true. If it is, return 0, otherwise return 1
                        if(bits0[index] == true){
                            return 0;
                        }
                        return 1;
                    }
                }
            }

            return 0;
        }
    }
}
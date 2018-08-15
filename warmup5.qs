namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;

    operation Solve (qs : Qubit[]) : Int
    {
        body
        {
            CNOT(qs[0], qs[1]);
            H(qs[0]);

            let result1 = M(qs[0]);
            let result2 = M(qs[1]);

            if(result1 == Zero){
                if(result2 == Zero){
                    return 0;
                }
                return 2;
            }else{
                if(result2 == Zero){
                    return 1;
                }
            }
            return 3;
        }
    }
}
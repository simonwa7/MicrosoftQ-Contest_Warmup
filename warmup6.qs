namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;

    operation Solve (qs : Qubit[], bits0 : Bool[], bits1 : Bool[]) : Int
    {
        body
        {
            for(index in 0..Length(bits0)-1){
                if(bits0[index] != bits1[index]){
                    if(M(qs[index]) == Zero){
                        if(bits0[index] == false){
                            return 0;
                        }
                        return 1;
                    }else{
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
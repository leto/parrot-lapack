$load "rosella/test.pbc";
$load "../../src/LAPACK/singlevaluedecomposition.pbc";

class Test_dgesvd
{

    function dgesvd_test()
    {
        var pla = loadlib("linalg_group");
        var a = new 'NumMatrix2D';
        var S = new 'NumMatrix2D';
        var U = new 'NumMatrix2D';
        var VT = new 'NumMatrix2D';
        a.initialize_from_args(3, 3,
                                1.0, 0.0, 0.0,
                                0.0, 1.0, 0.0,
                                0.0, 0.0, 1.0);

        int jobu,jobvt;
        jobu=jobvt= ord('A', 0);

        using dgesvd_func.dgesvd_exec;
        int info;

    info=dgesvd_exec(a,jobu,jobvt,S,U,VT);    
    
/*
A :      DOUBLE PRECISION array, dimension (LDA,N)
JOBU :   CHARACTER
JOBVT:   CHARACTER
          Specifies options for computing all or part of the matrix U:
          = 'A':  all M columns of U are returned in array U:
          = 'S':  the first min(m,n) columns of U (the left singular
                  vectors) are returned in the array U;
          = 'O':  the first min(m,n) columns of U (the left singular
                  vectors) are overwritten on the array A;
          = 'N':  no columns of U (no left singular vectors) are
                  computed.
 S :     DOUBLE PRECISION array, dimension (min(M,N))
 U :     DOUBLE PRECISION array, dimension (LDU,UCOL)
 VT :    DOUBLE PRECISION array, dimension (LDVT,N)
*/
    
        self.assert.equal(info,0);
        self.assert.equal(U,a);
        self.assert.equal(VT,a);

        //say(S);
        //say(U);
        //say(VT);
    
	
    }
}

function main[main](var args)
{
	using Rosella.Test.test;
	test(class Test_dgesvd);
}

$load "rosella/test.pbc";
$load "../../src/LAPACK/C_eigenvectors.pbc";

class Test_zgeev_eve
{

    function zgeev_eve_test()
    {
	    var pla = loadlib("linalg_group");
        var a = new 'ComplexMatrix2D';
        var w =new 'ComplexMatrix2D';
        var vl =new 'ComplexMatrix2D';
        var vr =new 'ComplexMatrix2D';
        var info;
        a.initialize_from_args(3, 3,
                                1.0, 0.0, 0.0,
                                0.0, 1.0, 0.0,
                                0.0, 0.0, 1.0);

        using zgeev_func_eve.zgeev_exec_eve;
        info=zgeev_exec_eve(a,w,vl,vr);
        
/*
    A:      COMPLEX*16 array, dimension (LDA,N)
    W:      COMPLEX*16 array, dimension (N)
    JOBVL: CHARACTER
    JOBVR: CHARACTER
          = 'N': left eigenvectors of A are not computed;
          = 'V': left eigenvectors of A are computed.
*/
        
        self.assert.equal(info,0);
        self.assert.equal(vl,a);
        self.assert.equal(vr,a);
   
        say("right eigenvectors=\n",vr);
        say("left eigenvectors=\n",vl);
    }
	
}

function main[main](var args)
{
	using Rosella.Test.test;
	test(class Test_zgeev_eve);
}
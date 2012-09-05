$load "rosella/test.pbc";
$load "../../src/LAPACK/eigenvectors.pbc";

class Test_dgeev_eve
{

    function dgeev_eve_test()
    {
	    var pla = loadlib("linalg_group");
        var a = new 'NumMatrix2D';
        var wr =new 'NumMatrix2D';
        var wi =new 'NumMatrix2D';
        var vl =new 'NumMatrix2D';
        var vr =new 'NumMatrix2D';
        var info;
        a.initialize_from_args(3, 3,
                                1.0, 0.0, 0.0,
                                0.0, 1.0, 0.0,
                                0.0, 0.0, 1.0);

        using dgeev_func_eve.dgeev_exec_eve;
        info=dgeev_exec_eve(a,wr,wi,vl,vr);

/*
    A:      DOUBLE PRECISION array, dimension (LDA,N)
    WR:     DOUBLE PRECISION array, dimension (N)
    WI:     DOUBLE PRECISION array, dimension (N)
    VL:     DOUBLE PRECISION array, dimension (LDVL,N)
    VR:     DOUBLE PRECISION array, dimension (LDVR,N)

*/        
        
        self.assert.equal(info,0);
        self.assert.equal(vr,a);
        self.assert.equal(vl,a);
   
        say("right eigenvectors=\n",vr);
        say("left eigenvectors=\n",vl);
    }
	
}

function main[main](var args)
{
	using Rosella.Test.test;
	test(class Test_dgeev_eve);
}
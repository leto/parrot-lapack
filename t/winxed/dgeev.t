$load "rosella/test.pbc";
$load "../../src/LAPACK/eigenvalues.pbc";

class Test_dgeev
{

    function dgeev_test()
    {
	var pla = loadlib("linalg_group");
        var a = new 'NumMatrix2D';
        var b = new 'NumMatrix2D';
        var c = new 'NumMatrix2D';
		var wr=new 'NumMatrix2D';
        var wi=new 'NumMatrix2D';

        int jobvl,jobvr;
        jobvl=jobvr= ord('N', 0);
		var info;
        a.initialize_from_args(3, 3,
                                1.0, 0.0, 0.0,
                                0.0, 1.0, 0.0,
                                0.0, 0.0, 1.0);
        b.initialize_from_args(3, 3,
                                1.0, 1.0, 1.0,
                                0.0, 0.0, 0.0,
                                0.0, 0.0, 0.0);
        c.resize(3,3);

        using dgeev_func_eva.dgeev_exec_eva;
        info=dgeev_exec_eva(a,wr,wi,jobvl,jobvr);
        
/*
    A:      DOUBLE PRECISION array, dimension (LDA,N)
    WR:     DOUBLE PRECISION array, dimension (N)
    WI:     DOUBLE PRECISION array, dimension (N)
    JOBVL: CHARACTER
    JOBVR: CHARACTER
          = 'N': left eigenvectors of A are not computed;
          = 'V': left eigenvectors of A are computed.
*/
        
        self.assert.equal(info,0);
        self.assert.equal(wr,b);
        self.assert.equal(wi,c);
	
		say("eigen values=\n");
		int i,j;
		for(i=0;i<3;++i)
		{
			for(j=0;j<3;++j)
				print(wr[i,j],"+j",wi[i,j],"\t");
			say();
		}
	
    }
}

function main[main](var args)
{
	using Rosella.Test.test;
	test(class Test_dgeev);
}
$load "rosella/test.pbc";
$load "../../src/LAPACK/C_Double.pbc";

class Test_zgetrf{

    function zgetrf_test(){
	var pla = loadlib("linalg_group");
	var a = new 'ComplexMatrix2D';
        a.initialize_from_args(3, 3,
                                1.0, 0.0, 0.0,
                                0.0, 1.0, 0.0,
                                0.0, 0.0, 1.0);
	using zgetrf_func.ipiv_size;
        int ipiv_size_v;
        ipiv_size_v=ipiv_size(a);
        say(ipiv_size_v);
        int ipiv[ipiv_size_v];
        int i;
        for(i=0;i<ipiv_size_v;i++)
                ipiv[i]=0;
        say("printing ipiv:\n",ipiv);
        using zgetrf_func.zgetrf_exec;
        int info;
        info=zgetrf_exec(a,ipiv);

/*
    A:      COMPLEX*16 array, dimension (LDA,N)
    IPIV:   INTEGER array, dimension (min(M,N))
*/

        
	say("printing A");
	say(a);
	self.assert.equal(info,0);
    self.assert.not_equal(a.rows,0);
    
    self.assert.not_equal(a.cols,0);
	

    }
}

function main[main](var args) {
    using Rosella.Test.test;
    test(class Test_zgetrf);
}
	
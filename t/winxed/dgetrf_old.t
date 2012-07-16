$load "rosella/test.pbc";
$load "./src/LAPACK/Double.pbc";

class Test_dgetrf{

    function dgetrf_test(){
	var pla = loadlib("linalg_group");
        var lapack = loadlib('liblapack.so');
	var A = new 'NumMatrix2D';
        A.initialize_from_args(3, 3,
                                1.0, 2.0, 3.0,
                                4.0, 5.0, 6.0,
                                7.0, 8.0, 9.0);
	int m,n,lda,ipiv_size,info;
        m=n=3;
	using dgetrf_func.max;
	using dgetrf_func.min;
        lda=max(1,m);
        ipiv_size=min(m,n);
        int ipiv[ipiv_size];
        var dgetrf = dlfunc(lapack, "dgetrf_", "vpppppp");
        if(dgetrf == null || !dgetrf)
                die("Not DGETRF");
        dgetrf(m,n,A,lda,ipiv,info);
	self.assert.equal(info,0);

    }
}

function main[main](var args) {
    using Rosella.Test.test;
    test(class Test_dgetrf);
}
	

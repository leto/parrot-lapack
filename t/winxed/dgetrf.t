$load "rosella/test.pbc";
$load "../../src/LAPACK/Double.pbc";

class Test_dgetrf{

    function dgetrf_test(){
	var pla = loadlib("linalg_group");
	var a = new 'NumMatrix2D';
        a.initialize_from_args(3, 3,
                                11.0, 2.0, 3.0,
                                4.0, 5.0, 6.0,
                                7.0, 1.0, 2.0);
	using dgetrf_func.ipiv_size;
        int ipiv_size_v;
        ipiv_size_v=ipiv_size(a);
        say(ipiv_size_v);
        int ipiv[ipiv_size_v];
        int i;
        for(i=0;i<ipiv_size_v;i++)
                ipiv[i]=0;
        say("printing ipiv:\n",ipiv);
        using dgetrf_func.dgetrf_exec;
        int info;
        info=dgetrf_exec(a,ipiv);
	say("printing A");
	say(a);
	self.assert.equal(info,0);
	self.assert.not_equal(a.rows,0);
	self.assert.not_equal(a.cols,0);
	

    }
}

function main[main](var args) {
    using Rosella.Test.test;
    test(class Test_dgetrf);
}
	

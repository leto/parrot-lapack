$load "rosella/test.pbc";
$load "../../src/LAPACK/C_inverse.pbc";

class Test_zgetri{

	function zgetri_test(){
        var pla = loadlib("linalg_group");
        var a = new 'ComplexMatrix2D';
        a.initialize_from_args(3, 3,
                                1.0, 0.0, 0.0,
                                0.0, 1.0, 0.0,
                                0.0, 0.0, 1.0);
	using zgetri_func.zgetri_exec;
        int info;
        info=zgetri_exec(a);

// A is COMPLEX*16 array, dimension (LDA,N)
        
	self.assert.equal(info,0);
	say(a);

	}

}

function main[main](var args) {
    using Rosella.Test.test;
    test(class Test_zgetri);
}



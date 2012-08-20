$load "rosella/test.pbc";
$load "../../src/LAPACK/inverse.pbc";

class Test_dgetri{

	function dgetri_test(){
        var pla = loadlib("linalg_group");
        var a = new 'NumMatrix2D';
        a.initialize_from_args(3, 3,
                                1.0, 0.0, 0.0,
                                0.0, 1.0, 0.0,
                                0.0, 0.0, 1.0);
	using dgetri_func.dgetri_exec;
        int info;
        info=dgetri_exec(a);
	self.assert.equal(info,0);
	say(a);

	}

}

function main[main](var args) {
    using Rosella.Test.test;
    test(class Test_dgetri);
}



$load "rosella/test.pbc";
$load "./src/LAPACK/Double.pbc";

class Test_dgetrf{

    function dgetrf_test(){
	var pla = loadlib("linalg_group");
	var a = new 'NumMatrix2D';
	var b = new 'NumMatrix2D';
        a.initialize_from_args(3, 3,
                                11.0, 2.0, 3.0,
                                4.0, 5.0, 6.0,
                                7.0, 1.0, 2.0);

	using dgetrf_func.dgetrf_exec;
        b=dgetrf_exec(a);
	say("printing B");
	say(b);
	//self.assert.notequal(b.rows,0);
	//self.assert.notequal(b.cols,0);


    }
}

function main[main](var args) {
    using Rosella.Test.test;
    test(class Test_dgetrf);
}
	

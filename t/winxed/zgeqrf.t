$load "rosella/test.pbc";
$load "../../src/LAPACK/C_qrfactorisation.pbc";

class Test_zgeqrf
{

    function zgeqrf_test()
    {
	var pla = loadlib("linalg_group");
        var a = new 'ComplexMatrix2D';
        var b = new 'ComplexMatrix2D';
        a.initialize_from_args(3, 3,
                                1.0, 0.0, 0.0,
                                0.0, 1.0, 0.0,
                                0.0, 0.0, 1.0);
        b.initialize_from_args(3, 3,
                                1.0, 0.0, 0.0,
                                0.0, 1.0, 0.0,
                                0.0, 0.0, 1.0);
 
	int info;
	using zgeqrf_func.zgeqrf_exec;
	info=zgeqrf_exec(a);
    
    self.assert.equal(info,0);
	self.assert.equal(a,b);
	
    say("printing A");
    say(a);
	
    }
}

function main[main](var args)
{
	using Rosella.Test.test;
	test(class Test_zgeqrf);
}

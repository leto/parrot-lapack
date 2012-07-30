$load "rosella/test.pbc";
$load "../../src/LAPACK/qrfactorisation.pbc";

class Test_dgeqrf
{

    fuction dgeqrf_test()
    {
	var pla = loadlib("linalg_group");
        var a = new 'NumMatrix2D';
        a.initialize_from_args(3, 3,
                                1.0, 0.0, 0.0,
                                0.0, 1.0, 0.0,
                                0.0, 0.0, 1.0);
	int info;
	using dgeqrf_func.dgeqrf_exec;
	info=dgeqef_exec(a);
        self.assert.equal(info,0);
	say("printing A");
        say(a);

    }
}

function main[main](var args)
{
	using Rosella.Test.test;
	test(class Test_dgeqrf);
}

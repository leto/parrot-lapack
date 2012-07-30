$load "rosella/test.pbc";
$load "../../src/LAPACK/orthoqrfactorisation.pbc";

class Test_dorgqr
{

    function dorgqr_test()
    {
	var pla = loadlib("linalg_group");
        var a = new 'NumMatrix2D';
        a.initialize_from_args(3, 3,
                                1.0, 0.0, 0.0,
                                0.0, 1.0, 0.0,
                                0.0, 0.0, 1.0);
//have to make a copy of a 
	int info;
	using dorgqr_func.dorgqr_exec;
	info=dorgqr_exec(a,0);
	
        self.assert.equal(info,0);
	self.assert.equal(a,a);
	say("printing A");
        say(a);
	
    }
}

function main[main](var args)
{
	using Rosella.Test.test;
	test(class Test_dorgqr);
}

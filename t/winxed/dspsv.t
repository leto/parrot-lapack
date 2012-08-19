$load "rosella/test.pbc";
$load "../../src/LAPACK/linearequation.pbc";

class Test_dspsv
{

    function dspsv_test()
    {
		var pla = loadlib("linalg_group");
		var a = new 'NumMatrix2D';
    	var b=new 'NumMatrix2D';
    	var ap=new 'NumMatrix2D';
		int uplo;
		uplo=85;
		a.initialize_from_args(3, 3,
                                1.0, 0.0, 0.0,
                                0.0, 1.0, 0.0,
                                0.0, 0.0, 1.0);
		b.initialize_from_args(3, 1,
				1.0,
				2.0,
				3.0);
        using dspsv_func.dspsv_exec;
        ap=dspsv_exec(a,b,uplo);

		say("AP=");
		say(ap);
		say("B=");
		say(b);
    }
}

function main[main](var args)
{
	using Rosella.Test.test;
	test(class Test_dspsv);
}
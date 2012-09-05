$load "rosella/test.pbc";
$load "../../src/LAPACK/C_linearequation.pbc";

class Test_zspsv
{

    function zspsv_test()
    {
		var pla = loadlib("linalg_group");
		var a = new 'ComplexMatrix2D';
    	var b=new 'ComplexMatrix2D';
    	var ap=new 'ComplexMatrix2D';
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
        using zspsv_func.zspsv_exec;
        ap=zspsv_exec(a,b,uplo);

/*
	A:		DOUBLE PRECISION array, dimension (LDA,N)
	B:		DOUBLE PRECISION array, dimension (LDB,NRHS)
	UPLO:	CHARACTER
         	'U':  Upper triangle of A is stored
          	'L':  Lower triangle of A is stored.
*/        

		say("AP=");
		say(ap);
		say("B=");
		say(b);
    }
}

function main[main](var args)
{
	using Rosella.Test.test;
	test(class Test_zspsv);
}

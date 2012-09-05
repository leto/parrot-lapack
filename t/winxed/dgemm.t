$load "rosella/test.pbc";
$load "../../src/LAPACK/multiplication.pbc";

class Test_dgemm
{

    function dgemm_test()
    {
		var pla = loadlib("linalg_group");
        var A=new 'NumMatrix2D';
        var B=new 'NumMatrix2D';
        A.initialize_from_args(3, 3,
                                1.0, 0.0, 0.0,
                                0.0, 1.0, 0.0,
                                0.0, 0.0, 1.0);
		B.initialize_from_args(3, 3,
                                1.0, 0.0, 0.0,
                                0.0, 1.0, 0.0,
                                0.0, 0.0, 1.0);
		var result=new 'NumMatrix2D';
		using multiplication.matmul;
		result=matmul(A,B);

/*
A :     DOUBLE PRECISION array of DIMENSION ( LDA, ka )
B :     DOUBLE PRECISION array of DIMENSION ( LDB, kb )
*/
        
		say("result=");
		say(result);
		self.assert.equal(A,result);
    }
}

function main[main](var args)
{
	using Rosella.Test.test;
	test(class Test_dgemm);
}
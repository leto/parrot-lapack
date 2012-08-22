$load "rosella/test.pbc";
$load "../../src/LAPACK/C_singlevaluedecomposition.pbc";

class Test_zgesvd
{

    function zgesvd_test()
    {
        var pla = loadlib("linalg_group");
    var a = new 'ComplexMatrix2D';
    var S = new 'ComplexMatrix2D';
    var U = new 'ComplexMatrix2D';
    var VT = new 'ComplexMatrix2D';
    a.initialize_from_args(3, 3,
                                1.0, 0.0, 0.0,
                                0.0, 1.0, 0.0,
                                0.0, 0.0, 1.0);

    int jobu,jobvt;
    jobu=jobvt= ord('A', 0);

    using zgesvd_func.zgesvd_exec;
    int info;

    info=zgesvd_exec(a,jobu,jobvt,S,U,VT);    
    
        self.assert.equal(info,0);
        self.assert.equal(U,a);
        self.assert.equal(VT,a);

        //say(S);
        //say(U);
        //say(VT);
    
	
    }
}

function main[main](var args)
{
	using Rosella.Test.test;
	test(class Test_zgesvd);
}

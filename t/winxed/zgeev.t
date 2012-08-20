$load "rosella/test.pbc";
$load "../../src/LAPACK/C_eigenvalues.pbc";

class Test_zgeev
{

    function zgeev_test()
    {
	var pla = loadlib("linalg_group");
        var a = new 'ComplexMatrix2D';
        var b = new 'ComplexMatrix2D';
        var w=new 'ComplexMatrix2D';

        int jobvl,jobvr;
        jobvl=jobvr= ord('N', 0);
        var info;
        a.initialize_from_args(3, 3,
                                1.0, 0.0, 0.0,
                                0.0, 1.0, 0.0,
                                0.0, 0.0, 1.0);
        b.initialize_from_args(3, 3,
                                1.0, 1.0, 1.0,
                                0.0, 0.0, 0.0,
                                0.0, 0.0, 0.0);

        using zgeev_func_eva.zgeev_exec_eva;
        info=zgeev_exec_eva(a,w,jobvl,jobvr);
   
        

        self.assert.equal(info,0);
        self.assert.equal(w,b);
	
		say("successful\n");
        say("eigen values=\n");
        say(w);
		
	
    }
}

function main[main](var args)
{
	using Rosella.Test.test;
	test(class Test_zgeev);
}
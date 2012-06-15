$load "rosella/test.pbc";
//$load "./src/mat.pbc";

class MyTests {
	

    function first_test() {
	var pla = loadlib("linalg_group");
	var identity_matrix=new 'NumMatrix2D';
	identity_matrix.initialize_from_args(1,1,
					         1.0);
    	self.assert.equal(identity_matrix.rows, 1);
	self.assert.equal(identity_matrix.cols, 1);
	self.assert.equal(identity_matrix[0, 0], 1);
    }
}

function main[main](var args) {
    using Rosella.Test.test;
    test(class MyTests);
}



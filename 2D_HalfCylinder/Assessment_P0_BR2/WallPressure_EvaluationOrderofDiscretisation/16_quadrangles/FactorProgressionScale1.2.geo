// Sana AMRI - 01/04/2019
// Structured coarse Mesh: Half cylinder
//=>  Unrefined_Mesh_233_elements.msh 

///////////////////////////////////////////////////////////////////////
// REMINDER: 
// Line(id number) = {start point, end point}

// Circle(id number) = {start point, center of the circle, end point}
// trigonometric direction
//http://www.manpagez.com/info/gmsh/gmsh-2.4.0/gmsh_33.php#SEC33
///////////////////////////////////////////////////////////////////////


cl = 5e-3; // caracteristic length
cl1 = 5e-3;
cl2 = 5e-3; 
cl3 = 5e-3; 

Point(1) = {0,0,0,cl};
Point(2) = {0.07,0,0,cl3};
Point(3) = {0.09,0,0,cl};
Point(4) = {0.11,0,0,cl3};
Point(5) = {0.18,0,0,cl};
Point(6) = {0.09,0.045,0,cl};
Point(7) = {0.09,-0.06,0,cl};
Point(8) = {0.09,0.038,0,cl};
Point(9) = {0.09,0.0359,0,cl};

Point(11) = {0.038,0,0,cl2};
Point(12) = {0.142,0,0,cl2};

Point(14) = {0.055,0.02,0,cl};
Point(15) = {0.125,0.02,0,cl};
Point(16) = {0.09,0.03,0,cl};
Point(17) = {0.0532,0.015,0,cl};
Point(18) = {0.1268,0.015,0,cl};
Point(19) = {0.069,0,0,cl3};
Point(20) = {0.111,0,0,cl3};
Point(21) = {0.09,-0.03,0,cl};

Line(1) = {1,2};
Line(2) =  {4,5};
Circle(5) = {4,3,2};
//Circle(6) = {12,21,11};
Circle(7) = {5,7,1};

Line Loop(1) = {1,-5,2,7};



Plane Surface(1) = {1};



// Lancer ce cas test jusqu'au bout
// Case With Progression Factor
Transfinite Line{5,7} = 5;//bl
Transfinite Line{-1,2} = 5;
Transfinite Surface {1};
Recombine Surface{1};
Recombine Surface{1};



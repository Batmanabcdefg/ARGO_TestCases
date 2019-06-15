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


cl = 3e-2; // caracteristic length
cl1 = 4e-4;
cl2 = 1e-3; 
cl3 = 7e-4; 

Point(1) = {0,0,0,cl};
Point(2) = {0.07,0,0,cl3};
Point(3) = {0.09,0,0,cl};
Point(4) = {0.11,0,0,cl3};
Point(5) = {0.18,0,0,cl};
Point(6) = {0.09,0.045,0,cl};
Point(7) = {0.09,-0.06,0,cl};
Point(8) = {0.09,0.038,0,cl};
Point(9) = {0.09,0.0359,0,cl};
Point(10) = {0.034,0,0,cl1};
Point(11) = {0.038,0,0,cl2};
Point(12) = {0.142,0,0,cl2};
Point(13) = {0.146,0,0,cl1};
Point(14) = {0.055,0.02,0,cl};
Point(15) = {0.125,0.02,0,cl};
Point(16) = {0.09,0.03,0,cl};
Point(17) = {0.0532,0.015,0,cl};
Point(18) = {0.1268,0.015,0,cl};
Point(19) = {0.069,0,0,cl3};
Point(20) = {0.111,0,0,cl3};

Line(1) = {1,10};
Line(2) =  {10,11};
Line(3) = {11,19};
Line(4) = {20,12};
Line(5) = {12,13};
Line(6) = {13,5};
Circle(7) = {4,3,2};
Line(8) = {4,5};
Circle(9) = {5,7,1};
BSpline(10) = {10,14,8,15,13};
BSpline(11) = {11,17,9,18,12};
Circle(12) = {20,3,19};
Line(13) = {19,2};
Line(14) = {4,20};

Line Loop(1) = {1,10,6,9};
Line Loop(2) = {2,11,5,-10};
Line Loop(3) = {3,-12,4,-11};
Line Loop(4) = {13,-7,14,12};

Plane Surface(1) = {1};
Plane Surface(2) = {2};
Plane Surface(3) = {3};
Plane Surface(4) = {4};

// Lancer ce cas test jusqu'au bout
// Case With Progression Factor
Transfinite Line{7,12} = 80;//bl
Transfinite Line{-13,14} = 20 Using Progression 1.18;
Transfinite Surface {4};
Recombine Surface{4};
Recombine Surface{3};

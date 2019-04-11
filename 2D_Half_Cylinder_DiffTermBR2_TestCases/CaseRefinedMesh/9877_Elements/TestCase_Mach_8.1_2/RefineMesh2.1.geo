// Sana AMRI - 05/04/2019
// Structured coarse Mesh 
// (refined along the shock and BL: Half cylinder)

///////////////////////////////////////////////////////////////////////
// REMINDER: 
// Line(id number) = {start point, end point}

// Circle(id number) = {start point, center of the circle, end point}
// trigonometric direction
//http://www.manpagez.com/info/gmsh/gmsh-2.4.0/gmsh_33.php#SEC33
///////////////////////////////////////////////////////////////////////


cl = 0.8; // caracteristic length
cl1 = 0.015;//BL
cl2 = 0.055; //Shock

Point(1) = {0,0,0,cl};
Point(2) = {3,0,0,cl1};
Point(3) = {3.85,0,0,cl};
Point(4) = {4.70,0,0,cl1};
Point(5) = {7.70,0,0,cl};
Point(6) = {3.85,-3,0,cl};
Point(7) = {2.96,0,0,cl1};
Point(8) = {4.74,0,0,cl1};
Point(9) = {1.475, 0, 0, cl2};
Point(11) = {6.225, 0, 0, cl2};
Point(14) = {1.4, 0, 0, cl1};
Point(15) = {6.30, 0, 0, cl1};
Point(16) = {3.85,-1.4,0,cl};

Point(17) = {3.85, 1.6, 0, cl2};
Point(26) = {3.85,1.45, 0, cl2};
Point(20) = {1.25, 0, 0, cl1};
Point(21) = {6.45, 0, 0, cl1};
Point(22) = {2.3, 1.1, 0, cl2};
Point(23) = {5.4, 1.1, 0, cl2};
Point(24) = {1.72, 0.46, 0, cl2};
Point(25) = {5.98, 0.46, 0, cl2};
Point(28) = {2.55, 1.1, 0, cl2};
Point(29) = {5.15, 1.1, 0, cl2};

Circle(1) = {4,3,2};
Circle(2) = {8,3,7};
Circle(3) = {5,6,1};

Line(4) = {1,14};
Line(5) = {14,9};
Line(6) = {9,7};
Line(7) = {7,2};
Line(8) = {4,8};
Line(9) = {8,11};
Line(10) = {11,15};
Line(11) = {15,5};
Line(15) = {20,9};
Line(16) = {11,21};
Line(17) = {1,20};
Line(18) = {21,5};

//Circle(12) = {11,16,9};

Circle(13) = {15,16,14};
//BSpline(14) = {21,25,23,17,22,24,20};
BSpline(14) = {21,23,17,22,20};
BSpline(19) = {11,29,26,28,9};
// Definition des regions
// de l'interieur vers l'exterieur

//Wall
Line Loop(1) = {7,-1,8,2};
Plane Surface(1) = {1};

// Apres shock 
Line Loop(2) = {6,-2,9,19};
Plane Surface(2) ={2};
Recombine Surface{2};


// Shock 
//Line Loop(3) = {5,-12,10,13}; // pour le cercle 13
Line Loop(3) = {15,-19,16,14};
Plane Surface(3) ={3};


// Inlet
Line Loop(4) = {17,-14,18,3}; // pour le cercle 13
Plane Surface(4) ={4};
Recombine Surface{4};




Coherence;

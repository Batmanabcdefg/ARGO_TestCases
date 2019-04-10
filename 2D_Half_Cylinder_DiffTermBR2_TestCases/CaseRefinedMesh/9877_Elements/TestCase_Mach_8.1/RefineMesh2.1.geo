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
Point(9) = {1.575, 0, 0, cl2};
Point(11) = {6.125, 0, 0, cl2};
Point(14) = {1.4, 0, 0, cl1};
Point(15) = {6.30, 0, 0, cl1};
Point(16) = {3.85,-1.4,0,cl};



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

Circle(12) = {11,16,9};
Circle(13) = {15,16,14};

// Definition des regions
// de l'interieur vers l'exterieur

//Wall
Line Loop(1) = {7,-1,8,2};
Plane Surface(1) = {1};

// Apres shock 
Line Loop(2) = {6,-2,9,12};
Plane Surface(2) ={2};
Recombine Surface{2};


// Shock 
Line Loop(3) = {5,-12,10,13};
Plane Surface(3) ={3};


// Inlet
Line Loop(4) = {4,-13,11,3};
Plane Surface(4) ={4};
Recombine Surface{4};



Coherence;
Coherence;
Coherence;

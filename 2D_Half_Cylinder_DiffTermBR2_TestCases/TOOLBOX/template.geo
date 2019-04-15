// Structured coarse Mesh 1 : 

///////////////////////////////////////////////////////////////////////
// REMINDER: 
// Line(id number) = {start point, end point}

// Circle(id number) = {start point, center of the circle, end point}
// trigonometric direction
//http://www.manpagez.com/info/gmsh/gmsh-2.4.0/gmsh_33.php#SEC33
///////////////////////////////////////////////////////////////////////


cl = 3e-1; // caracteristic length


Point(1) = {0,0,0,cl};
Point(2) = {3,0,0,cl};
Point(3) = {3.85,0,0,cl};
Point(4) = {4.70,0,0,cl};
Point(5) = {7.70,0,0,cl};
Point(6) = {3.85,-3,0,cl};


Line(1) = {1,2};
Circle(2) = {4,3,2};
Line(3) = {4,5};
Circle(4) = {5,6,1};

Line Loop(1) = {1,-2,3,4};
Plane Surface(1) = {1};

// Case Without Progression Factor
Transfinite Line{2,4} = 20;//bl
Transfinite Line{-1,3} = 10 Using Progression 1;
Transfinite Surface {1};
Recombine Surface{1};

// Case With Progression Factor
/*
Transfinite Line{2,4} = 20;//bl
Transfinite Line{-1,3} = 30 Using Progression 1.3;
Transfinite Surface {1};
Recombine Surface{1};
*/

//Field[1] = BoundaryLayer;
//Field[1].AnisoMax = 1.0;
//Field[1].EdgesList = {3,7};
//Field[1].NodesList = {2,4,7,13};
//Field[1].hwall_n = 1e-4;
//Field[1].thickness = 0.06;
//Field[1].ratio = 1.30;
//BoundaryLayer Field = 1;

//Field[1] = BoundaryLayer;
//Field[1].AnisoMax = 1.0;
//Field[1].EdgesList = {2};
//Field[1].NodesList = {2,4};
//Field[1].hwall_n = 1e-6;
//Field[1].thickness = 0.06;
//Field[1].ratio = 1.30;
//BoundaryLayer Field = 1;




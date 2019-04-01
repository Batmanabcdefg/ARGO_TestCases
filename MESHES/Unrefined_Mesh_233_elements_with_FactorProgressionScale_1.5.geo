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


// Case With Progression Factor
Transfinite Line{2,4} = 20;//bl
Transfinite Line{-1,3} = 10 Using Progression 1.5;
Transfinite Surface {1};
Recombine Surface{1};




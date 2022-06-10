d = DefineNumber[ 1, Name "Parameters/d" ];
//+
SetFactory("OpenCASCADE");
Sphere(1) = {0, 0, 12*d, d/2, -Pi/2, Pi/2, 2*Pi};
//+
Cylinder(2) = {0, 0, 0, 0, 0, 1, 2.67*d, 2*Pi};
//+
Dilate {{0, 0, 12*d}, {1, 1, d/1.5}} {
  Volume{1}; 
}
Rotate {{0, 1, 0}, {0, 0, 12*d}, Pi/4} {
  Volume{1}; 
}
//+
Dilate {{0, 0, 0}, {1, 1, 15*d}} {
  Volume{2}; 
}
Physical Surface("Top") = {7};
//+
Physical Surface("SideCylinder") = {6};
//+
Physical Surface("Bottom") = {8};
//+
Physical Surface("ParticleSurf") = {5};
//+
Surface Loop(5) = {7, 6, 8};
//+
Surface Loop(6) = {5};
//+
Volume(3) = {5, 6};
//+
Physical Volume("ParticleVolume") = {1};
Physical Volume("Fluid") = {3};

Characteristic Length{PointsOf{Volume{3};}} = d/2;//+
Characteristic Length{PointsOf{Volume{1};}} = d/8;//+
Characteristic Length{PointsOf{Surface{5};}} = d/10;//+
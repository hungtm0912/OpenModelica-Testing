within ByD_D1.Dependencies;

block Avoid_Zero_Division
  Modelica.Blocks.Interfaces.RealInput u1 annotation(
    Placement(visible = true, transformation(origin = {-110, 56}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-98, 54}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u2 annotation(
    Placement(visible = true, transformation(origin = {-112, -66}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-98, -66}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y annotation(
    Placement(visible = true, transformation(origin = {106, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput threshold annotation(
    Placement(visible = true, transformation(origin = {-112, -2}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-100, -2}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
algorithm
if abs(u2)<threshold then
y := 0;
else
y := u1/u2;
end if
annotation(
    uses(Modelica(version = "4.0.0")));end Avoid_Zero_Division;

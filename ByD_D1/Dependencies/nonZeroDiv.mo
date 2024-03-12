within ByD_D1.Dependencies;

model nonZeroDiv
  Modelica.Blocks.Interfaces.RealInput u1 annotation(
    Placement(visible = true, transformation(origin = {-120, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u2 annotation(
    Placement(visible = true, transformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y1 annotation(
    Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Real eps=ModelicaServices.Machine.eps;
equation
if abs(u2) <= eps then
  y1 = u1/(u2+eps);
  else
  y1 = u1/u2;
end if

annotation(
    uses(Modelica(version = "4.0.0")));
annotation(
    uses(Modelica(version = "4.0.0")),
    Icon(graphics = {Text(origin = {0, 2}, extent = {{-44, -10}, {44, 10}}, textString = "NonZeroDiv"), Rectangle(extent = {{-100, 100}, {100, -100}})}));
end nonZeroDiv;

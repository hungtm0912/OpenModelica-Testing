within ByD_D1.Dependencies;

block LinearSpline
  Modelica.Blocks.Interfaces.RealInput u annotation(
    Placement(visible = true, transformation(origin = {-118, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-104, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput f annotation(
    Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {98, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
parameter Real xl = -10;
parameter Real xr = 10;
parameter Real yl = -1;
parameter Real yr = 1;
algorithm
if u<xl then
f := yl;
elseif u>xr then
f := yr;
else
f := ((yr-yl)/(xr-xl))*u;
end if;
annotation(
    uses(Modelica(version = "4.0.0")));
end LinearSpline;

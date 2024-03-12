within ByD_D1.Dependencies;

block Avoid_zero_speed
  constant Real eps = ModelicaServices.Machine.eps;
  Modelica.Blocks.Interfaces.RealInput spd_in annotation(
    Placement(visible = true, transformation(origin = {-108, 42}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-92, 56}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput spd_nonzero_out annotation(
    Placement(visible = true, transformation(origin = {104, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {108, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput ifzero_out annotation(
    Placement(visible = true, transformation(origin = {-108, -42}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-90, -50}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));

algorithm
if spd_in == 0 then
  spd_nonzero_out := ifzero_out;
else
  spd_nonzero_out := spd_in;
end if;
  
annotation(
    uses(Modelica(version = "4.0.0")),
    Icon(graphics = {Rectangle(extent = {{-100, 100}, {100, -100}})}));
end Avoid_zero_speed;

within ByD_D1.Dependencies;

block Strictly_pos_gate
  Modelica.Blocks.Interfaces.RealInput u annotation(
    Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y annotation(
    Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
algorithm
if u > 0 then
  y := u;
else
  y := 0;
end if
annotation(
    uses(Modelica(version = "4.0.0")));
annotation(
    Icon(graphics = {Rectangle(origin = {-135, 9}, extent = {{5, 5}, {-5, -5}}), Rectangle(extent = {{-100, 100}, {100, -100}}), Text(origin = {-5, 3}, extent = {{-85, 61}, {85, -61}}, textString = ">0 
Gate")}));
end Strictly_pos_gate;

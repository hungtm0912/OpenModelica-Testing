within ByD_D1.Drv;

block spd_function_for_crr
  
  parameter Real a3(unit="s3/m3")=1;
  parameter Real a2(unit="s2/m2")=1;
  parameter Real a1(unit="s/m")=1;
  parameter Real a0=1;
  
  Modelica.Blocks.Interfaces.RealInput u annotation(
    Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y annotation(
    Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {116, -8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
algorithm  

  y := a3*u^3 + a2*u^2 + a1*u + min(20*u*a0, a0)  
  
  annotation(
    uses(Modelica(version = "4.0.0")));
annotation(
    Diagram(graphics = {Rectangle(extent = {{-100, 100}, {100, -100}})}));
end spd_function_for_crr;

within ByD_D1.Dependencies;

block Avoid_Zero_Delay
parameter Real delayy = 0;
  Modelica.Blocks.Interfaces.RealOutput y annotation(
    Placement(visible = true, transformation(origin = {110, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u annotation(
    Placement(visible = true, transformation(origin = {-120, 2}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 2}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
algorithm
y:= if delayy == 0 then u else delay(u,delayy);
end Avoid_Zero_Delay;

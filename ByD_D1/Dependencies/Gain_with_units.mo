within ByD_D1.Dependencies;

model Gain_with_units

  parameter Real k=1;
  Modelica.Blocks.Interfaces.RealInput u annotation(
    Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y annotation(
    Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

equation

y = k*u;

annotation(
    uses(Modelica(version = "4.0.0")),
    Icon(graphics = {Text(origin = {-18, 3}, extent = {{-46, 25}, {46, -25}}, textString = "Units", fontName = "Space Grotesk", textStyle = {TextStyle.Bold}), Polygon(origin = {0, 1}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, points = {{-100, 99}, {-100, -99}, {100, -1}, {100, -1}, {-100, 99}}), Text(origin = {-23, 4}, extent = {{-51, 28}, {51, -28}}, textString = "Units", fontName = "Space Grotesk", textStyle = {TextStyle.Bold})}),
  Diagram);
end Gain_with_units;

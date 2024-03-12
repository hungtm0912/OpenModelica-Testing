within ByD_D1.Dependencies;

model Avoid_zero_array_by_scalar_division
  parameter Integer nu(min=0)=0;

  Modelica.Blocks.Interfaces.RealVectorInput u[nu] annotation(
    Placement(visible = true, transformation(origin = {-100, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-100, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealVectorOutput y[nu] annotation(
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u_denominator annotation(
    Placement(visible = true, transformation(origin = {-108, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-98, -42}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
algorithm
  for i in 1:nu loop
    y[i] := if abs(u_denominator)>0 then u[i]/u_denominator else 0;
  end for;
annotation(
    uses(Modelica(version = "4.0.0")),
    Icon(graphics = {Rectangle(extent = {{-100, 100}, {100, -100}})}));

end Avoid_zero_array_by_scalar_division;

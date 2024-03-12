within ByD_D1.PC_Acc_Env;

block Air_density_calc

  parameter Real M_air_dry(unit="kg/mol")=0.0289644;
  parameter Real x_H2O(unit="kg/mol")=0.018;
  parameter Real Rt(unit="J/(molK)")=8.314472;
  Real p_H2O_sat(unit="Pa");
  Real p_H2O(unit="Pa");

  Modelica.Blocks.Interfaces.RealInput Temp annotation(
    Placement(visible = true, transformation(origin = {-120, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Press annotation(
    Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Humid annotation(
    Placement(visible = true, transformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Air_dens annotation(
    Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
algorithm

  p_H2O_sat := 100*6.112* exp(17.62* Temp/(243.12 + Temp));
  p_H2O := x_H2O*p_H2O_sat/100; 
  Air_dens := (p_H2O*x_H2O+(Press-p_H2O)*M_air_dry)/(Rt*(273.15+Temp));

annotation(
    uses(Modelica(version = "4.0.0")),
    Diagram(graphics = {Rectangle(extent = {{-100, 100}, {100, -100}})}),
  Icon(graphics = {Rectangle(extent = {{-100, 100}, {100, -100}}), Text(origin = {1, 5}, extent = {{-49, 33}, {49, -33}}, textString = "Air
density")}));
end Air_density_calc;

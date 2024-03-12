within ByD_D1.PC_Acc_Env;

model Power_Converter_BYD_D1
parameter Real pc_plant_init_eff = 0.95;
parameter Modelica.Units.SI.Voltage voltage_out = 12;
constant Real eps = ModelicaServices.Machine.eps;
extends Modelica.Electrical.PowerConverters.Interfaces.DCDC.DCtwoPin1;
extends Modelica.Electrical.PowerConverters.Interfaces.DCDC.DCtwoPin2;
  Modelica.Blocks.Interfaces.RealOutput v1 annotation(
    Placement(visible = true, transformation(origin = {-108, 24}, extent = {{8, -8}, {-8, 8}}, rotation = 0), iconTransformation(origin = {-103, -29}, extent = {{3, 3}, {-3, -3}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput i1 annotation(
    Placement(visible = true, transformation(origin = {-108, -22}, extent = {{8, -8}, {-8, 8}}, rotation = 0), iconTransformation(origin = {-103, 23}, extent = {{3, -3}, {-3, 3}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput v2 annotation(
    Placement(visible = true, transformation(origin = {108, 24}, extent = {{-8, -8}, {8, 8}}, rotation = 0), iconTransformation(origin = {103, 23}, extent = {{-3, 3}, {3, -3}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput i2 annotation(
    Placement(visible = true, transformation(origin = {108, -26}, extent = {{-8, -8}, {8, 8}}, rotation = 0), iconTransformation(origin = {103, -27}, extent = {{-3, 3}, {3, -3}}, rotation = 0)));
equation
vDC2 = voltage_out;
v2 = vDC2;
v1 = vDC1;
i1 = iDC1;
i2 = iDC2;
dc_n1.i = - dc_p1.i;
dc_n2.i = - dc_p2.i;
if abs(iDC2) > eps and iDC2 < 0 then
iDC1 = -powerDC2/(pc_plant_init_eff*vDC1 + eps);
elseif abs(iDC2) > eps and iDC2 > 0 then
iDC1 = -(powerDC2*pc_plant_init_eff)/(vDC1 + eps);
else
iDC1 = 0;
end if;
annotation(
    Icon(graphics = {Rectangle(origin = {0, -1},fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 61}, {100, -61}}), Text(origin = {0, -12}, extent = {{-50, 24}, {50, -24}}, textString = "Power
Converter", fontName = "Space Grotesk SemiBold", textStyle = {TextStyle.Bold}), Bitmap(origin = {0, 29}, extent = {{-24, -19}, {24, 19}}, imageSource = "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")}, coordinateSystem(extent = {{-100, -60}, {100, 60}})),
    Diagram(coordinateSystem(extent = {{-100, -60}, {100, 60}}), graphics = {Text(origin = {3, 3}, extent = {{-53, 19}, {53, -19}}, textString = "See equations", fontName = "Space Grotesk SemiBold")}));
end Power_Converter_BYD_D1;

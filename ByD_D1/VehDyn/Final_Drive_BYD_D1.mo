within ByD_D1.VehDyn;

model Final_Drive_BYD_D1

  parameter String fd_losses_maps_fname = "fd_losses_maps.mat";
  parameter Real FDRatio = 4.3;
  parameter Modelica.Units.SI.Inertia FDInertia = 0;
  Modelica.Blocks.Interfaces.RealInput spd_out(unit = "rad/s") annotation(
    Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-105, -63}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput trq_in(unit = "Nm") annotation(
    Placement(visible = true, transformation(origin = {-120, -70}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-105, 1}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput trq_out(unit = "Nm") annotation(
    Placement(visible = true, transformation(origin = {120, -70}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {106, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput spd_in(unit = "rad/s") annotation(
    Placement(visible = true, transformation(origin = {119, -1}, extent = {{-19, -19}, {19, 19}}, rotation = 0), iconTransformation(origin = {106, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput inertia_in(unit = "kgm2") annotation(
    Placement(visible = true, transformation(origin = {-120, 70}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-104, 60}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput inertia_out(unit = "kgm2") annotation(
    Placement(visible = true, transformation(origin = {120, 70}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {106, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain Spd_Gain(k = FDRatio) annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain Ratio1(k = FDRatio) annotation(
    Placement(visible = true, transformation(origin = {-68, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain Ratio2(k = FDRatio) annotation(
    Placement(visible = true, transformation(origin = {-34, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add Sum1 annotation(
    Placement(visible = true, transformation(origin = {38, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant Inertia(k = FDInertia) annotation(
    Placement(visible = true, transformation(origin = {-4, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Abs Abs1 annotation(
    Placement(visible = true, transformation(origin = {-53, -79}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Blocks.Math.Abs Abs2 annotation(
    Placement(visible = true, transformation(origin = {-53, -49}, extent = {{-7, -7}, {7, 7}}, rotation = -90)));
  Modelica.Blocks.Tables.CombiTable2Ds FDTrqLosses( fileName = fd_losses_maps_fname, tableName = "FD_Losses", tableOnFile = true)  annotation(
    Placement(visible = true, transformation(origin = {-10, -66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product losses annotation(
    Placement(visible = true, transformation(origin = {32, -80}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Math.Gain Trq_Gain(k = FDRatio) annotation(
    Placement(visible = true, transformation(origin = {82, -70}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback Substract1 annotation(
    Placement(visible = true, transformation(origin = {58, -80}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  ByD_D1.Dependencies.LinearSpline Blending annotation(
    Placement(visible = true, transformation(origin = {36, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(spd_out, Spd_Gain.u) annotation(
    Line(points = {{-120, 0}, {-12, 0}}, color = {0, 0, 127}));
  connect(Spd_Gain.y, spd_in) annotation(
    Line(points = {{11, 0}, {119, 0}}, color = {0, 0, 127}));
  connect(inertia_in, Ratio1.u) annotation(
    Line(points = {{-120, 70}, {-80, 70}}, color = {0, 0, 127}));
  connect(Ratio1.y, Ratio2.u) annotation(
    Line(points = {{-57, 70}, {-47, 70}}, color = {0, 0, 127}));
  connect(Sum1.y, inertia_out) annotation(
    Line(points = {{49, 70}, {119, 70}}, color = {0, 0, 127}));
  connect(Ratio2.y, Sum1.u1) annotation(
    Line(points = {{-22, 70}, {6, 70}, {6, 76}, {26, 76}}, color = {0, 0, 127}));
  connect(Inertia.y, Sum1.u2) annotation(
    Line(points = {{8, 54}, {8, 64}, {26, 64}}, color = {0, 0, 127}));
  connect(Spd_Gain.y, Abs2.u) annotation(
    Line(points = {{12, 0}, {12, -24}, {-53, -24}, {-53, -41}}, color = {0, 0, 127}));
  connect(trq_in, Abs1.u) annotation(
    Line(points = {{-120, -70}, {-86, -70}, {-86, -79}, {-61, -79}}, color = {0, 0, 127}));
  connect(Abs1.y, FDTrqLosses.u1) annotation(
    Line(points = {{-45, -79}, {-36, -79}, {-36, -60}, {-22, -60}}, color = {0, 0, 127}));
  connect(Abs2.y, FDTrqLosses.u2) annotation(
    Line(points = {{-53, -57}, {-53, -66}, {-30, -66}, {-30, -72}, {-22, -72}}, color = {0, 0, 127}));
  connect(losses.y, Substract1.u2) annotation(
    Line(points = {{41, -80}, {50, -80}}, color = {0, 0, 127}));
  connect(trq_in, Substract1.u1) annotation(
    Line(points = {{-120, -70}, {-86, -70}, {-86, -96}, {58, -96}, {58, -88}}, color = {0, 0, 127}));
  connect(Substract1.y, Trq_Gain.u) annotation(
    Line(points = {{58, -70}, {75, -70}}, color = {0, 0, 127}));
  connect(Trq_Gain.y, trq_out) annotation(
    Line(points = {{89, -70}, {120, -70}}, color = {0, 0, 127}));
  connect(Spd_Gain.y, Blending.u) annotation(
    Line(points = {{12, 0}, {12, -36}, {26, -36}}, color = {0, 0, 127}));
  connect(Blending.f, losses.u1) annotation(
    Line(points = {{46, -36}, {54, -36}, {54, -58}, {16, -58}, {16, -76}, {22, -76}}, color = {0, 0, 127}));
  connect(FDTrqLosses.y, losses.u2) annotation(
    Line(points = {{2, -66}, {8, -66}, {8, -84}, {22, -84}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "4.0.0")),
    Documentation(__OpenModelica_infoHeader = "<html><head></head><body>Model for the final drive used in BYD D1 EV.</body></html>"),
  Diagram(graphics = {Rectangle(origin = {-14, 63}, fillColor = {14, 188, 127}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-78, 29}, {78, -29}}), Text(origin = {-66, 38}, extent = {{-18, 4}, {18, -4}}, textString = "Inertia calculation", fontName = "Space Grotesk Medium"), Rectangle(origin = {-1, 1}, fillColor = {14, 188, 127}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-29, 17}, {29, -17}}), Text(origin = {-20, 12}, extent = {{-10, 6}, {10, -6}}, textString = "Speed 
calculation", fontName = "Space Grotesk Medium"), Rectangle(origin = {7, -58}, fillColor = {14, 188, 127}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-88, 39}, {88, -39}}), Text(origin = {76, -34}, extent = {{-14, 10}, {14, -10}}, textString = "Torque
calculation", fontName = "Space Grotesk Medium")}));
end Final_Drive_BYD_D1;
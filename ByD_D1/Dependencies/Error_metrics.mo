within ByD_D1.Dependencies;
model Error_metrics
parameter Real delta = 0;
Modelica.Blocks.Math.Add add(k2 = -1)  annotation(
    Placement(visible = true, transformation(origin = {-72, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u_var annotation(
    Placement(visible = true, transformation(origin = {-120, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-100, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u_ref annotation(
    Placement(visible = true, transformation(origin = {-120, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-100, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Logical.GreaterEqual greaterEqual annotation(
    Placement(visible = true, transformation(origin = {-2, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.BooleanToReal booleanToReal annotation(
    Placement(visible = true, transformation(origin = {28, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Abs abs1 annotation(
    Placement(visible = true, transformation(origin = {-44, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator Int2 annotation(
    Placement(visible = true, transformation(origin = {58, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator Int3 annotation(
    Placement(visible = true, transformation(origin = {37, -17}, extent = {{-11, -11}, {11, 11}}, rotation = 0)));
  Modelica.Blocks.Math.MultiProduct MP1(nu = 3)  annotation(
    Placement(visible = true, transformation(origin = {1, -17}, extent = {{-11, -11}, {11, 11}}, rotation = 0)));
  Modelica.Blocks.Math.Division Div1 annotation(
    Placement(visible = true, transformation(origin = {80, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.ContinuousClock continuousClock(offset = 1e-15)  annotation(
    Placement(visible = true, transformation(origin = {-24, 66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Avoid_Zero_Division2 avoid_Zero_Division2 annotation(
    Placement(visible = true, transformation(origin = {66, -40}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealOutput rel_time_out_bound annotation(
    Placement(visible = true, transformation(origin = {108, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput RMSE_out_bound annotation(
    Placement(visible = true, transformation(origin = {110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Sqrt sqrt1 annotation(
    Placement(visible = true, transformation(origin = {74, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant tolerance(k = delta)  annotation(
    Placement(visible = true, transformation(origin = {-56, 4}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
equation
  connect(u_var, add.u1) annotation(
    Line(points = {{-120, 40}, {-84, 40}}, color = {0, 0, 127}));
  connect(u_ref, add.u2) annotation(
    Line(points = {{-120, -40}, {-90, -40}, {-90, 28}, {-84, 28}}, color = {0, 0, 127}));
  connect(greaterEqual.y, booleanToReal.u) annotation(
    Line(points = {{9, 34}, {16, 34}}, color = {255, 0, 255}));
  connect(add.y, abs1.u) annotation(
    Line(points = {{-60, 34}, {-56, 34}}, color = {0, 0, 127}));
  connect(abs1.y, greaterEqual.u1) annotation(
    Line(points = {{-33, 34}, {-14, 34}}, color = {0, 0, 127}));
  connect(booleanToReal.y, Int2.u) annotation(
    Line(points = {{40, 34}, {46, 34}}, color = {0, 0, 127}));
  connect(abs1.y, MP1.u[1]) annotation(
    Line(points = {{-32, 34}, {-28, 34}, {-28, -17}, {-10, -17}}, color = {0, 0, 127}));
  connect(abs1.y, MP1.u[2]) annotation(
    Line(points = {{-32, 34}, {-26, 34}, {-26, -17}, {-10, -17}}, color = {0, 0, 127}));
  connect(booleanToReal.y, MP1.u[3]) annotation(
    Line(points = {{40, 34}, {40, 16}, {-16, 16}, {-16, -17}, {-10, -17}}, color = {0, 0, 127}));
  connect(MP1.y, Int3.u) annotation(
    Line(points = {{14, -17}, {24, -17}}, color = {0, 0, 127}));
  connect(Int2.y, Div1.u1) annotation(
    Line(points = {{70, 34}, {78, 34}, {78, 56}, {52, 56}, {52, 78}, {68, 78}}, color = {0, 0, 127}));
  connect(continuousClock.y, Div1.u2) annotation(
    Line(points = {{-13, 66}, {68, 66}}, color = {0, 0, 127}));
  connect(Div1.y, rel_time_out_bound) annotation(
    Line(points = {{92, 72}, {108, 72}}, color = {0, 0, 127}));
  connect(Int3.y, avoid_Zero_Division2.u1) annotation(
    Line(points = {{50, -16}, {72, -16}, {72, -30}}, color = {0, 0, 127}));
  connect(Int2.y, avoid_Zero_Division2.u2) annotation(
    Line(points = {{70, 34}, {78, 34}, {78, -6}, {60, -6}, {60, -30}}, color = {0, 0, 127}));
  connect(avoid_Zero_Division2.y, sqrt1.u) annotation(
    Line(points = {{66, -50}, {66, -58}, {46, -58}, {46, -80}, {62, -80}}, color = {0, 0, 127}));
  connect(sqrt1.y, RMSE_out_bound) annotation(
    Line(points = {{86, -80}, {110, -80}}, color = {0, 0, 127}));
  connect(tolerance.y, greaterEqual.u2) annotation(
    Line(points = {{-50, 4}, {-20, 4}, {-20, 26}, {-14, 26}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "4.0.0")),
    Icon(graphics = {Rectangle(extent = {{-100, 100}, {100, -100}}), Text(origin = {-2, 1}, extent = {{-48, 37}, {48, -37}}, textString = "Error
metrics")}));
end Error_metrics;

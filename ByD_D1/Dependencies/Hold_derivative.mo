within ByD_D1.Dependencies;

block Hold_derivative
  parameter Modelica.Units.SI.Time sample_period_unit_delays = 0.01;
  parameter Modelica.Units.SI.Time time_dyn_trq = 0.15;
  parameter Modelica.Units.SI.Frequency freq = 6.28/time_dyn_trq;
  Modelica.Blocks.Interfaces.RealInput u annotation(
    Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y annotation(
    Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.LessEqualThreshold LET1(threshold = 10)  annotation(
    Placement(visible = true, transformation(origin = {-44, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.GreaterEqualThreshold GET1(threshold = -10)  annotation(
    Placement(visible = true, transformation(origin = {-44, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.Switch SW1 annotation(
    Placement(visible = true, transformation(origin = {26, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Discrete.UnitDelay Delay1 annotation(
    Placement(visible = true, transformation(origin = {26, -32}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.And And1 annotation(
    Placement(visible = true, transformation(origin = {-12, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Der der1 annotation(
    Placement(visible = true, transformation(origin = {-86, -1.33227e-15}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
equation
  connect(SW1.y, y) annotation(
    Line(points = {{38, 0}, {110, 0}}, color = {0, 0, 127}));
  connect(SW1.y, Delay1.u) annotation(
    Line(points = {{38, 0}, {56, 0}, {56, -32}, {38, -32}}, color = {0, 0, 127}));
  connect(Delay1.y, SW1.u3) annotation(
    Line(points = {{15, -32}, {0, -32}, {0, -8}, {14, -8}}, color = {0, 0, 127}));
  connect(LET1.y, And1.u1) annotation(
    Line(points = {{-32, 0}, {-24, 0}}, color = {255, 0, 255}));
  connect(GET1.y, And1.u2) annotation(
    Line(points = {{-32, -30}, {-30, -30}, {-30, -8}, {-24, -8}}, color = {255, 0, 255}));
  connect(And1.y, SW1.u2) annotation(
    Line(points = {{0, 0}, {14, 0}}, color = {255, 0, 255}));
  connect(u, der1.u) annotation(
    Line(points = {{-120, 0}, {-96, 0}}, color = {0, 0, 127}));
  connect(der1.y, LET1.u) annotation(
    Line(points = {{-78, 0}, {-56, 0}}, color = {0, 0, 127}));
  connect(der1.y, GET1.u) annotation(
    Line(points = {{-78, 0}, {-66, 0}, {-66, -30}, {-56, -30}}, color = {0, 0, 127}));
  connect(der1.y, SW1.u1) annotation(
    Line(points = {{-78, 0}, {-62, 0}, {-62, 20}, {4, 20}, {4, 8}, {14, 8}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "4.0.0")),
    Icon(graphics = {Rectangle(extent = {{-100, 100}, {100, -100}}), Text(origin = {2, 5}, extent = {{-72, 59}, {72, -59}}, textString = "Hold
Derivative")}));
end Hold_derivative;

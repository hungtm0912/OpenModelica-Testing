within ByD_D1.VPC;

model VPC_merge

  parameter Modelica.Units.SI.Torque trq_dmd_sw_on=-5;
  parameter Modelica.Units.SI.Torque trq_dmd_sw_off=-7;
  parameter Modelica.Units.SI.Time Blend_up_duration = 0.3;
  parameter Modelica.Units.SI.Time Blend_down_duration = 0.1;
  parameter Modelica.Units.SI.Time sample_period_unit_delays = 0.05;

  Modelica.Blocks.Interfaces.RealInput drv_trq_dmd annotation(
    Placement(visible = true, transformation(origin = {-220, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-220, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput mot_brk_dmd annotation(
    Placement(visible = true, transformation(origin = {-220, 180}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-220, -160}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput mot_prop_dmd annotation(
    Placement(visible = true, transformation(origin = {-220, -180}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-220, 160}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Logical.Hysteresis Hyst1(uHigh = trq_dmd_sw_on, uLow = trq_dmd_sw_off)  annotation(
    Placement(visible = true, transformation(origin = {-174, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.BooleanToReal BTR1(realFalse = 0, realTrue = 1)  annotation(
    Placement(visible = true, transformation(origin = {-142, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.Greater G1 annotation(
    Placement(visible = true, transformation(origin = {-62, 106}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.Switch SW1 annotation(
    Placement(visible = true, transformation(origin = {-12, 106}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.Switch SW2 annotation(
    Placement(visible = true, transformation(origin = {44, 62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.Greater G2 annotation(
    Placement(visible = true, transformation(origin = {-62, -86}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.Switch SW3 annotation(
    Placement(visible = true, transformation(origin = {-12, -66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.Switch SW4 annotation(
    Placement(visible = true, transformation(origin = {44, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ByD_D1.Dependencies.blending_inside_merge BM1 annotation(
    Placement(visible = true, transformation(origin = {128, 0}, extent = {{-34, -34}, {34, 34}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput mot_trq_dmd_switch annotation(
    Placement(visible = true, transformation(origin = {210, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {210, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.TriggeredTrapezoid TrigTrap(amplitude = 1, falling = Blend_down_duration, rising = Blend_up_duration)  annotation(
    Placement(visible = true, transformation(origin = {-76, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Discrete.UnitDelay Delay1 annotation(
    Placement(visible = true, transformation(origin = {-96, 86}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Discrete.UnitDelay Delay2 annotation(
    Placement(visible = true, transformation(origin = {-14, 76}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Discrete.UnitDelay Delay3 annotation(
    Placement(visible = true, transformation(origin = {-98, -86}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Discrete.UnitDelay Delay4 annotation(
    Placement(visible = true, transformation(origin = {-12, -102}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Discrete.UnitDelay Delay5 annotation(
    Placement(visible = true, transformation(origin = {-40, -146}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation
  connect(Hyst1.y, BTR1.u) annotation(
    Line(points = {{-163, 0}, {-155, 0}}, color = {255, 0, 255}));
  connect(drv_trq_dmd, Hyst1.u) annotation(
    Line(points = {{-220, 0}, {-186, 0}}, color = {0, 0, 127}));
  connect(BTR1.y, G1.u1) annotation(
    Line(points = {{-130, 0}, {-120, 0}, {-120, 106}, {-74, 106}}, color = {0, 0, 127}));
  connect(G1.y, SW1.u2) annotation(
    Line(points = {{-50, 106}, {-24, 106}}, color = {255, 0, 255}));
  connect(mot_brk_dmd, SW1.u1) annotation(
    Line(points = {{-220, 180}, {-42, 180}, {-42, 114}, {-24, 114}}, color = {0, 0, 127}));
  connect(Hyst1.y, SW2.u2) annotation(
    Line(points = {{-162, 0}, {-158, 0}, {-158, 62}, {32, 62}}, color = {255, 0, 255}));
  connect(SW1.y, SW2.u1) annotation(
    Line(points = {{-1, 106}, {18, 106}, {18, 70}, {32, 70}}, color = {0, 0, 127}));
  connect(SW2.u3, mot_brk_dmd) annotation(
    Line(points = {{32, 54}, {12, 54}, {12, 180}, {-220, 180}}, color = {0, 0, 127}));
  connect(BTR1.y, G2.u2) annotation(
    Line(points = {{-130, 0}, {-120, 0}, {-120, -104}, {-82, -104}, {-82, -94}, {-74, -94}}, color = {0, 0, 127}));
  connect(G2.y, SW3.u2) annotation(
    Line(points = {{-50, -86}, {-46, -86}, {-46, -66}, {-24, -66}}, color = {255, 0, 255}));
  connect(SW3.y, SW4.u3) annotation(
    Line(points = {{0, -66}, {12, -66}, {12, -54}, {32, -54}}, color = {0, 0, 127}));
  connect(mot_prop_dmd, SW4.u1) annotation(
    Line(points = {{-220, -180}, {20, -180}, {20, -38}, {32, -38}}, color = {0, 0, 127}));
  connect(Hyst1.y, SW4.u2) annotation(
    Line(points = {{-162, 0}, {-158, 0}, {-158, -46}, {32, -46}}, color = {255, 0, 255}));
  connect(SW4.y, BM1.u1) annotation(
    Line(points = {{56, -46}, {62, -46}, {62, 28}, {88, 28}}, color = {0, 0, 127}));
  connect(SW2.y, BM1.u3) annotation(
    Line(points = {{56, 62}, {72, 62}, {72, -28}, {88, -28}}, color = {0, 0, 127}));
  connect(BM1.y, mot_trq_dmd_switch) annotation(
    Line(points = {{166, 0}, {210, 0}}, color = {0, 0, 127}));
  connect(Hyst1.y, TrigTrap.u) annotation(
    Line(points = {{-162, 0}, {-158, 0}, {-158, 24}, {-104, 24}, {-104, 0}, {-88, 0}}, color = {255, 0, 255}));
  connect(TrigTrap.y, BM1.u2) annotation(
    Line(points = {{-64, 0}, {88, 0}}, color = {0, 0, 127}));
  connect(BTR1.y, Delay1.u) annotation(
    Line(points = {{-130, 0}, {-120, 0}, {-120, 86}, {-108, 86}}, color = {0, 0, 127}));
  connect(Delay1.y, G1.u2) annotation(
    Line(points = {{-84, 86}, {-82, 86}, {-82, 98}, {-74, 98}}, color = {0, 0, 127}));
  connect(SW1.y, Delay2.u) annotation(
    Line(points = {{0, 106}, {8, 106}, {8, 76}, {-2, 76}}, color = {0, 0, 127}));
  connect(Delay2.y, SW1.u3) annotation(
    Line(points = {{-24, 76}, {-36, 76}, {-36, 98}, {-24, 98}}, color = {0, 0, 127}));
  connect(BTR1.y, Delay3.u) annotation(
    Line(points = {{-130, 0}, {-118, 0}, {-118, -86}, {-110, -86}}, color = {0, 0, 127}));
  connect(Delay3.y, G2.u1) annotation(
    Line(points = {{-86, -86}, {-74, -86}}, color = {0, 0, 127}));
  connect(SW3.y, Delay4.u) annotation(
    Line(points = {{0, -66}, {14, -66}, {14, -102}, {0, -102}}, color = {0, 0, 127}));
  connect(Delay4.y, SW3.u3) annotation(
    Line(points = {{-22, -102}, {-36, -102}, {-36, -74}, {-24, -74}}, color = {0, 0, 127}));
  connect(mot_prop_dmd, Delay5.u) annotation(
    Line(points = {{-220, -180}, {-40, -180}, {-40, -158}}, color = {0, 0, 127}));
  connect(Delay5.y, SW3.u1) annotation(
    Line(points = {{-40, -134}, {-40, -58}, {-24, -58}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "4.0.0")),
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}})),
    Icon(coordinateSystem(extent = {{-200, -200}, {200, 200}}), graphics = {Rectangle(extent = {{-200, 200}, {200, -200}}), Text(origin = {13884, 11700}, extent = {{-156, 156}, {90, -74}}, textString = "VPC
merge"), Text(origin = {-6, 16}, extent = {{-166, 134}, {166, -134}}, textString = "VPC
merge")}),
    version = "");
end VPC_merge;

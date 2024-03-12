within ByD_D1.ESS;

model batteryModel1

  parameter Real C_fab(unit = "Ah") = 135;
  parameter Real SoH = 100;
  parameter Real init_SoC = 100;
  parameter Integer nSeries = 124;
  parameter String OCV_filename = "OCV.txt";
  parameter String R0_filename = "R0.txt";
  parameter String R1_filename = "R1.txt";
  parameter String C1_filename = "C1.txt";
  Modelica.Electrical.Analog.Sources.SignalVoltage OCV annotation(
    Placement(visible = true, transformation(origin = {86, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Tables.CombiTable1Ds OCV_Table(fileName = OCV_filename, tableName = "OCV", tableOnFile = true, verboseRead = false) annotation(
    Placement(visible = true, transformation(origin = {42, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator SoC_Calculator(initType = Modelica.Blocks.Types.Init.InitialOutput, k = -100/(C_fab*3600*SoH/100), y(fixed = true), y_start = init_SoC) annotation(
    Placement(visible = true, transformation(origin = {-16, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sensors.CurrentSensor CS1 annotation(
    Placement(visible = true, transformation(origin = {-68, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Math.Gain OCV_nS(k = nSeries) annotation(
    Placement(visible = true, transformation(origin = {72, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Tables.CombiTable1Ds R0_Table(fileName = R0_filename, tableName = "R0", tableOnFile = true) annotation(
    Placement(visible = true, transformation(origin = {46, -36}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Tables.CombiTable1Ds R1_Table(fileName = R1_filename, tableName = "R1", tableOnFile = true) annotation(
    Placement(visible = true, transformation(origin = {46, -60}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Tables.CombiTable1Ds C1_Table(fileName = C1_filename, tableName = "C1", tableOnFile = true) annotation(
    Placement(visible = true, transformation(origin = {46, -84}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain R0_nS(k = nSeries) annotation(
    Placement(visible = true, transformation(origin = {18, -36}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain R1_nS(k = nSeries) annotation(
    Placement(visible = true, transformation(origin = {12, -60}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain C1_nS(k = 1/nSeries) annotation(
    Placement(visible = true, transformation(origin = {4, -84}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.VariableResistor R0 annotation(
    Placement(visible = true, transformation(origin = {-6, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Electrical.Analog.Basic.VariableResistor R1 annotation(
    Placement(visible = true, transformation(origin = {-32, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Electrical.Analog.Basic.VariableCapacitor C1 annotation(
    Placement(visible = true, transformation(origin = {-58, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Electrical.Analog.Interfaces.PositivePin p annotation(
    Placement(visible = true, transformation(origin = {-68, 96}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-102, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.NegativePin n annotation(
    Placement(visible = true, transformation(origin = {96, 96}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(CS1.i, SoC_Calculator.u) annotation(
    Line(points = {{-57, 16}, {-57, 35}, {-28, 35}}, color = {0, 0, 127}));
  connect(OCV_Table.y[1], OCV_nS.u) annotation(
    Line(points = {{54, 36}, {60, 36}}, color = {0, 0, 127}));
  connect(OCV_nS.y, OCV.v) annotation(
    Line(points = {{84, 36}, {86, 36}, {86, 8}}, color = {0, 0, 127}));
  connect(R0_Table.y[1], R0_nS.u) annotation(
    Line(points = {{36, -36}, {30, -36}}, color = {0, 0, 127}));
  connect(R1_Table.y[1], R1_nS.u) annotation(
    Line(points = {{36, -60}, {24, -60}}, color = {0, 0, 127}));
  connect(C1_Table.y[1], C1_nS.u) annotation(
    Line(points = {{36, -84}, {16, -84}}, color = {0, 0, 127}));
  connect(OCV.p, R0.p) annotation(
    Line(points = {{76, -4}, {4, -4}}, color = {0, 0, 255}));
  connect(R0.n, C1.p) annotation(
    Line(points = {{-16, -4}, {-48, -4}}, color = {0, 0, 255}));
  connect(R1.n, C1.n) annotation(
    Line(points = {{-42, -16}, {-68, -16}, {-68, -4}}, color = {0, 0, 255}));
  connect(R0_nS.y, R0.R) annotation(
    Line(points = {{8, -36}, {-6, -36}, {-6, -16}}, color = {0, 0, 127}));
  connect(R1_nS.y, R1.R) annotation(
    Line(points = {{2, -60}, {-32, -60}, {-32, -28}}, color = {0, 0, 127}));
  connect(C1_nS.y, C1.C) annotation(
    Line(points = {{-6, -84}, {-58, -84}, {-58, -16}}, color = {0, 0, 127}));
  connect(R1.p, R0.n) annotation(
    Line(points = {{-22, -16}, {-16, -16}, {-16, -4}}, color = {0, 0, 255}));
  connect(C1.n, CS1.p) annotation(
    Line(points = {{-68, -4}, {-68, 6}}, color = {0, 0, 255}));
  connect(CS1.n, p) annotation(
    Line(points = {{-68, 26}, {-68, 96}}, color = {0, 0, 255}));
  connect(OCV.n, n) annotation(
    Line(points = {{96, -4}, {96, 96}}, color = {0, 0, 255}));
  connect(SoC_Calculator.y, OCV_Table.u) annotation(
    Line(points = {{-4, 36}, {30, 36}}, color = {0, 0, 127}));
  connect(SoC_Calculator.y, R0_Table.u) annotation(
    Line(points = {{-4, 36}, {18, 36}, {18, 2}, {70, 2}, {70, -36}, {58, -36}}, color = {0, 0, 127}));
  connect(SoC_Calculator.y, R1_Table.u) annotation(
    Line(points = {{-4, 36}, {18, 36}, {18, 2}, {70, 2}, {70, -60}, {58, -60}}, color = {0, 0, 127}));
  connect(SoC_Calculator.y, C1_Table.u) annotation(
    Line(points = {{-4, 36}, {18, 36}, {18, 2}, {70, 2}, {70, -84}, {58, -84}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "4.0.0")),
    Icon(graphics = {Text(origin = {0, 4}, extent = {{72, -42}, {-72, 42}}, textString = "Battery Model 1
OCV map
RRC maps"), Rectangle(extent = {{-100, 100}, {100, -100}})}));
end batteryModel1;

within ByD_D1.ESS;

model ESS_Control_PI
parameter String ctrlmapsfilename = "ess_control_maps.mat";
parameter Real nSeries = 124;
  Modelica.Blocks.Interfaces.RealInput voltage(unit = "V") annotation(
    Placement(visible = true, transformation(origin = {-112, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-103, 60}, extent = {{-11, -11}, {11, 11}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput current(unit = "A") annotation(
    Placement(visible = true, transformation(origin = {-112, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-101, -60}, extent = {{-11, -11}, {11, 11}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput SoC annotation(
    Placement(visible = true, transformation(origin = {-112, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-101, 0}, extent = {{-11, -11}, {11, 11}}, rotation = 0)));
  ByD_D1.ESS.ESS_Control_PI_charge eSS_Control_PI_charge(burst_max_curr_map = "Chg_burst_curr",burst_max_curr_map_file = ctrlmapsfilename, burst_max_power_map = "Chg_burst_pwr", burst_max_power_map_file = ctrlmapsfilename, continuous_max_curr_map = "Chg_cont_curr", continuous_max_curr_map_file = ctrlmapsfilename, continuous_max_power_map = "Chg_cont_pwr", continuous_max_power_map_file = ctrlmapsfilename)  annotation(
    Placement(visible = true, transformation(origin = {-2, 40}, extent = {{-30, -30}, {30, 30}}, rotation = 0)));
  ESS_Control_PI_discharge eSS_Control_PI_discharge(burst_max_curr_map = "Dis_burst_curr",burst_max_curr_map_file = ctrlmapsfilename, burst_max_power_map = "Dis_burst_pwr", burst_max_power_map_file = ctrlmapsfilename, continuous_max_curr_map = "Dis_cont_curr", continuous_max_curr_map_file = ctrlmapsfilename, continuous_max_power_map = "Dis_cont_pwr", continuous_max_power_map_file = ctrlmapsfilename)  annotation(
    Placement(visible = true, transformation(origin = {-2, -38}, extent = {{-30, -30}, {30, 30}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput power_max_reg(unit = "W") annotation(
    Placement(visible = true, transformation(origin = {109, 61}, extent = {{-13, -13}, {13, 13}}, rotation = 0), iconTransformation(origin = {104, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput current_max_reg(unit = "A") annotation(
    Placement(visible = true, transformation(origin = {111, 29}, extent = {{-13, -13}, {13, 13}}, rotation = 0), iconTransformation(origin = {104, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput power_max_pro(unit = "W") annotation(
    Placement(visible = true, transformation(origin = {111, -31}, extent = {{-13, -13}, {13, 13}}, rotation = 0), iconTransformation(origin = {104, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput current_max_pro(unit = "A") annotation(
    Placement(visible = true, transformation(origin = {111, -65}, extent = {{-13, -13}, {13, 13}}, rotation = 0), iconTransformation(origin = {104, -58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(voltage, eSS_Control_PI_charge.Voltage) annotation(
    Line(points = {{-112, 60}, {-72.5, 60}, {-72.5, 58}, {-33, 58}}, color = {0, 0, 127}));
  connect(voltage, eSS_Control_PI_discharge.Voltage) annotation(
    Line(points = {{-112, 60}, {-78, 60}, {-78, -20}, {-33, -20}}, color = {0, 0, 127}));
  connect(current, eSS_Control_PI_charge.SoC) annotation(
    Line(points = {{-112, 0}, {-86, 0}, {-86, 40}, {-32, 40}}, color = {0, 0, 127}));
  connect(current, eSS_Control_PI_discharge.SoC) annotation(
    Line(points = {{-112, 0}, {-86, 0}, {-86, -38}, {-32, -38}}, color = {0, 0, 127}));
  connect(SoC, eSS_Control_PI_charge.Current) annotation(
    Line(points = {{-112, -60}, {-68, -60}, {-68, 22}, {-32, 22}}, color = {0, 0, 127}));
  connect(SoC, eSS_Control_PI_discharge.Current) annotation(
    Line(points = {{-112, -60}, {-68, -60}, {-68, -56}, {-32, -56}}, color = {0, 0, 127}));
  connect(eSS_Control_PI_charge.Current_Max_Charge, current_max_reg) annotation(
    Line(points = {{29, 28}, {68, 28}, {68, 29}, {111, 29}}, color = {0, 0, 127}));
  connect(eSS_Control_PI_discharge.Current_Max_Discharge, current_max_pro) annotation(
    Line(points = {{29, -50}, {60, -50}, {60, -65}, {111, -65}}, color = {0, 0, 127}));
  connect(eSS_Control_PI_charge.Power_Max_Charge, power_max_reg) annotation(
    Line(points = {{28, 52}, {72, 52}, {72, 64}, {110, 64}, {110, 62}}, color = {0, 0, 127}));
  connect(eSS_Control_PI_discharge.Power_Max_Discharge, power_max_pro) annotation(
    Line(points = {{28, -26}, {112, -26}, {112, -30}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "4.0.0")),
  Icon(graphics = {Rectangle( fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 75}, {100, -75}}), Text(origin = {0, -1}, extent = {{-52, 45}, {52, -45}}, textString = "ESS
Control", textStyle = {TextStyle.Bold})}, coordinateSystem(extent = {{-100, -75}, {100, 75}})),
  Diagram(coordinateSystem(extent = {{-100, -75}, {100, 75}})));
end ESS_Control_PI;

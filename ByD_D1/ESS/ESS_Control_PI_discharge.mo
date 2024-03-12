within ByD_D1.ESS;

model ESS_Control_PI_discharge
parameter Integer num_module_parallel = 1;
parameter Integer num_module_series = 1;
parameter Integer num_cells_per_module = 124;
parameter Integer num_cells_total = num_cells_per_module*num_module_series*num_module_parallel;
parameter Real Ki_Current = 0.2985;
parameter Real Lower_limit_Current = -8.9552;
parameter Real Upper_limit_Current = 1;
parameter Real Lower_limit_Power = -11.2941;
parameter Real Upper_limit_Power = 1;
parameter Real Ki_Power = 0.3765;
parameter String continuous_max_power_map_file = "filename";
parameter String continuous_max_curr_map_file = "filename";
parameter String burst_max_power_map_file = "filename";
parameter String burst_max_curr_map_file = "filename";
parameter String continuous_max_power_map = "mapname";
parameter String continuous_max_curr_map = "mapname";
parameter String burst_max_power_map = "mapname";
parameter String burst_max_curr_map = "mapname";
constant  Real inf = ModelicaServices.Machine.inf;
  Modelica.Blocks.Interfaces.RealInput Voltage(unit = "V") annotation(
    Placement(visible = true, transformation(origin = {-112, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-103, 60}, extent = {{-11, -11}, {11, 11}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Current(unit = "A") annotation(
    Placement(visible = true, transformation(origin = {-112, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-101, -60}, extent = {{-11, -11}, {11, 11}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput SoC annotation(
    Placement(visible = true, transformation(origin = {-112, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-101, 0}, extent = {{-11, -11}, {11, 11}}, rotation = 0)));
  Modelica.Blocks.Math.Product Power annotation(
    Placement(visible = true, transformation(origin = {-70, 76}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax = inf, uMin = 0)  annotation(
    Placement(visible = true, transformation(origin = {-52, 76}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax = inf, uMin = 0) annotation(
    Placement(visible = true, transformation(origin = {-70, -12}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Gain Ncells(k = num_cells_total)  annotation(
    Placement(visible = true, transformation(origin = {-43, 25}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain Ncells2(k = num_cells_total)  annotation(
    Placement(visible = true, transformation(origin = {-43, 45}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain Nparallel(k = 1/num_module_parallel)  annotation(
    Placement(visible = true, transformation(origin = {-47, -87}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Tables.CombiTable1Ds max_pwr_cont(columns = 1:2, fileName = continuous_max_power_map_file, tableName = continuous_max_power_map, tableOnFile = true)  annotation(
    Placement(visible = true, transformation(origin = {-63, 45}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Blocks.Tables.CombiTable1Ds max_pwr_burst(columns = 1:2, fileName = burst_max_power_map_file, tableName = burst_max_power_map, tableOnFile = true) annotation(
    Placement(visible = true, transformation(origin = {-63, 25}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Blocks.Tables.CombiTable1Ds max_curr_cont(columns = 1:2, fileName = continuous_max_curr_map_file, tableName = continuous_max_curr_map, tableOnFile = true) annotation(
    Placement(visible = true, transformation(origin = {-69, -45}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Blocks.Tables.CombiTable1Ds max_curr_burst(columns = 1:2, fileName = burst_max_curr_map_file, tableName = burst_max_curr_map, tableOnFile = true) annotation(
    Placement(visible = true, transformation(origin = {-69, -87}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Blocks.Math.Add delta(k2 = -1)  annotation(
    Placement(visible = true, transformation(origin = {-26, -16}, extent = {{-6, 6}, {6, -6}}, rotation = 0)));
  ByD_D1.Dependencies.Avoid_Zero_Division2 avoid_Zero_Division2 annotation(
    Placement(visible = true, transformation(origin = {-7, -39}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Blocks.Math.Add delta1(k2 = -1) annotation(
    Placement(visible = true, transformation(origin = {-26, 64}, extent = {{-6, 6}, {6, -6}}, rotation = 0)));
  ByD_D1.Dependencies.Avoid_Zero_Division2 avoid_Zero_Division21 annotation(
    Placement(visible = true, transformation(origin = {-7, 51}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Power_Max_Discharge(unit = "W") annotation(
    Placement(visible = true, transformation(origin = {106, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Current_Max_Discharge(unit = "A") annotation(
    Placement(visible = true, transformation(origin = {106, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.LimIntegrator limIntegrator(k = Ki_Power, outMax = Upper_limit_Power, outMin = Lower_limit_Power, y_start = Upper_limit_Power) annotation(
    Placement(visible = true, transformation(origin = {18, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.LimIntegrator limIntegrator1(k = Ki_Current, outMax = Upper_limit_Current, outMin = Lower_limit_Current, y_start = Upper_limit_Current) annotation(
    Placement(visible = true, transformation(origin = {18, -39}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter2(uMax = 1, uMin = 0) annotation(
    Placement(visible = true, transformation(origin = {44, 50}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter21(uMax = 1, uMin = 0) annotation(
    Placement(visible = true, transformation(origin = {42, -38}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Product product annotation(
    Placement(visible = true, transformation(origin = {61, 41}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Product product1 annotation(
    Placement(visible = true, transformation(origin = {59, -49}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add diff(k2 = -1) annotation(
    Placement(visible = true, transformation(origin = {61, 69}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant one(k = 1)  annotation(
    Placement(visible = true, transformation(origin = {43, 77}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Product product2 annotation(
    Placement(visible = true, transformation(origin = {78, 24}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  Modelica.Blocks.Math.Add add annotation(
    Placement(visible = true, transformation(origin = {84, 40}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1 annotation(
    Placement(visible = true, transformation(origin = {88, -40}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  Modelica.Blocks.Math.Add diff1(k2 = -1) annotation(
    Placement(visible = true, transformation(origin = {59, -19}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant one2(k = 1) annotation(
    Placement(visible = true, transformation(origin = {43, -9}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Product product21 annotation(
    Placement(visible = true, transformation(origin = {74, -62}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  Modelica.Blocks.Math.Gain Nparallel2(k = 1/num_module_parallel) annotation(
    Placement(visible = true, transformation(origin = {-47, -45}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
equation
  connect(Voltage, Power.u1) annotation(
    Line(points = {{-112, 60}, {-84, 60}, {-84, 80}, {-77, 80}}, color = {0, 0, 127}));
  connect(Current, Power.u2) annotation(
    Line(points = {{-112, 0}, {-82, 0}, {-82, 72}, {-77, 72}}, color = {0, 0, 127}));
  connect(Power.y, limiter.u) annotation(
    Line(points = {{-63, 76}, {-59, 76}}, color = {0, 0, 127}));
  connect(Current, limiter1.u) annotation(
    Line(points = {{-112, 0}, {-83.5, 0}, {-83.5, -12}, {-77, -12}}, color = {0, 0, 127}));
  connect(max_pwr_cont.y[2], Ncells2.u) annotation(
    Line(points = {{-55.3, 45}, {-49.3, 45}}, color = {0, 0, 127}));
  connect(SoC, max_curr_burst.u) annotation(
    Line(points = {{-112, -60}, {-84, -60}, {-84, -87}, {-77, -87}}, color = {0, 0, 127}));
  connect(SoC, max_curr_cont.u) annotation(
    Line(points = {{-112, -60}, {-84, -60}, {-84, -45}, {-77, -45}}, color = {0, 0, 127}));
  connect(max_pwr_burst.y[2], Ncells.u) annotation(
    Line(points = {{-55.3, 25}, {-47.3, 25}}, color = {0, 0, 127}));
  connect(max_curr_burst.y[2], Nparallel.u) annotation(
    Line(points = {{-62, -86}, {-52, -86}}, color = {0, 0, 127}));
  connect(limiter1.y, delta.u2) annotation(
    Line(points = {{-64, -12}, {-34, -12}}, color = {0, 0, 127}));
  connect(delta.y, avoid_Zero_Division2.u1) annotation(
    Line(points = {{-20, -16}, {-18, -16}, {-18, -35}, {-14, -35}}, color = {0, 0, 127}));
  connect(limiter.y, delta1.u2) annotation(
    Line(points = {{-46, 76}, {-36, 76}, {-36, 68}, {-33, 68}}, color = {0, 0, 127}));
  connect(Ncells2.y, delta1.u1) annotation(
    Line(points = {{-37.5, 45}, {-36, 45}, {-36, 60}, {-33, 60}}, color = {0, 0, 127}));
  connect(delta1.y, avoid_Zero_Division21.u1) annotation(
    Line(points = {{-20, 64}, {-18, 64}, {-18, 55}, {-14, 55}}, color = {0, 0, 127}));
  connect(Ncells2.y, avoid_Zero_Division21.u2) annotation(
    Line(points = {{-38, 46}, {-14, 46}}, color = {0, 0, 127}));
  connect(SoC, max_pwr_cont.u) annotation(
    Line(points = {{-112, -60}, {-90, -60}, {-90, 46}, {-72, 46}}, color = {0, 0, 127}));
  connect(SoC, max_pwr_burst.u) annotation(
    Line(points = {{-112, -60}, {-86, -60}, {-86, 26}, {-72, 26}}, color = {0, 0, 127}));
  connect(avoid_Zero_Division21.y, limIntegrator.u) annotation(
    Line(points = {{0, 51}, {6, 51}, {6, 50}}, color = {0, 0, 127}));
  connect(avoid_Zero_Division2.y, limIntegrator1.u) annotation(
    Line(points = {{0, -39}, {6, -39}}, color = {0, 0, 127}));
  connect(limIntegrator.y, limiter2.u) annotation(
    Line(points = {{29, 50}, {37, 50}}, color = {0, 0, 127}));
  connect(limIntegrator1.y, limiter21.u) annotation(
    Line(points = {{29, -39}, {39.5, -39}, {39.5, -38}, {35, -38}}, color = {0, 0, 127}));
  connect(limiter2.y, product.u1) annotation(
    Line(points = {{50, 50}, {52, 50}, {52, 44}, {55, 44}}, color = {0, 0, 127}));
  connect(Ncells.y, product.u2) annotation(
    Line(points = {{-38, 26}, {52, 26}, {52, 38}, {55, 38}}, color = {0, 0, 127}));
  connect(limiter21.y, product1.u1) annotation(
    Line(points = {{48, -38}, {50, -38}, {50, -46}, {54, -46}}, color = {0, 0, 127}));
  connect(Nparallel.y, product1.u2) annotation(
    Line(points = {{-42, -86}, {50, -86}, {50, -52}, {54, -52}}, color = {0, 0, 127}));
  connect(one.y, diff.u1) annotation(
    Line(points = {{48, 78}, {52, 78}, {52, 72}, {55, 72}}, color = {0, 0, 127}));
  connect(limiter2.y, diff.u2) annotation(
    Line(points = {{50, 50}, {52, 50}, {52, 66}, {55, 66}}, color = {0, 0, 127}));
  connect(add.y, Power_Max_Discharge) annotation(
    Line(points = {{88, 40}, {106, 40}}, color = {0, 0, 127}));
  connect(add1.y, Current_Max_Discharge) annotation(
    Line(points = {{92, -40}, {106, -40}}, color = {0, 0, 127}));
  connect(Ncells2.y, product2.u2) annotation(
    Line(points = {{-38, 46}, {-24, 46}, {-24, 22}, {73, 22}}, color = {0, 0, 127}));
  connect(diff.y, product2.u1) annotation(
    Line(points = {{66, 70}, {70, 70}, {70, 26}, {74, 26}}, color = {0, 0, 127}));
  connect(product.y, add.u1) annotation(
    Line(points = {{66, 42}, {80, 42}}, color = {0, 0, 127}));
  connect(product2.y, add.u2) annotation(
    Line(points = {{82, 24}, {88, 24}, {88, 34}, {74, 34}, {74, 38}, {80, 38}}, color = {0, 0, 127}));
  connect(one2.y, diff1.u1) annotation(
    Line(points = {{48, -8}, {50, -8}, {50, -16}, {53, -16}}, color = {0, 0, 127}));
  connect(limiter21.y, diff1.u2) annotation(
    Line(points = {{48, -38}, {50, -38}, {50, -22}, {53, -22}}, color = {0, 0, 127}));
  connect(diff1.y, product21.u1) annotation(
    Line(points = {{64, -18}, {66, -18}, {66, -60}, {70, -60}}, color = {0, 0, 127}));
  connect(product1.y, add1.u1) annotation(
    Line(points = {{64, -48}, {72, -48}, {72, -38}, {84, -38}}, color = {0, 0, 127}));
  connect(product21.y, add1.u2) annotation(
    Line(points = {{78, -62}, {84, -62}, {84, -52}, {76, -52}, {76, -42}, {84, -42}}, color = {0, 0, 127}));
  connect(Nparallel2.y, product21.u2) annotation(
    Line(points = {{-42, -44}, {-38, -44}, {-38, -64}, {70, -64}}, color = {0, 0, 127}));
  connect(Nparallel2.y, avoid_Zero_Division2.u2) annotation(
    Line(points = {{-42, -44}, {-14, -44}}, color = {0, 0, 127}));
  connect(Nparallel2.y, delta.u1) annotation(
    Line(points = {{-42, -44}, {-38, -44}, {-38, -20}, {-33, -20}}, color = {0, 0, 127}));
  connect(max_curr_cont.y[2], Nparallel2.u) annotation(
    Line(points = {{-61, -45}, {-53, -45}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "4.0.0")));
end ESS_Control_PI_discharge;

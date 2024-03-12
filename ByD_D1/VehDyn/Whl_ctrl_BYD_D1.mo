within ByD_D1.VehDyn;

model Whl_ctrl_BYD_D1

parameter String whl_ctrl_maps_fname = "whl_ctrl_maps.mat";
parameter Modelica.Units.SI.Torque lower_torque_limit = -ModelicaServices.Machine.inf;
parameter Modelica.Units.SI.Length whl_plant_init_radius = 0.3040;
parameter Modelica.Units.SI.Mass veh_plant_init_mass_total = 1617.5;
parameter Real whl_ctrl_init_brake_fraction = 1;
parameter Modelica.Units.SI.Torque whl_plant_init_trq_brake_max = 2000;
parameter Modelica.Units.SI.Inertia wheel_inertia = 1.8 "Rotational inertia of each wheel";
parameter Real TC_Ratio = 2.5 "Torque converter gear ratio";
parameter Real FD_Ratio = 4.3 "Final drive gear ratio";
parameter Modelica.Units.SI.Inertia TC_inertia = 0 "Torque converter rotational inertia";
parameter Modelica.Units.SI.Inertia FD_inertia = 0 "Final drive rotational inertia";
parameter Modelica.Units.SI.Inertia mot_inertia = 0.02 "Rotor´s rotational inertia";
parameter Modelica.Units.SI.Mass dynamic_mass = veh_plant_init_mass_total + (mot_inertia*(TC_Ratio*FD_Ratio)^2 + (FD_Ratio^2)*TC_inertia + FD_inertia + wheel_inertia)/(whl_plant_init_radius^2);

  Modelica.Blocks.Interfaces.RealInput drv_brk_dmd_simu annotation(
    Placement(visible = true, transformation(origin = {-106, -74}, extent = {{-18, -18}, {18, 18}}, rotation = 0), iconTransformation(origin = {-96, -62}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput vpc_brk_trq_dmd_simu annotation(
    Placement(visible = true, transformation(origin = {-104, 62}, extent = {{-18, -18}, {18, 18}}, rotation = 0), iconTransformation(origin = {-96, 62}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput whl_ctrl_brk_cmd_simu annotation(
    Placement(visible = true, transformation(origin = {113, 17}, extent = {{-17, -17}, {17, 17}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
  Modelica.Blocks.Math.Add add annotation(
    Placement(visible = true, transformation(origin = {42, 74}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Gain brake_fraction(k = whl_ctrl_init_brake_fraction)  annotation(
    Placement(visible = true, transformation(origin = {64, 74}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Gain inv_trq_brake_max(k = 1/whl_plant_init_trq_brake_max)  annotation(
    Placement(visible = true, transformation(origin = {76, 46}, extent = {{-6, -6}, {6, 6}}, rotation = -90)));
  Modelica.Blocks.Math.Abs abs1 annotation(
    Placement(visible = true, transformation(origin = {83, 17}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1(k2 = -1)  annotation(
    Placement(visible = true, transformation(origin = {10, 52}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter negative(homotopyType = Modelica.Blocks.Types.LimiterHomotopy.UpperLimit, strict = false, uMax = 0, uMin = -whl_plant_init_trq_brake_max)  annotation(
    Placement(visible = true, transformation(origin = {-24, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Tables.CombiTable1Ds ped_pos_to_brk_trq(columns = 1:2, fileName = whl_ctrl_maps_fname, tableName = "vpc_brake_init_brk_trq_map", tableOnFile = true)  annotation(
    Placement(visible = true, transformation(origin = {-57, -75}, extent = {{-21, -21}, {21, 21}}, rotation = 0)));
  Modelica.Blocks.Math.MultiProduct multiProduct(nu = 3, significantDigits = 8)  annotation(
    Placement(visible = true, transformation(origin = {36, 10}, extent = {{-12, -12}, {12, 12}}, rotation = 90)));
  Modelica.Blocks.Nonlinear.Limiter negative1(homotopyType = Modelica.Blocks.Types.LimiterHomotopy.UpperLimit, strict = false, uMax = 0, uMin = lower_torque_limit) annotation(
    Placement(visible = true, transformation(origin = {-35, 35}, extent = {{-7, -7}, {7, 7}}, rotation = 90)));
  Modelica.Blocks.Math.BooleanToReal ToReal annotation(
    Placement(visible = true, transformation(origin = {36, -38}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Logical.LessThreshold neg annotation(
    Placement(visible = true, transformation(origin = {16, -38}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Abs abs11 annotation(
    Placement(visible = true, transformation(origin = {0, -58}, extent = {{-6, -6}, {6, 6}}, rotation = -90)));
  Modelica.Blocks.Math.Gain inv_radius(k = 1/whl_plant_init_radius)  annotation(
    Placement(visible = true, transformation(origin = {22, -74}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant mass(k = veh_plant_init_mass_total)  annotation(
    Placement(visible = true, transformation(origin = {-6, -88}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  ByD_D1.Dependencies.Avoid_Zero_Division2 avoid_Zero_Division2 annotation(
    Placement(visible = true, transformation(origin = {48, -88}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Tables.CombiTable1Ds whl_trq_max_reg_coeff(columns = 1:2, fileName = whl_ctrl_maps_fname, tableName = "vpc_brake_init_ratio_ecu_brk_total_brk", tableOnFile = true)  annotation(
    Placement(visible = true, transformation(origin = {73, -37}, extent = {{25, -25}, {-25, 25}}, rotation = -90)));
  Modelica.Blocks.Nonlinear.Limiter limiter(strict = false,uMax = 4, uMin = 0)  annotation(
    Placement(visible = true, transformation(origin = {67, -89}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
equation
  connect(abs1.y, whl_ctrl_brk_cmd_simu) annotation(
    Line(points = {{88.5, 17}, {113, 17}}, color = {0, 0, 127}));
  connect(inv_trq_brake_max.y, abs1.u) annotation(
    Line(points = {{76, 39}, {76, 27.4}, {77, 27.4}, {77, 17}}, color = {0, 0, 127}));
  connect(add.y, brake_fraction.u) annotation(
    Line(points = {{48.6, 74}, {56.6, 74}}, color = {0, 0, 127}));
  connect(brake_fraction.y, inv_trq_brake_max.u) annotation(
    Line(points = {{70.6, 74}, {76, 74}, {76, 53}}, color = {0, 0, 127}));
  connect(vpc_brk_trq_dmd_simu, add.u1) annotation(
    Line(points = {{-104, 62}, {-35, 62}, {-35, 78}, {35, 78}}, color = {0, 0, 127}));
  connect(add1.y, add.u2) annotation(
    Line(points = {{23.2, 52}, {27.2, 52}, {27.2, 70}, {33.2, 70}}, color = {0, 0, 127}));
  connect(drv_brk_dmd_simu, ped_pos_to_brk_trq.u) annotation(
    Line(points = {{-106, -74}, {-94.5, -74}, {-94.5, -75}, {-82, -75}}, color = {0, 0, 127}));
  connect(ped_pos_to_brk_trq.y[2], negative.u) annotation(
    Line(points = {{-34, -75}, {-24, -75}, {-24, -36}}, color = {0, 0, 127}));
  connect(negative.y, add1.u1) annotation(
    Line(points = {{-24, -13}, {-24, 0}, {-64, 0}, {-64, 59}, {-4, 59}}, color = {0, 0, 127}));
  connect(negative1.y, add1.u2) annotation(
    Line(points = {{-35, 43}, {-34, 43}, {-34, 44}, {-4, 44}}, color = {0, 0, 127}));
  connect(multiProduct.y, negative1.u) annotation(
    Line(points = {{36, 24}, {-35, 24}, {-35, 27}}, color = {0, 0, 127}));
  connect(negative.y, multiProduct.u[1]) annotation(
    Line(points = {{-24, -13}, {-24, 0}, {10, 0}, {10, -24}, {36, -24}, {36, -2}}, color = {0, 0, 127}));
  connect(neg.y, ToReal.u) annotation(
    Line(points = {{22.6, -38}, {28.6, -38}}, color = {255, 0, 255}));
  connect(negative.y, neg.u) annotation(
    Line(points = {{-24, -13}, {-24, 2}, {4, 2}, {4, -38}, {9, -38}}, color = {0, 0, 127}));
  connect(ToReal.y, multiProduct.u[2]) annotation(
    Line(points = {{42.6, -38}, {45.6, -38}, {45.6, -18}, {36, -18}, {36, -2}}, color = {0, 0, 127}));
  connect(negative.y, abs11.u) annotation(
    Line(points = {{-24, -12}, {-24, 6}, {0, 6}, {0, -50}}, color = {0, 0, 127}));
  connect(mass.y, avoid_Zero_Division2.u2) annotation(
    Line(points = {{1, -88}, {38, -88}, {38, -95}}, color = {0, 0, 127}));
  connect(abs11.y, inv_radius.u) annotation(
    Line(points = {{0, -64}, {0, -74}, {14, -74}}, color = {0, 0, 127}));
  connect(inv_radius.y, avoid_Zero_Division2.u1) annotation(
    Line(points = {{28, -74}, {34, -74}, {34, -83}, {38, -83}}, color = {0, 0, 127}));
  connect(whl_trq_max_reg_coeff.y[2], multiProduct.u[3]) annotation(
    Line(points = {{73, -9.5}, {73, -12}, {36, -12}, {36, -2}}, color = {0, 0, 127}));
  connect(avoid_Zero_Division2.y, limiter.u) annotation(
    Line(points = {{58, -88}, {64, -88}, {64, -89}, {61, -89}}, color = {0, 0, 127}));
  connect(limiter.y, whl_trq_max_reg_coeff.u) annotation(
    Line(points = {{72.5, -89}, {74, -89}, {74, -66}}, color = {0, 0, 127}));

annotation(
    uses(Modelica(version = "4.0.0")));
end Whl_ctrl_BYD_D1;

within ByD_D1.VPC;

model VPC_brake
  parameter String vpc_brake_maps_fname = "vpc_brake_maps.mat";
  constant Real inf = ModelicaServices.Machine.inf;
  parameter Modelica.Units.SI.Length whl_plant_init_radius = 0.3040;
  parameter Modelica.Units.SI.Mass veh_plant_init_mass_total = 1617.5;
  parameter Modelica.Units.SI.Velocity chas_spd_below_no_regen = 0.5;
  parameter Modelica.Units.SI.Velocity chas_spd_above_full_regen = 3;
  parameter Real vpc_brake_init_eff_ess_to_mot = 1;
  parameter Real vpc_brake_init_eff_accelec_to_mot = 0.95;
  parameter Real vpc_brake_init_mot_main_ratio_cum = 10.75;
  parameter Real vpc_brake_init_mot_main_eff_to_whl = 0.9409;
  parameter Real vpc_brake_init_ess_soc_above_regen_forbidden = 0.99;
  parameter Real vpc_brake_init_ess_soc_below_regen_allowed = 0.98;
  parameter Modelica.Units.SI.Acceleration min_accel = 0;
  parameter Modelica.Units.SI.Acceleration max_accel = 4;
  parameter Modelica.Units.SI.Time vpc_brake_init_time_cst_drv_trq_filter = 2;
  parameter Modelica.Units.SI.Power min_elec_pwr_mot = -200000;
  parameter Modelica.Units.SI.Power max_elec_pwr_mot = 200000;
  parameter Modelica.Units.SI.AngularVelocity min_angular_spd_mot = -1267.1;
  parameter Modelica.Units.SI.AngularVelocity max_angular_spd_mot = 1267.1;
  parameter Modelica.Units.SI.Time sample_period_unit_delays = 0.05;
  parameter Modelica.Units.SI.Inertia wheel_inertia = 1.8 "Rotational inertia of each wheel";
  parameter Real TC_Ratio = 2.5 "Torque converter gear ratio";
  parameter Real FD_Ratio = 4.3 "Final drive gear ratio";
  parameter Modelica.Units.SI.Inertia TC_inertia = 0 "Torque converter rotational inertia";
  parameter Modelica.Units.SI.Inertia FD_inertia = 0 "Final drive rotational inertia";
  parameter Modelica.Units.SI.Inertia mot_inertia = 0.02 "Rotor´s rotational inertia";
  parameter Modelica.Units.SI.Mass dynamic_mass = veh_plant_init_mass_total + (mot_inertia*(TC_Ratio*FD_Ratio)^2 + (FD_Ratio^2)*TC_inertia + FD_inertia + wheel_inertia)/(whl_plant_init_radius^2);
  Modelica.Blocks.Interfaces.RealInput chas_plant_lin_spd_out_simu annotation(
    Placement(visible = true, transformation(origin = {-104, 61}, extent = {{-12, -12}, {12, 12}}, rotation = 0), iconTransformation(origin = {-102, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput ess_plant_soc_simu annotation(
    Placement(visible = true, transformation(origin = {-104, 32}, extent = {{-12, -12}, {12, 12}}, rotation = 0), iconTransformation(origin = {-102, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput mot_plant_spd_out_simu annotation(
    Placement(visible = true, transformation(origin = {-104, 1}, extent = {{-12, -12}, {12, 12}}, rotation = 0), iconTransformation(origin = {-102, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput mot_ctrl_cstr_trq_max_neg_simu annotation(
    Placement(visible = true, transformation(origin = {-104, -30}, extent = {{-12, -12}, {12, 12}}, rotation = 0), iconTransformation(origin = {-102, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput accelec_plant_pwr_simu annotation(
    Placement(visible = true, transformation(origin = {-104, -60}, extent = {{-12, -12}, {12, 12}}, rotation = 0), iconTransformation(origin = {-102, -56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput ess_ctrl_pwr_max_reg_simu annotation(
    Placement(visible = true, transformation(origin = {-104, -90}, extent = {{-12, -12}, {12, 12}}, rotation = 0), iconTransformation(origin = {-102, -82}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput drv_brk_dmd_simu annotation(
    Placement(visible = true, transformation(origin = {-104, 89}, extent = {{-12, -12}, {12, 12}}, rotation = 0), iconTransformation(origin = {-102, 84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput vpc_brk_trq_dmd_simu annotation(
    Placement(visible = true, transformation(origin = {106, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {106, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput vpc_mot_trq_dmd_simu annotation(
    Placement(visible = true, transformation(origin = {106, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {106, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Tables.CombiTable1Ds ped_pos_2_brk_trq(columns = 1:2, fileName = vpc_brake_maps_fname, tableName = "Brk_CMD_2_Trq", tableOnFile = true) annotation(
    Placement(visible = true, transformation(origin = {-81, 89}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter Negative(uMax = 0, uMin = -inf) annotation(
    Placement(visible = true, transformation(origin = {-65, 89}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Abs abs1 annotation(
    Placement(visible = true, transformation(origin = {-44, 78}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  Modelica.Blocks.Math.Division division annotation(
    Placement(visible = true, transformation(origin = {-23, 91}, extent = {{-5, 5}, {5, -5}}, rotation = 0)));
  ByD_D1.Dependencies.Avoid_Zero_Division2 avoid_Zero_Division2 annotation(
    Placement(visible = true, transformation(origin = {-3, 89}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Blocks.Math.MultiProduct multiProduct(nu = 3) annotation(
    Placement(visible = true, transformation(origin = {62, 88}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  Modelica.Blocks.Math.BooleanToReal booleanToReal annotation(
    Placement(visible = true, transformation(origin = {34, 92}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  Modelica.Blocks.Math.Add add(k1 = 1, k2 = -1) annotation(
    Placement(visible = true, transformation(origin = {47, 59}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction transferFunction(a = {vpc_brake_init_time_cst_drv_trq_filter, 1}) annotation(
    Placement(visible = true, transformation(origin = {67, 75}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant w_rad(k = whl_plant_init_radius) annotation(
    Placement(visible = true, transformation(origin = {-46, 92}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant mass(k = dynamic_mass) annotation(
    Placement(visible = true, transformation(origin = {-22, 76}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  Modelica.Blocks.Logical.LessThreshold lessThreshold(threshold = 0) annotation(
    Placement(visible = true, transformation(origin = {16, 92}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  Modelica.Blocks.Tables.CombiTable1Ds whl_trq_max_reg_coeff(columns = 1:2, fileName = vpc_brake_maps_fname, tableName = "Accel_2_ECU_Brk_Fraction", tableOnFile = true) annotation(
    Placement(visible = true, transformation(origin = {27, 71}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limit(uMax = max_accel, uMin = min_accel) annotation(
    Placement(visible = true, transformation(origin = {11, 71}, extent = {{-3, -3}, {3, 3}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter negative2(uMax = 0, uMin = -inf) annotation(
    Placement(visible = true, transformation(origin = {80, 88}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1(k1 = 1, k2 = -1) annotation(
    Placement(visible = true, transformation(origin = {65, 39}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter negative21(uMax = 0, uMin = -inf) annotation(
    Placement(visible = true, transformation(origin = {80, 40}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  Modelica.Blocks.Math.Add add11(k1 = 1, k2 = -1) annotation(
    Placement(visible = true, transformation(origin = {-68, 56}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant spd_bel_no(k = chas_spd_below_no_regen) annotation(
    Placement(visible = true, transformation(origin = {-81, 43}, extent = {{-3, -3}, {3, 3}}, rotation = 0)));
  Modelica.Blocks.Math.Add add111(k1 = 1, k2 = -1) annotation(
    Placement(visible = true, transformation(origin = {-35, 47}, extent = {{-3, -3}, {3, 3}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant spd_bel2(k = chas_spd_below_no_regen) annotation(
    Placement(visible = true, transformation(origin = {-52, 36}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant spd_abo(k = chas_spd_above_full_regen) annotation(
    Placement(visible = true, transformation(origin = {-52, 50}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  Modelica.Blocks.Math.Division division1 annotation(
    Placement(visible = true, transformation(origin = {-22, 30}, extent = {{-6, 6}, {6, -6}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limit1(uMax = 1, uMin = 0) annotation(
    Placement(visible = true, transformation(origin = {-9, 17}, extent = {{-3, -3}, {3, 3}}, rotation = 0)));
  Modelica.Blocks.Math.MultiProduct multiProduct1(nu = 3) annotation(
    Placement(visible = true, transformation(origin = {4, 28}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant eff_ess2mot(k = vpc_brake_init_eff_ess_to_mot) annotation(
    Placement(visible = true, transformation(origin = {-74, -90}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant eff_accelec2mot(k = vpc_brake_init_eff_accelec_to_mot) annotation(
    Placement(visible = true, transformation(origin = {-83, -69}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Division division2 annotation(
    Placement(visible = true, transformation(origin = {-65, -59}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Division division21 annotation(
    Placement(visible = true, transformation(origin = {-53, -89}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add pwr_elec_available_regen(k1 = 1, k2 = -1) annotation(
    Placement(visible = true, transformation(origin = {-45, -71}, extent = {{-5, 5}, {5, -5}}, rotation = 0)));
  Modelica.Blocks.Math.MinMax mot_trq_max(nu = 2) annotation(
    Placement(visible = true, transformation(origin = {29, -47}, extent = {{-8, -8}, {8, 8}}, rotation = 90)));
  Modelica.Blocks.Nonlinear.Limiter limit2(uMax = max_elec_pwr_mot, uMin = min_elec_pwr_mot) annotation(
    Placement(visible = true, transformation(origin = {-10, -86}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limit21(uMax = max_angular_spd_mot, uMin = min_angular_spd_mot) annotation(
    Placement(visible = true, transformation(origin = {-14, -62}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Tables.CombiTable2Ds mot_pwr_2_trq(fileName = vpc_brake_maps_fname, tableName = "Elec_Pwr_2_Trq", tableOnFile = true) annotation(
    Placement(visible = true, transformation(origin = {24, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter negative(uMax = 0, uMin = -inf) annotation(
    Placement(visible = true, transformation(origin = {54, -80}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter negative1(uMax = 0, uMin = -inf) annotation(
    Placement(visible = true, transformation(origin = {-16, -40}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  Modelica.Blocks.Math.Product product annotation(
    Placement(visible = true, transformation(origin = {41, -11}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
  Modelica.Blocks.Sources.Constant ratio(k = vpc_brake_init_mot_main_ratio_cum) annotation(
    Placement(visible = true, transformation(origin = {26, -14}, extent = {{-4, -4}, {4, 4}}, rotation = -90)));
  Modelica.Blocks.Sources.Constant eff2whl(k = vpc_brake_init_mot_main_eff_to_whl) annotation(
    Placement(visible = true, transformation(origin = {57, -19}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
  Modelica.Blocks.Math.Division division3 annotation(
    Placement(visible = true, transformation(origin = {45, 9}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
  Modelica.Blocks.Math.Max max annotation(
    Placement(visible = true, transformation(origin = {38, 32}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Product product1 annotation(
    Placement(visible = true, transformation(origin = {63, 9}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
  Modelica.Blocks.Math.Division division31 annotation(
    Placement(visible = true, transformation(origin = {82, -20}, extent = {{-6, 6}, {6, -6}}, rotation = -90)));
  ByD_D1.Dependencies.Continuous_Relay continuous_Relay(X_off = vpc_brake_init_ess_soc_below_regen_allowed, X_on = vpc_brake_init_ess_soc_above_regen_forbidden) annotation(
    Placement(visible = true, transformation(origin = {-45, 7}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
equation
  connect(drv_brk_dmd_simu, ped_pos_2_brk_trq.u) annotation(
    Line(points = {{-104, 90}, {-96, 90}, {-96, 89}, {-87, 89}}, color = {0, 0, 127}));
  connect(Negative.y, abs1.u) annotation(
    Line(points = {{-59.5, 89}, {-55.5, 89}, {-55.5, 78}, {-49, 78}}, color = {0, 0, 127}));
  connect(w_rad.y, division.u2) annotation(
    Line(points = {{-42, 92}, {-36.6, 92}, {-36.6, 94}, {-29, 94}}, color = {0, 0, 127}));
  connect(abs1.y, division.u1) annotation(
    Line(points = {{-40, 78}, {-35.6, 78}, {-35.6, 88}, {-29, 88}}, color = {0, 0, 127}));
  connect(mass.y, avoid_Zero_Division2.u2) annotation(
    Line(points = {{-18, 76}, {-15.2, 76}, {-15.2, 84}, {-10, 84}}, color = {0, 0, 127}));
  connect(division.y, avoid_Zero_Division2.u1) annotation(
    Line(points = {{-17.5, 91}, {-15.5, 91}, {-15.5, 93}, {-10, 93}}, color = {0, 0, 127}));
  connect(Negative.y, lessThreshold.u) annotation(
    Line(points = {{-59.5, 89}, {-55.5, 89}, {-55.5, 99}, {4.5, 99}, {4.5, 92}, {11, 92}}, color = {0, 0, 127}));
  connect(lessThreshold.y, booleanToReal.u) annotation(
    Line(points = {{20, 92}, {29, 92}}, color = {255, 0, 255}));
  connect(booleanToReal.y, multiProduct.u[1]) annotation(
    Line(points = {{38, 92}, {58, 92}, {58, 88}}, color = {0, 0, 127}));
  connect(Negative.y, multiProduct.u[2]) annotation(
    Line(points = {{-59.5, 89}, {-55.5, 89}, {-55.5, 71}, {-29.5, 71}, {-29.5, 67}, {-9.5, 67}, {-9.5, 77}, {42, 77}, {42, 85.75}, {58, 85.75}, {58, 88}}, color = {0, 0, 127}));
  connect(avoid_Zero_Division2.y, limit.u) annotation(
    Line(points = {{4, 89}, {6, 89}, {6, 71}, {7, 71}}, color = {0, 0, 127}));
  connect(limit.y, whl_trq_max_reg_coeff.u) annotation(
    Line(points = {{14, 71}, {21, 71}}, color = {0, 0, 127}));
  connect(multiProduct.y, negative2.u) annotation(
    Line(points = {{67, 88}, {75, 88}}, color = {0, 0, 127}));
  connect(negative2.y, transferFunction.u) annotation(
    Line(points = {{84, 88}, {90.4, 88}, {90.4, 75}, {73, 75}}, color = {0, 0, 127}));
  connect(Negative.y, add.u2) annotation(
    Line(points = {{-59.5, 89}, {-55.5, 89}, {-55.5, 69}, {-31.5, 69}, {-31.5, 65}, {36.5, 65}, {36.5, 56}, {41, 56}}, color = {0, 0, 127}));
  connect(transferFunction.y, add.u1) annotation(
    Line(points = {{61.5, 75}, {50.6, 75}, {50.6, 71.5}, {41, 71.5}, {41, 62}}, color = {0, 0, 127}));
  connect(add1.y, negative21.u) annotation(
    Line(points = {{70.5, 39}, {74, 39}, {74, 40}, {75, 40}}, color = {0, 0, 127}));
  connect(negative21.y, vpc_brk_trq_dmd_simu) annotation(
    Line(points = {{84, 40}, {90, 40}, {90, 38}, {106, 38}}, color = {0, 0, 127}));
  connect(chas_plant_lin_spd_out_simu, add11.u1) annotation(
    Line(points = {{-104, 62}, {-88.5, 62}, {-88.5, 58}, {-73, 58}}, color = {0, 0, 127}));
  connect(spd_bel_no.y, add11.u2) annotation(
    Line(points = {{-78, 43}, {-75.5, 43}, {-75.5, 54}, {-73, 54}}, color = {0, 0, 127}));
  connect(spd_abo.y, add111.u1) annotation(
    Line(points = {{-48, 50}, {-44.45, 50}, {-44.45, 49}, {-39, 49}}, color = {0, 0, 127}));
  connect(spd_bel2.y, add111.u2) annotation(
    Line(points = {{-48, 36}, {-45.3, 36}, {-45.3, 45}, {-39, 45}}, color = {0, 0, 127}));
  connect(add111.y, division1.u2) annotation(
    Line(points = {{-32, 47}, {-31.3, 47}, {-31.3, 34}, {-29, 34}}, color = {0, 0, 127}));
  connect(add11.y, division1.u1) annotation(
    Line(points = {{-64, 56}, {-59.6, 56}, {-59.6, 28}, {-42.3, 28}, {-42.3, 26}, {-29, 26}}, color = {0, 0, 127}));
  connect(limit1.u, division1.y) annotation(
    Line(points = {{-13, 17}, {-14.05, 17}, {-14.05, 30}, {-15, 30}}, color = {0, 0, 127}));
  connect(limit1.y, multiProduct1.u[1]) annotation(
    Line(points = {{-6, 17}, {-3.7, 17}, {-3.7, 28}, {0, 28}}, color = {0, 0, 127}));
  connect(transferFunction.y, multiProduct1.u[2]) annotation(
    Line(points = {{61.5, 75}, {37.6, 75}, {37.6, 60}, {-2.4, 60}, {-2.4, 50}, {-2.2, 50}, {-2.2, 28}, {0, 28}}, color = {0, 0, 127}));
  connect(eff_accelec2mot.y, division2.u2) annotation(
    Line(points = {{-77.5, -69}, {-74, -69}, {-74, -62}, {-71, -62}}, color = {0, 0, 127}));
  connect(accelec_plant_pwr_simu, division2.u1) annotation(
    Line(points = {{-104, -60}, {-86, -60}, {-86, -56}, {-71, -56}}, color = {0, 0, 127}));
  connect(eff_ess2mot.y, division21.u2) annotation(
    Line(points = {{-67, -90}, {-64, -90}, {-64, -92}, {-59, -92}}, color = {0, 0, 127}));
  connect(ess_ctrl_pwr_max_reg_simu, division21.u1) annotation(
    Line(points = {{-104, -90}, {-84, -90}, {-84, -80}, {-64.5, -80}, {-64.5, -82}, {-63.75, -82}, {-63.75, -86}, {-59, -86}}, color = {0, 0, 127}));
  connect(division2.y, pwr_elec_available_regen.u2) annotation(
    Line(points = {{-59.5, -59}, {-56, -59}, {-56, -68}, {-51, -68}}, color = {0, 0, 127}));
  connect(limit2.y, mot_pwr_2_trq.u2) annotation(
    Line(points = {{-3, -86}, {12, -86}}, color = {0, 0, 127}));
  connect(mot_plant_spd_out_simu, limit21.u) annotation(
    Line(points = {{-104, 2}, {-93, 2}, {-93, -20}, {-40, -20}, {-40, -54}, {-32.5, -54}, {-32.5, -62}, {-21, -62}}, color = {0, 0, 127}));
  connect(mot_ctrl_cstr_trq_max_neg_simu, negative1.u) annotation(
    Line(points = {{-104, -30}, {-56.5, -30}, {-56.5, -40}, {-21, -40}}, color = {0, 0, 127}));
  connect(mot_trq_max.yMax, product.u2) annotation(
    Line(points = {{24, -38}, {24, -26.5}, {44, -26.5}, {44, -17}}, color = {0, 0, 127}));
  connect(ratio.y, product.u1) annotation(
    Line(points = {{26, -18}, {38, -18}, {38, -17}}, color = {0, 0, 127}));
  connect(product.y, division3.u1) annotation(
    Line(points = {{41, -5.5}, {41, -1}, {42, -1}, {42, 3}}, color = {0, 0, 127}));
  connect(eff2whl.y, division3.u2) annotation(
    Line(points = {{57, -13.5}, {57, -2}, {48, -2}, {48, 3}}, color = {0, 0, 127}));
  connect(multiProduct1.y, max.u1) annotation(
    Line(points = {{9, 28}, {23, 28}, {23, 36}, {31, 36}}, color = {0, 0, 127}));
  connect(division3.y, max.u2) annotation(
    Line(points = {{45, 14.5}, {45, 22.25}, {27, 22.25}, {27, 29.125}, {31, 29.125}, {31, 28}}, color = {0, 0, 127}));
  connect(negative1.y, mot_trq_max.u[1]) annotation(
    Line(points = {{-12, -40}, {0, -40}, {0, -60}, {29, -60}, {29, -55}}, color = {0, 0, 127}));
  connect(max.y, product1.u1) annotation(
    Line(points = {{45, 32}, {66, 32}, {66, 15}}, color = {0, 0, 127}));
  connect(ratio.y, division31.u2) annotation(
    Line(points = {{26, -18}, {26, -26}, {68, -26}, {68, -4}, {86, -4}, {86, -13}}, color = {0, 0, 127}));
  connect(product1.y, division31.u1) annotation(
    Line(points = {{63, 3.5}, {63, -9.5}, {78, -9.5}, {78, -13}}, color = {0, 0, 127}));
  connect(division31.y, vpc_mot_trq_dmd_simu) annotation(
    Line(points = {{82, -27}, {82, -40}, {106, -40}}, color = {0, 0, 127}));
  connect(max.y, add1.u2) annotation(
    Line(points = {{45, 32}, {52, 32}, {52, 36}, {59, 36}}, color = {0, 0, 127}));
  connect(mot_pwr_2_trq.y, negative.u) annotation(
    Line(points = {{35, -80}, {44, -80}}, color = {0, 0, 127}));
  connect(limit21.y, mot_pwr_2_trq.u1) annotation(
    Line(points = {{-7, -62}, {-4, -62}, {-4, -74}, {12, -74}}, color = {0, 0, 127}));
  connect(negative.y, mot_trq_max.u[2]) annotation(
    Line(points = {{63, -80}, {68, -80}, {68, -62}, {29, -62}, {29, -55}}, color = {0, 0, 127}));
  connect(pwr_elec_available_regen.y, limit2.u) annotation(
    Line(points = {{-39.5, -71}, {-28, -71}, {-28, -86}, {-17, -86}}, color = {0, 0, 127}));
  connect(division21.y, pwr_elec_available_regen.u1) annotation(
    Line(points = {{-47.5, -89}, {-44, -89}, {-44, -80}, {-54, -80}, {-54, -74}, {-51, -74}}, color = {0, 0, 127}));
  connect(continuous_Relay.y, multiProduct1.u[3]) annotation(
    Line(points = {{-30, 7}, {-4, 7}, {-4, 28}, {0, 28}}, color = {0, 0, 127}));
  connect(ess_plant_soc_simu, continuous_Relay.u) annotation(
    Line(points = {{-104, 32}, {-66, 32}, {-66, 7}, {-61, 7}}, color = {0, 0, 127}));
  connect(whl_trq_max_reg_coeff.y[2], multiProduct.u[3]) annotation(
    Line(points = {{32.5, 71}, {48, 71}, {48, 88}, {58, 88}}, color = {0, 0, 127}));
  connect(ped_pos_2_brk_trq.y[2], Negative.u) annotation(
    Line(points = {{-76, 90}, {-70, 90}}, color = {0, 0, 127}));
  connect(transferFunction.y, add1.u1) annotation(
    Line(points = {{62, 76}, {56, 76}, {56, 42}, {59, 42}}, color = {0, 0, 127}));
  connect(eff2whl.y, product1.u2) annotation(
    Line(points = {{58, -14}, {56, -14}, {56, 22}, {60, 22}, {60, 16}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "4.0.0")),
    Diagram(graphics = {Polygon(origin = {-73, -70}, fillColor = {14, 188, 127}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-39, 30}, {13, 30}, {39, -2}, {39, -30}, {-39, -30}, {-39, -28}, {-39, 30}}), Polygon(origin = {7, -60}, fillColor = {14, 188, 127}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-37, 30}, {13, 30}, {63, 16}, {63, -36}, {-37, -36}, {-37, -28}, {-37, 30}}), Text(origin = {56, -52}, extent = {{-10, 10}, {10, -10}}, textString = "Mot Main
Trq Max", fontName = "Space Grotesk SemiBold"), Text(origin = {-84, -45}, extent = {{-22, 3}, {22, -3}}, textString = "electric pwr available", fontName = "Space Grotesk SemiBold"), Rectangle(origin = {-75, 87}, fillColor = {14, 188, 127}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-17, 15}, {17, -15}}), Text(origin = {-75, 76}, extent = {{-17, 4}, {17, -4}}, textString = "trq dmd at whls", fontName = "Space Grotesk SemiBold"), Polygon(origin = {-17, 72}, fillColor = {14, 188, 127}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-39, 30}, {109, 30}, {109, -20}, {69, -20}, {53, -20}, {-39, -6}, {-39, 30}}), Text(origin = {79, 62}, extent = {{-13, 6}, {13, -6}}, textString = "Brake ECU
Torque", fontName = "Space Grotesk SemiBold"), Polygon(origin = {-51, 34}, fillColor = {14, 188, 127}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-39, 30}, {-5, 30}, {63, 8}, {63, -30}, {25, -46}, {-39, -46}, {-39, 30}}), Text(origin = {-78, 17}, extent = {{-8, 11}, {8, -11}}, textString = "Speed
& SoC
Limits
for Regen", fontName = "Space Grotesk SemiBold"), Rectangle(origin = {52, 11}, fillColor = {14, 188, 127}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-36, 39}, {36, -39}}), Text(origin = {27, 10}, extent = {{-9, 8}, {9, -8}}, textString = "Mot Main
Brake
Trq Dmd", fontName = "Space Grotesk SemiBold")}));
end VPC_brake;

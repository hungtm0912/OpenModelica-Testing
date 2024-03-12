within ByD_D1.VPC;

model VPC_prop
  
  Boolean LowSoC_cond;
  constant Real inf = ModelicaServices.Machine.inf;
  
  parameter Boolean Stop_at_low_SoC = true;
  parameter Modelica.Units.SI.Mass Total_mass = 1617.5;
  parameter Modelica.Units.SI.Acceleration Gravity = 9.81;
  parameter Real Ratio_weight_front = 0.55 "Fraction ow weigth applied over the front axis";
  parameter Real Transmission_ratio = 10.75;
  parameter Modelica.Units.SI.Length whl_radius = 0.304;
  parameter Real SoC_min = 10;
  
  parameter String max_whl_trq_tabname = "Lin_Spd_2_Trq_Max";
  parameter String max_whl_trq_fname = "vpc_prop_maps.mat";

  parameter String brk_mech_map_tabname = "brk_mech_map";
  parameter String brk_mech_map_fname = "vpc_prop_maps.mat";
  
  parameter String trq_pwr_elec_tabname = "trq_prw_elec_map";
  parameter String trq_pwr_elec_fname = "vpc_prop_maps.mat";
  
  parameter String friction_coeff_map_tabname = "friction_coeff_map";
  parameter String friction_coeff_map_fname = "vpc_prop_maps.mat";
  parameter Modelica.Units.SI.Time sample_period_unit_delays = 0.05;

  
  
  Modelica.Blocks.Interfaces.RealInput chas_lin_spd annotation(
    Placement(visible = true, transformation(origin = {-280, 120}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-280, 160}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput acc_cmd annotation(
    Placement(visible = true, transformation(origin = {-280, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-280, 120}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput brk_cmd annotation(
    Placement(visible = true, transformation(origin = {-280, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-280, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Tables.CombiTable1Ds max_possible_whl_trq(fileName = max_whl_trq_fname, tableName = max_whl_trq_tabname, tableOnFile = true)  annotation(
    Placement(visible = true, transformation(origin = {-225, 141}, extent = {{-17, -17}, {17, 17}}, rotation = 0)));
  Modelica.Blocks.Math.Product Prod1 annotation(
    Placement(visible = true, transformation(origin = {-168, 128}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Logical.Switch SW1 annotation(
    Placement(visible = true, transformation(origin = {-121, 111}, extent = {{-13, -13}, {13, 13}}, rotation = 0)));
  Modelica.Blocks.Logical.GreaterThreshold GT1 annotation(
    Placement(visible = true, transformation(origin = {-186, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain Gain1(k = -1) annotation(
    Placement(visible = true, transformation(origin = {-238, 38}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Tables.CombiTable1Ds ped_position_2_brk_force(fileName = brk_mech_map_fname, tableName = brk_mech_map_tabname, tableOnFile = true)  annotation(
    Placement(visible = true, transformation(origin = {-189, 49}, extent = {{-19, -19}, {19, 19}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput ess_ctrl_pwr_max annotation(
    Placement(visible = true, transformation(origin = {-280, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-280, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput cstr_trq_max_pos annotation(
    Placement(visible = true, transformation(origin = {-280, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-280, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput mot_plant_spd_out annotation(
    Placement(visible = true, transformation(origin = {-280, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-280, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput acc_elec_pwr_dmd annotation(
    Placement(visible = true, transformation(origin = {-280, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-280, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput ess_plant_soc annotation(
    Placement(visible = true, transformation(origin = {-280, -160}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-280, -160}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Math.Gain Gain2(k = 1/Transmission_ratio)  annotation(
    Placement(visible = true, transformation(origin = {-47, 99}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));
  ByD_D1.Dependencies.Strictly_pos_gate SPG1 annotation(
    Placement(visible = true, transformation(origin = {-15, 99}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));
  Modelica.Blocks.Math.Add Sum1(k2 = -1) annotation(
    Placement(visible = true, transformation(origin = {-52, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Tables.CombiTable2Ds mot_elec_pwr_2_trq(fileName = trq_pwr_elec_fname, tableName = trq_pwr_elec_tabname, tableOnFile = true)  annotation(
    Placement(visible = true, transformation(origin = {5, 7}, extent = {{-21, -21}, {21, 21}}, rotation = 0)));
  Modelica.Blocks.Tables.CombiTable1Ds tire_friction(fileName = friction_coeff_map_fname, tableName = friction_coeff_map_tabname, tableOnFile = true)  annotation(
    Placement(visible = true, transformation(origin = {22, 144}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant K1(k = Total_mass*Gravity*Ratio_weight_front)  annotation(
    Placement(visible = true, transformation(origin = {20, 118}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product Prod2 annotation(
    Placement(visible = true, transformation(origin = {58, 138}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ByD_D1.Dependencies.Gain_with_units Gain3(k = whl_radius/Transmission_ratio)  annotation(
    Placement(visible = true, transformation(origin = {92, 138}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.MinMax mM1(nu = 4) annotation(
    Placement(visible = true, transformation(origin = {155, 21}, extent = {{-25, -31}, {25, 31}}, rotation = 0)));
  Modelica.Blocks.Logical.LessEqualThreshold LET1(threshold = SoC_min) annotation(
    Placement(visible = true, transformation(origin = {62, -120}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanConstant BConst1(k = Stop_at_low_SoC) annotation(
    Placement(visible = true, transformation(origin = {62, -156}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.And And1 annotation(
    Placement(visible = true, transformation(origin = {114, -120}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.TerminateSimulation StopSim(condition = LowSoC_cond, terminationText = "Low SoC condition reached") annotation(
    Placement(visible = true, transformation(origin = {166, -148}, extent = {{-40, -4}, {40, 4}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter Lim1(uMax = inf, uMin = 0) annotation(
    Placement(visible = true, transformation(origin = {212, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput mot_trq_dmd annotation(
    Placement(visible = true, transformation(origin = {270, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {270, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  LowSoC_cond = And1.y;
  connect(chas_lin_spd, max_possible_whl_trq.u) annotation(
    Line(points = {{-280, 120}, {-263.5, 120}, {-263.5, 141}, {-245, 141}}, color = {0, 0, 127}));
  connect(max_possible_whl_trq.y[1], Prod1.u1) annotation(
    Line(points = {{-206, 141}, {-192, 141}, {-192, 133}, {-178, 133}}, color = {0, 0, 127}));
  connect(acc_cmd, Prod1.u2) annotation(
    Line(points = {{-280, 80}, {-206, 80}, {-206, 123}, {-178, 123}}, color = {0, 0, 127}));
  connect(Prod1.y, SW1.u1) annotation(
    Line(points = {{-159, 128}, {-150, 128}, {-150, 121}, {-137, 121}}, color = {0, 0, 127}));
  connect(acc_cmd, GT1.u) annotation(
    Line(points = {{-280, 80}, {-240, 80}, {-240, 100}, {-198, 100}}, color = {0, 0, 127}));
  connect(GT1.y, SW1.u2) annotation(
    Line(points = {{-175, 100}, {-172, 100}, {-172, 111}, {-137, 111}}, color = {255, 0, 255}));
  connect(brk_cmd, Gain1.u) annotation(
    Line(points = {{-280, 40}, {-264, 40}, {-264, 38}, {-248, 38}}, color = {0, 0, 127}));
  connect(Gain1.y, ped_position_2_brk_force.u) annotation(
    Line(points = {{-229, 38}, {-219.5, 38}, {-219.5, 49}, {-212, 49}}, color = {0, 0, 127}));
  connect(ped_position_2_brk_force.y[1], SW1.u3) annotation(
    Line(points = {{-168, 49}, {-153, 49}, {-153, 101}, {-137, 101}}, color = {0, 0, 127}));
  connect(SW1.y, Gain2.u) annotation(
    Line(points = {{-107, 111}, {-101.5, 111}, {-101.5, 99}, {-58, 99}}, color = {0, 0, 127}));
  connect(Gain2.y, SPG1.u) annotation(
    Line(points = {{-37.1, 99}, {-26.1, 99}}, color = {0, 0, 127}));
  connect(ess_ctrl_pwr_max, Sum1.u1) annotation(
    Line(points = {{-280, 0}, {-64, 0}}, color = {0, 0, 127}));
  connect(acc_elec_pwr_dmd, Sum1.u2) annotation(
    Line(points = {{-280, -120}, {-148, -120}, {-148, -12}, {-64, -12}}, color = {0, 0, 127}));
  connect(Sum1.y, mot_elec_pwr_2_trq.u2) annotation(
    Line(points = {{-41, -6}, {-20, -6}}, color = {0, 0, 127}));
  connect(mot_plant_spd_out, mot_elec_pwr_2_trq.u1) annotation(
    Line(points = {{-280, -80}, {-134, -80}, {-134, 20}, {-20, 20}}, color = {0, 0, 127}));
  connect(chas_lin_spd, tire_friction.u) annotation(
    Line(points = {{-280, 120}, {-256, 120}, {-256, 170}, {-122, 170}, {-122, 144}, {10, 144}}, color = {0, 0, 127}));
  connect(tire_friction.y[1], Prod2.u1) annotation(
    Line(points = {{33, 144}, {45, 144}}, color = {0, 0, 127}));
  connect(K1.y, Prod2.u2) annotation(
    Line(points = {{31, 118}, {35, 118}, {35, 132}, {45, 132}}, color = {0, 0, 127}));
  connect(Prod2.y, Gain3.u) annotation(
    Line(points = {{69, 138}, {79, 138}}, color = {0, 0, 127}));
  connect(Gain3.y, mM1.u[1]) annotation(
    Line(points = {{103, 138}, {111, 138}, {111, 21}, {130, 21}}, color = {0, 0, 127}));
  connect(SPG1.y, mM1.u[2]) annotation(
    Line(points = {{-5, 99}, {-5, 96}, {57, 96}, {57, 21}, {130, 21}}, color = {0, 0, 127}));
  connect(mot_elec_pwr_2_trq.y, mM1.u[3]) annotation(
    Line(points = {{28, 7}, {69, 7}, {69, 21}, {130, 21}}, color = {0, 0, 127}));
  connect(cstr_trq_max_pos, mM1.u[4]) annotation(
    Line(points = {{-280, -40}, {84, -40}, {84, 21}, {130, 21}}, color = {0, 0, 127}));
  connect(ess_plant_soc, LET1.u) annotation(
    Line(points = {{-280, -160}, {-100, -160}, {-100, -120}, {50, -120}}, color = {0, 0, 127}));
  connect(LET1.y, And1.u1) annotation(
    Line(points = {{73, -120}, {101, -120}}, color = {255, 0, 255}));
  connect(BConst1.y, And1.u2) annotation(
    Line(points = {{73, -156}, {83, -156}, {83, -128}, {101, -128}}, color = {255, 0, 255}));
  connect(mM1.yMin, Lim1.u) annotation(
    Line(points = {{182.5, 2}, {200, 2}}, color = {0, 0, 127}));
  connect(Lim1.y, mot_trq_dmd) annotation(
    Line(points = {{223, 2}, {245.5, 2}, {245.5, 100}, {270, 100}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-260, -180}, {260, 180}}), graphics = {Rectangle(origin = {-175, 99}, fillColor = {14, 188, 127}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-83, 75}, {83, -75}}), Text(origin = {-129, 39}, extent = {{-35, 11}, {35, -11}}, textString = "Wheel Torque
Demand Calculation", fontName = "Space Grotesk Medium"), Rectangle(origin = {81, -4}, fillColor = {14, 188, 127}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-153, 172}, {153, -172}}), Text(origin = {151, -62}, extent = {{-47, 10}, {47, -10}}, textString = "Propulsion Strategy", fontName = "Space Grotesk Medium")}),
    Icon(coordinateSystem(extent = {{-260, -180}, {260, 180}}), graphics = {Rectangle(extent = {{-260, 180}, {260, -180}}), Text(origin = {-1, 9}, extent = {{-201, 151}, {201, -151}}, textString = "VPC
prop")}),
    version = "",
    uses(Modelica(version = "4.0.0")));
end VPC_prop;

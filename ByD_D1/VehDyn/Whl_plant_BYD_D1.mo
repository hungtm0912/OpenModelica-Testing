within ByD_D1.VehDyn;

model Whl_plant_BYD_D1

parameter String whl_plant_maps_fname = "whl_plant_maps.mat";
parameter Modelica.Units.SI.Length whl_plant_init_radius = 0.3040;
parameter Modelica.Units.SI.Inertia whl_plant_init_inertia = 7.2;
parameter Modelica.Units.SI.Torque whl_plant_init_trq_brk_max = 2000;
parameter Modelica.Units.SI.Mass veh_plant_init_mass_total = 1617.5;
parameter Modelica.Units.SI.Acceleration env_init_gravity = 9.81;
parameter Real whl_plant_calc_weight_fraction_effective = 1;
parameter Real whl_plant_init_spd_thresh = 1;
parameter Real whl_plant_init_coeff_roll_1 = 0.008;
parameter Real whl_plant_init_coeff_roll_2 = 0.00012;
parameter Real whl_plant_init_coeff_roll_3 = 0;
parameter Real whl_plant_init_coeff_roll_4 = 0;
parameter Real chas_plant_init_ratio_weight_front = 0.55;
parameter Modelica.Units.SI.Torque lower_slip_torque_limit = -ModelicaServices.Machine.inf;
  Modelica.Blocks.Interfaces.RealInput whl_ctrl_brk_cmd annotation(
    Placement(visible = true, transformation(origin = {-108, 82}, extent = {{-14, -14}, {14, 14}}, rotation = 0), iconTransformation(origin = {-104, 78}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput env_sch_grade annotation(
    Placement(visible = true, transformation(origin = {-111, 1}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {-104, 0}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput whl_trq_in annotation(
    Placement(visible = true, transformation(origin = {-111, 41}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {-104, 38}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput whl_inertia_in annotation(
    Placement(visible = true, transformation(origin = {-111, -43}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {-103, -39}, extent = {{-13, -13}, {13, 13}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput whl_lin_spd_out annotation(
    Placement(visible = true, transformation(origin = {-112, -84}, extent = {{-16, -16}, {16, 16}}, rotation = 0), iconTransformation(origin = {-104, -80}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput whl_force_out annotation(
    Placement(visible = true, transformation(origin = {110, 74}, extent = {{-14, -14}, {14, 14}}, rotation = 0), iconTransformation(origin = {104, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput whl_mass_out annotation(
    Placement(visible = true, transformation(origin = {112, 0}, extent = {{-14, -14}, {14, 14}}, rotation = 0), iconTransformation(origin = {104, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput whl_spd_in annotation(
    Placement(visible = true, transformation(origin = {112, -76}, extent = {{-14, -14}, {14, 14}}, rotation = 0), iconTransformation(origin = {104, -62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain inverse_radius(k = 1/whl_plant_init_radius)  annotation(
    Placement(visible = true, transformation(origin = {0, -84}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant Init_inertia(k = whl_plant_init_inertia)  annotation(
    Placement(visible = true, transformation(origin = {-38, -70}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Add add annotation(
    Placement(visible = true, transformation(origin = {-14, -60}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Gain inverse_radius2(k = 1/whl_plant_init_radius) annotation(
    Placement(visible = true, transformation(origin = {17, -55}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Blocks.Math.Gain inverse_radius3(k = 1/whl_plant_init_radius) annotation(
    Placement(visible = true, transformation(origin = {53, -55}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  ByD_D1.Dependencies.LinearSpline Blending(xl = -0.1, xr = 0.1)  annotation(
    Placement(visible = true, transformation(origin = {-78, 64}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Product product annotation(
    Placement(visible = true, transformation(origin = {-56, 76}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter(homotopyType = Modelica.Blocks.Types.LimiterHomotopy.NoHomotopy, uMax = 0, uMin = -1000000000)  annotation(
    Placement(visible = true, transformation(origin = {-40, 76}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  Modelica.Blocks.Math.MultiSum trq_out(k = {1, 1, -1}, nu = 3, significantDigits = 8)  annotation(
    Placement(visible = true, transformation(origin = {-14, 78}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Cos cos annotation(
    Placement(visible = true, transformation(origin = {-70, 2}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.MultiSum polynomial(nu = 4, significantDigits = 8) annotation(
    Placement(visible = true, transformation(origin = {-40, -36}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  Modelica.Blocks.Math.MultiProduct multiProduct(nu = 7, significantDigits = 8)  annotation(
    Placement(visible = true, transformation(origin = {2, 2}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Math.MultiProduct c4_v3(significantDigits = 8, nu = 4)  annotation(
    Placement(visible = true, transformation(origin = {-64, -14}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  Modelica.Blocks.Math.MultiProduct c3_v2(significantDigits = 8, nu = 3) annotation(
    Placement(visible = true, transformation(origin = {-64, -32}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant coeff1(k = whl_plant_init_coeff_roll_1)  annotation(
    Placement(visible = true, transformation(origin = {-64, -48}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant coeff2(k = whl_plant_init_coeff_roll_2) annotation(
    Placement(visible = true, transformation(origin = {-78, -66}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant coeff3(k = whl_plant_init_coeff_roll_3) annotation(
    Placement(visible = true, transformation(origin = {-78, -42}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant coeff4(k = whl_plant_init_coeff_roll_4) annotation(
    Placement(visible = true, transformation(origin = {-82, -22}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  Modelica.Blocks.Math.Product c2_v annotation(
    Placement(visible = true, transformation(origin = {-62, -74}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant gravity(k = env_init_gravity) annotation(
    Placement(visible = true, transformation(origin = {-62, 26}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant weight_fraction(k = whl_plant_calc_weight_fraction_effective) annotation(
    Placement(visible = true, transformation(origin = {-46, 12}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant mass(k = veh_plant_init_mass_total) annotation(
    Placement(visible = true, transformation(origin = {-24, -18}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  Modelica.Blocks.Logical.LessEqualThreshold lessEqual(threshold = whl_plant_init_spd_thresh)  annotation(
    Placement(visible = true, transformation(origin = {-4, -22}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  Modelica.Blocks.Logical.GreaterThreshold greater(threshold = whl_plant_init_spd_thresh)  annotation(
    Placement(visible = true, transformation(origin = {-4, -38}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  Modelica.Blocks.Math.BooleanToReal toReal annotation(
    Placement(visible = true, transformation(origin = {10, -22}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  Modelica.Blocks.Math.BooleanToReal toReal1 annotation(
    Placement(visible = true, transformation(origin = {10, -38}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  Modelica.Blocks.Math.Division division annotation(
    Placement(visible = true, transformation(origin = {42, -16}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  Modelica.Blocks.Math.Product product1 annotation(
    Placement(visible = true, transformation(origin = {26, -16}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant spd_thres(k = whl_plant_init_spd_thresh) annotation(
    Placement(visible = true, transformation(origin = {28, -30}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1 annotation(
    Placement(visible = true, transformation(origin = {55, -35}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Sign sign1 annotation(
    Placement(visible = true, transformation(origin = {-60, -92}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  Modelica.Blocks.Tables.CombiTable1Ds Tire_friction(columns = 1:2, fileName = whl_plant_maps_fname, tableName = "whl_plant_init_friction_coefficient_map", tableOnFile = true)  annotation(
    Placement(visible = true, transformation(origin = {59, 37}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
  Modelica.Blocks.Math.MultiProduct upper_limit_slip(nu = 5)  annotation(
    Placement(visible = true, transformation(origin = {47, 51}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant weight_ratio(k = chas_plant_init_ratio_weight_front) annotation(
    Placement(visible = true, transformation(origin = {4, 68}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant grav(k = env_init_gravity) annotation(
    Placement(visible = true, transformation(origin = {-12, 56}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant mass2(k = veh_plant_init_mass_total) annotation(
    Placement(visible = true, transformation(origin = {2, 48}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant radius(k = whl_plant_init_radius) annotation(
    Placement(visible = true, transformation(origin = {22, 60}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant lower_lim(k = lower_slip_torque_limit) annotation(
    Placement(visible = true, transformation(origin = {12, 88}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.VariableLimiter whl_trq_out_slip_limited annotation(
    Placement(visible = true, transformation(origin = {44, 84}, extent = {{-8, 8}, {8, -8}}, rotation = 0)));
  Modelica.Blocks.Math.Gain inverse_radius1(k = 1/whl_plant_init_radius) annotation(
    Placement(visible = true, transformation(origin = {72, 82}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  ByD_D1.Dependencies.Gain_with_units Roll_Res2(k = whl_plant_init_radius)  annotation(
    Placement(visible = true, transformation(origin = {24, 2}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Product product2 annotation(
    Placement(visible = true, transformation(origin = {-71, 83}, extent = {{-3, -3}, {3, 3}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant trq_brk_max(k = -whl_plant_init_trq_brk_max) annotation(
    Placement(visible = true, transformation(origin = {-83, 89}, extent = {{-3, -3}, {3, 3}}, rotation = 0)));
equation
  connect(whl_lin_spd_out, inverse_radius.u) annotation(
    Line(points = {{-112, -84}, {-7, -84}}, color = {0, 0, 127}));
  connect(inverse_radius.y, whl_spd_in) annotation(
    Line(points = {{7, -84}, {82.5, -84}, {82.5, -76}, {112, -76}}, color = {0, 0, 127}));
  connect(whl_inertia_in, add.u1) annotation(
    Line(points = {{-111, -43}, {-102, -43}, {-102, -46}, {-98, -46}, {-98, -56}, {-21, -56}}, color = {0, 0, 127}));
  connect(Init_inertia.y, add.u2) annotation(
    Line(points = {{-31, -70}, {-27.4, -70}, {-27.4, -64}, {-21, -64}}, color = {0, 0, 127}));
  connect(add.y, inverse_radius2.u) annotation(
    Line(points = {{-7, -60}, {-2.05, -60}, {-2.05, -55}, {9, -55}}, color = {0, 0, 127}));
  connect(inverse_radius2.y, inverse_radius3.u) annotation(
    Line(points = {{25, -55}, {44.7, -55}}, color = {0, 0, 127}));
  connect(inverse_radius3.y, whl_mass_out) annotation(
    Line(points = {{61, -55}, {82.5, -55}, {82.5, 0}, {112, 0}}, color = {0, 0, 127}));
  connect(whl_spd_in, Blending.u) annotation(
    Line(points = {{112, -76}, {90, -76}, {90, 96}, {-90, 96}, {-90, 64}, {-84, 64}}, color = {0, 0, 127}));
  connect(Blending.f, product.u2) annotation(
    Line(points = {{-72, 64}, {-68, 64}, {-68, 72}, {-64, 72}}, color = {0, 0, 127}));
  connect(product.y, limiter.u) annotation(
    Line(points = {{-50, 76}, {-45, 76}}, color = {0, 0, 127}));
  connect(limiter.y, trq_out.u[1]) annotation(
    Line(points = {{-36, 76}, {-28, 76}, {-28, 78}, {-20, 78}}, color = {0, 0, 127}));
  connect(whl_trq_in, trq_out.u[2]) annotation(
    Line(points = {{-110, 42}, {-76, 42}, {-76, 52}, {-54, 52}, {-54, 64}, {-32, 64}, {-32, 78}, {-20, 78}}, color = {0, 0, 127}));
  connect(env_sch_grade, cos.u) annotation(
    Line(points = {{-110, 2}, {-77, 2}}, color = {0, 0, 127}));
  connect(cos.y, multiProduct.u[1]) annotation(
    Line(points = {{-63, 2}, {-6, 2}}, color = {0, 0, 127}));
  connect(whl_lin_spd_out, c4_v3.u[1]) annotation(
    Line(points = {{-112, -84}, {-94, -84}, {-94, -14}, {-68, -14}}, color = {0, 0, 127}));
  connect(whl_lin_spd_out, c4_v3.u[2]) annotation(
    Line(points = {{-112, -84}, {-92, -84}, {-92, -14}, {-68, -14}}, color = {0, 0, 127}));
  connect(whl_lin_spd_out, c4_v3.u[3]) annotation(
    Line(points = {{-112, -84}, {-90, -84}, {-90, -14}, {-68, -14}}, color = {0, 0, 127}));
  connect(whl_lin_spd_out, c3_v2.u[1]) annotation(
    Line(points = {{-112, -84}, {-88, -84}, {-88, -32}, {-68, -32}}, color = {0, 0, 127}));
  connect(whl_lin_spd_out, c3_v2.u[2]) annotation(
    Line(points = {{-112, -84}, {-86, -84}, {-86, -32}, {-68, -32}}, color = {0, 0, 127}));
  connect(coeff4.y, c4_v3.u[4]) annotation(
    Line(points = {{-78, -22}, {-76, -22}, {-76, -14}, {-68, -14}}, color = {0, 0, 127}));
  connect(coeff3.y, c3_v2.u[3]) annotation(
    Line(points = {{-74, -42}, {-72, -42}, {-72, -32}, {-68, -32}}, color = {0, 0, 127}));
  connect(whl_lin_spd_out, c2_v.u2) annotation(
    Line(points = {{-112, -84}, {-82, -84}, {-82, -76}, {-67, -76}}, color = {0, 0, 127}));
  connect(coeff2.y, c2_v.u1) annotation(
    Line(points = {{-74, -66}, {-70, -66}, {-70, -72}, {-67, -72}}, color = {0, 0, 127}));
  connect(c4_v3.y, polynomial.u[1]) annotation(
    Line(points = {{-59, -14}, {-52, -14}, {-52, -34}, {-44, -34}, {-44, -36}}, color = {0, 0, 127}));
  connect(c3_v2.y, polynomial.u[2]) annotation(
    Line(points = {{-60, -32}, {-52, -32}, {-52, -36}, {-44, -36}}, color = {0, 0, 127}));
  connect(coeff1.y, polynomial.u[3]) annotation(
    Line(points = {{-60, -48}, {-56, -48}, {-56, -38}, {-44, -38}, {-44, -36}}, color = {0, 0, 127}));
  connect(c2_v.y, polynomial.u[4]) annotation(
    Line(points = {{-58, -74}, {-52, -74}, {-52, -36}, {-44, -36}}, color = {0, 0, 127}));
  connect(polynomial.y, multiProduct.u[2]) annotation(
    Line(points = {{-35, -36}, {-32, -36}, {-32, 2}, {-6, 2}}, color = {0, 0, 127}));
  connect(gravity.y, multiProduct.u[3]) annotation(
    Line(points = {{-58, 26}, {-26, 26}, {-26, 2}, {-6, 2}}, color = {0, 0, 127}));
  connect(weight_fraction.y, multiProduct.u[4]) annotation(
    Line(points = {{-42, 12}, {-22, 12}, {-22, 2}, {-6, 2}}, color = {0, 0, 127}));
  connect(mass.y, multiProduct.u[5]) annotation(
    Line(points = {{-20, -18}, {-16, -18}, {-16, 2}, {-6, 2}}, color = {0, 0, 127}));
  connect(greater.y, toReal1.u) annotation(
    Line(points = {{0, -38}, {5, -38}}, color = {255, 0, 255}));
  connect(lessEqual.y, toReal.u) annotation(
    Line(points = {{0, -22}, {5, -22}}, color = {255, 0, 255}));
  connect(toReal.y, product1.u2) annotation(
    Line(points = {{14, -22}, {14, -18}, {21, -18}}, color = {0, 0, 127}));
  connect(whl_lin_spd_out, lessEqual.u) annotation(
    Line(points = {{-112, -84}, {-50, -84}, {-50, -46}, {-14, -46}, {-14, -22}, {-9, -22}}, color = {0, 0, 127}));
  connect(whl_lin_spd_out, greater.u) annotation(
    Line(points = {{-112, -84}, {-48, -84}, {-48, -48}, {-12, -48}, {-12, -38}, {-9, -38}}, color = {0, 0, 127}));
  connect(whl_lin_spd_out, product1.u1) annotation(
    Line(points = {{-112, -84}, {-50, -84}, {-50, -44}, {-14, -44}, {-14, -14}, {21, -14}, {21, -14}}, color = {0, 0, 127}));
  connect(product1.y, division.u1) annotation(
    Line(points = {{30, -16}, {35, -16}, {35, -14}, {37, -14}}, color = {0, 0, 127}));
  connect(spd_thres.y, division.u2) annotation(
    Line(points = {{32, -30}, {36, -30}, {36, -18}, {37, -18}}, color = {0, 0, 127}));
  connect(toReal1.y, add1.u2) annotation(
    Line(points = {{14, -38}, {49, -38}}, color = {0, 0, 127}));
  connect(division.y, add1.u1) annotation(
    Line(points = {{46, -16}, {48, -16}, {48, -32}, {49, -32}}, color = {0, 0, 127}));
  connect(add1.y, multiProduct.u[6]) annotation(
    Line(points = {{60.5, -35}, {62, -35}, {62, 22}, {-16, 22}, {-16, 2}, {-6, 2}}, color = {0, 0, 127}));
  connect(whl_lin_spd_out, sign1.u) annotation(
    Line(points = {{-112, -84}, {-84, -84}, {-84, -92}, {-64, -92}}, color = {0, 0, 127}));
  connect(sign1.y, multiProduct.u[7]) annotation(
    Line(points = {{-56, -92}, {-36, -92}, {-36, -98}, {68, -98}, {68, 28}, {-20, 28}, {-20, 2}, {-6, 2}}, color = {0, 0, 127}));
  connect(weight_ratio.y, upper_limit_slip.u[1]) annotation(
    Line(points = {{8, 68}, {32, 68}, {32, 54.875}, {42, 54.875}, {42, 51}}, color = {0, 0, 127}));
  connect(whl_lin_spd_out, Tire_friction.u) annotation(
    Line(points = {{-112, -84}, {-84, -84}, {-84, -98}, {70, -98}, {70, 30}, {59, 30}, {59, 31}}, color = {0, 0, 127}));
  connect(grav.y, upper_limit_slip.u[2]) annotation(
    Line(points = {{-8, 56}, {13, 56}, {13, 51}, {42, 51}}, color = {0, 0, 127}));
  connect(mass2.y, upper_limit_slip.u[3]) annotation(
    Line(points = {{6, 48}, {42, 48}, {42, 51}}, color = {0, 0, 127}));
  connect(radius.y, upper_limit_slip.u[4]) annotation(
    Line(points = {{26, 60}, {30, 60}, {30, 51}, {42, 51}}, color = {0, 0, 127}));
  connect(trq_out.y, whl_trq_out_slip_limited.u) annotation(
    Line(points = {{-7, 78}, {26, 78}, {26, 84}, {34, 84}}, color = {0, 0, 127}));
  connect(upper_limit_slip.y, whl_trq_out_slip_limited.limit1) annotation(
    Line(points = {{53, 51}, {60, 51}, {60, 70}, {28, 70}, {28, 78}, {34, 78}}, color = {0, 0, 127}));
  connect(inverse_radius1.y, whl_force_out) annotation(
    Line(points = {{79, 82}, {84, 82}, {84, 74}, {110, 74}}, color = {0, 0, 127}));
  connect(Tire_friction.y[2], upper_limit_slip.u[5]) annotation(
    Line(points = {{60, 42}, {60, 44}, {34, 44}, {34, 52}, {42, 52}}, color = {0, 0, 127}));
  connect(whl_trq_out_slip_limited.y, inverse_radius1.u) annotation(
    Line(points = {{53, 84}, {58, 84}, {58, 82}, {64, 82}}, color = {0, 0, 127}));
  connect(multiProduct.y, Roll_Res2.u) annotation(
    Line(points = {{12, 2}, {16, 2}}, color = {0, 0, 127}));
  connect(Roll_Res2.y, trq_out.u[3]) annotation(
    Line(points = {{30, 2}, {36, 2}, {36, 36}, {-26, 36}, {-26, 78}, {-20, 78}}, color = {0, 0, 127}));
  connect(trq_brk_max.y, product2.u1) annotation(
    Line(points = {{-80, 90}, {-78, 90}, {-78, 84}, {-74, 84}}, color = {0, 0, 127}));
  connect(whl_ctrl_brk_cmd, product2.u2) annotation(
    Line(points = {{-108, 82}, {-74, 82}}, color = {0, 0, 127}));
  connect(product2.y, product.u1) annotation(
    Line(points = {{-68, 84}, {-64, 84}, {-64, 80}}, color = {0, 0, 127}));
  connect(lower_lim.y, whl_trq_out_slip_limited.limit2) annotation(
    Line(points = {{16, 88}, {28, 88}, {28, 90}, {34, 90}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "4.0.0")));
end Whl_plant_BYD_D1;

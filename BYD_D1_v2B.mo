model BYD_D1_v2B
  //parameter Real prueba = datasource.getReal("key1","main");
  // DRIVING CYCLE SETTINGS
  parameter String driving_cycle_fname = "driving_cycle3.mat";
  parameter String speed_tabname = "sch_cycle";
  parameter String grade_tabname = "sch_grade";
  parameter String key_on_tabname = "key_on_dmd";
  // MASS CALCULATION
  parameter Modelica.Units.SI.Mass mass_driver = 70 "Mass of driver";
  parameter Modelica.Units.SI.Mass mass_vehicle = 1640 "Mass of the vehicle";
  parameter Modelica.Units.SI.Mass mass_cargo = 35 "Mass of cargo (and additional passengers)";
  parameter Modelica.Units.SI.Mass mass_total = mass_cargo+mass_vehicle+mass_driver;
  // BATTERY SETTINGS
  parameter Real SoH = 94.5 "Battery's State of Health percentage";
  parameter Real init_SoC = 87 "Battery's initial State of Charge percentage";
  parameter Modelica.Units.NonSI.ElectricCharge_Ah nominal_capacity = 135 "Battery's nominal capacity";
  parameter Real min_SoC = 10 "SoC level at which simulation must stop";
  parameter Boolean Stop_at_low_SoC = true "Stablish if the simulation must stop at low SoC";
  // ELECTRICAL ACCESORIES SETTINGS
  parameter Modelica.Units.SI.Power pwr_base = 270 "Base Power Consumption";
  parameter Modelica.Units.SI.Voltage dc_low_voltage = 12 "Voltage for electrical accesories";
  parameter Real pc_eff = 0.95 "Power converter efficiency";
  // WHEEL RADIUS
  parameter Modelica.Units.SI.Length wheel_radius = 0.304 "Radius of wheel";
  parameter Modelica.Units.SI.Inertia wheel_inertia = 1.8 "Rotational inertia of each wheel";
  parameter Real ratio_weight_front = 0.55 "Fraction ow weigth applied over the front axis";
  // TRANSMISSION SETTINGS
  constant Real Total_Ratio = 10.75 "Total motor-wheel gear ratio";
  parameter Real TC_Ratio = 2.5 "Torque converter gear ratio";
  parameter Real FD_Ratio = Total_Ratio/TC_Ratio "Final drive gear ratio";
  parameter Modelica.Units.SI.Inertia TC_inertia = 0 "Torque converter rotational inertia";
  parameter Modelica.Units.SI.Inertia FD_inertia = 0 "Final drive rotational inertia";
  constant Real tc_eff = 0.97;
  constant Real fd_eff = 0.97;
  constant Real mot_whl_eff = tc_eff*fd_eff;
  // CHASSIS SETTINGS
  parameter Modelica.Units.SI.Area front_area = 2.13 "Frontal area of the vehicle";
  parameter Real drag_coeff = 0.3 "Drag coefficient";
  parameter Modelica.Units.SI.Area drag_area = drag_coeff*front_area;
  // ENVIRONMENT SETTINGS
  parameter Modelica.Units.NonSI.Temperature_degC temperature = 25 "Ambient temperature";
  parameter Modelica.Units.SI.Pressure pressure = 101325 "Ambient pressure";
  parameter Real humidity(unit = "1/100") = 50 "Ambient humidity";
  parameter Boolean varying_temp = false "Stablish if there will be a time-dependent temperature";
  parameter String temp_vs_time_fname = "ByD_D1/Data/Env_std.mat" "Name of file containing temperature evolution vs time";
  parameter Boolean varying_humid = false "Stablish if there will be a time-dependent humidity";
  parameter String humid_vs_time_fname = "ByD_D1/Data/Env_std.mat" "Name of file containing humidity evolution vs time";
  parameter String humid_vs_time_tabname = "Humid" "Name of table containing humidity evolution vs time";
  parameter String temp_vs_time_tabname = "Temp" "Name of table containing temperature evolution vs time";
  parameter Modelica.Units.SI.Acceleration gravity = 9.81 "Gravitational acceleration";
  // DRIVER SETTINGS
  parameter Modelica.Units.SI.Force driver_PID_ki = 150 "Integral gain for the driver PID";
  parameter Real driver_PID_kp(unit = "Ns") = 2500 "Proportional gain for the driver PID";
  parameter Modelica.Units.SI.Velocity chas_spd_below_car_has_stopped = 0.1 "Linear speed below which driver considers car has stopped";
  parameter Modelica.Units.SI.Time drv_time_dyn_trq = 0.05 "Time constant for the first order driver´s filter";
  // VPC SETTINGS
  parameter Modelica.Units.SI.Velocity chas_spd_below_no_regen = 1.5 "Linear velocity below which regeneration is forbidden";
  parameter Modelica.Units.SI.Velocity chas_spd_above_full_regen = 10 "Linear velocity above which regeneration is fully admitted";
  parameter Real soc_below_regen_allowed = 0.98 "SoC below which regeneration is fully admitted";
  parameter Real soc_above_regen_forbidden = 0.99 "SoC above which regeneration is forbidden";
  parameter Modelica.Units.SI.Time time_cst_drv_trq_filter = 0.05 "Time constant for the first order VPC brake filter";
  // MOTOR SETTINGS
  parameter Modelica.Units.SI.AngularVelocity max_motor_spd = 1267.1 "Max. motor speed";
  parameter Modelica.Units.SI.Inertia mot_inertia = 0.02 "Rotor´s rotational inertia";
  
  // METRICS REFERENCE
  parameter String ref_filename = "reference.mat";
  parameter String ref_power_tabname = "Power";
  parameter String ref_volt_tabname = "Voltage";
  parameter String ref_current_tabname = "Current";
  parameter String ref_rpm_tabname = "void";
  parameter String ref_torque_tabname = "void";
  parameter Modelica.Units.SI.Voltage delta_volt = 1.5;
  parameter Modelica.Units.SI.Velocity delta_speed = 2/3.6;
  parameter Modelica.Units.SI.Current delta_current = 10;
  parameter Modelica.Units.SI.Power delta_power = 4e3;
  parameter Modelica.Units.SI.Torque delta_torque = 10;
  parameter Modelica.Units.SI.AngularVelocity delta_rpm = 300;
  parameter Real[4] supergain = {1,1,1,1};
    parameter Modelica.Units.SI.Time delay_speed = 0;
  parameter Modelica.Units.SI.Time delay_volt = 0;
  parameter Modelica.Units.SI.Time delay_power = 0;
  parameter Modelica.Units.SI.Time delay_current = 0;
  
  parameter Modelica.Units.SI.Time sample_period_unit_delays = 0.01;
    
  ByD_D1.PowerTrain.Powertrain_BYD_D1 powertrain(FD_Ratio = FD_Ratio, FD_inertia = FD_inertia, SoH = SoH, TC_Ratio = TC_Ratio, TC_inertia = TC_inertia, dc_low_voltage = dc_low_voltage, drag_area = drag_area, drag_coeff = drag_coeff, front_area = front_area, gravity = gravity, init_SoC = init_SoC, mass_total = mass_total, max_motor_spd = max_motor_spd, min_SoC = min_SoC, mot_inertia = mot_inertia, nominal_capacity = nominal_capacity, pc_eff = pc_eff, pwr_base = pwr_base, ratio_weight_front = ratio_weight_front, sample_period_unit_delays = sample_period_unit_delays, wheel_inertia = 4*wheel_inertia, wheel_radius = wheel_radius) annotation(
    Placement(visible = true, transformation(origin = {0, -38}, extent = {{-64, -32}, {64, 32}}, rotation = 0)));
  ByD_D1.PC_Acc_Env.Env_variable_temp_humid_air_dens env(gravity_param = gravity, humid_vs_time_fname = humid_vs_time_fname, humid_vs_time_tabname = humid_vs_time_tabname, humidity_param = humidity, pressure_param = pressure, temp_vs_time_fname = temp_vs_time_fname, temp_vs_time_tabname = temp_vs_time_tabname, temperature_param = temperature, varying_humid = varying_humid, varying_temp = varying_temp) annotation(
    Placement(visible = true, transformation(origin = {0, 72}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  ByD_D1.VPC.VPC_1_mot_regen_no_gb vpc(FD_Ratio = FD_Ratio, FD_inertia = FD_inertia,Stop_at_low_SoC = Stop_at_low_SoC, TC_Ratio = TC_Ratio, TC_inertia = TC_inertia, Total_Ratio = Total_Ratio, chas_spd_above_full_regen = chas_spd_above_full_regen, chas_spd_below_no_regen = chas_spd_below_no_regen, gravity = gravity, mass_total = mass_total, max_motor_spd = max_motor_spd, min_SoC = min_SoC, mot_inertia = mot_inertia, mot_whl_eff = mot_whl_eff, pc_eff = pc_eff, ratio_weight_front = ratio_weight_front, sample_period_unit_delays = sample_period_unit_delays, soc_above_regen_forbidden = soc_above_regen_forbidden, soc_below_regen_allowed = soc_below_regen_allowed, time_cst_drv_trq_filter = time_cst_drv_trq_filter, wheel_inertia = wheel_inertia, wheel_radius = wheel_radius) annotation(
    Placement(visible = true, transformation(origin = {22, 34}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
  ByD_D1.Dependencies.Driving_cycle_reader driving_cycle(driving_cycle_fname = driving_cycle_fname, speed_tabname = speed_tabname, grade_tabname = grade_tabname, key_on_tabname = key_on_tabname) annotation(
    Placement(visible = true, transformation(origin = {-60, 34}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
  ByD_D1.Drv.Driver_medium_duty_time_based_no_dynamic_torque drv(Drag_area = drag_area, FD_Ratio = FD_Ratio, FD_inertia = FD_inertia, Gravity = gravity, TC_Ratio = TC_Ratio, TC_inertia = TC_inertia, Total_mass = mass_total, chas_spd_below = chas_spd_below_car_has_stopped, drv_PID_ki = driver_PID_ki, drv_PID_kp = driver_PID_kp, mot_inertia = mot_inertia, sample_period_unit_delays = sample_period_unit_delays, spd_zero_reset = true, time_dyn_trq = drv_time_dyn_trq, wheel_inertia = 4*wheel_inertia, whl_radius = wheel_radius) annotation(
    Placement(visible = true, transformation(origin = {-25, 33.3158}, extent = {{-12.6842, -11.4158}, {12.6842, 12.6842}}, rotation = 0)));
  ByD_D1.Dependencies.Metrics_calculator2 metrics_calculator(delay = delay_speed, delay_current = delay_current, delay_power = delay_power, delay_volt = delay_volt,delta_current = delta_current, delta_power = delta_power, delta_rpm = delta_rpm, delta_speed = delta_speed, delta_torque = delta_torque, delta_volt = delta_volt,ref_current_tabname = ref_current_tabname, ref_filename = ref_filename, ref_power_tabname = ref_power_tabname, ref_rpm_tabname = ref_rpm_tabname, ref_torque_tabname = ref_torque_tabname, ref_volt_tabname = ref_volt_tabname, supergain = supergain)  annotation(
    Placement(visible = true, transformation(origin = {56.6667, 34}, extent = {{-16.6667, -12.5}, {16.6667, 12.5}}, rotation = 0)));
equation
  connect(vpc.vpc_bus_out, powertrain.main_info_bus) annotation(
    Line(points = {{22, 22}, {22, 12}, {0, 12}, {0, -5.6}}, color = {17, 95, 95}, thickness = 0.5));
  connect(powertrain.powertrain_bus_out, vpc.vpc_powertrain_bus_in) annotation(
    Line(points = {{1, -68.72}, {1, -76}, {84.96, -76}, {84.96, 57.28}, {22, 57.28}, {22, 46}}, color = {17, 95, 95}, thickness = 0.5));
  connect(env.air_dens, powertrain.main_info_bus.air_density) annotation(
    Line(points = {{0, 63}, {0, -7}}, color = {17, 95, 95}));
  connect(driving_cycle.bus, drv.driving_cycle_bus) annotation(
    Line(points = {{-48.24, 33.76}, {-37.24, 33.76}}, color = {17, 95, 95}, thickness = 0.5));
  connect(powertrain.powertrain_bus_out.chas_lin_spd_out_simu, drv.chas_spd) annotation(
    Line(points = {{1, -68}, {1, -76}, {-86, -76}, {-86, 57.28}, {-31.5, 57.28}, {-31.5, 47}, {-31, 47}}, color = {17, 95, 95}, thickness = 0.5));
  connect(env.air_dens, drv.air_dens) annotation(
    Line(points = {{0, 64}, {0, 57.28}, {-18, 57.28}, {-18, 47}}, color = {17, 95, 95}, thickness = 0.5));
  connect(drv.brk_cmd, powertrain.main_info_bus.drv_brk_dmd_simu) annotation(
    Line(points = {{-25, 21}, {-25, 12}, {0, 12}, {0, -6}}, color = {17, 95, 95}, thickness = 0.5));
  connect(drv.drv_bus_out, vpc.vpc_drv_bus_in) annotation(
    Line(points = {{-13, 33}, {-12.5, 33}, {-12.5, 34}, {10, 34}}, color = {17, 95, 95}, thickness = 0.5));
  connect(driving_cycle.bus, powertrain.main_info_bus) annotation(
    Line(points = {{-48, 34}, {-44, 34}, {-44, 12}, {0, 12}, {0, -6}}, color = {17, 95, 95}, thickness = 0.5));
  connect(powertrain.powertrain_bus_out, metrics_calculator.variables) annotation(
    Line(points = {{1, -68}, {1, -76}, {12, -76}, {84.96, -76}, {84.96, 57.28}, {56, 57.28}, {56, 46}}, color = {17, 95, 95}, thickness = 0.5));
  connect(driving_cycle.bus, metrics_calculator.variables) annotation(
    Line(points = {{-48, 34}, {-44, 34}, {-44, 12}, {0, 12}, {0, 57.28}, {56, 57.28}, {56, 46}}, color = {17, 95, 95}, thickness = 0.5));
  annotation(
    uses(Modelica(version = "4.0.0")),
    Diagram(graphics = {Bitmap(origin = {64, 72}, extent = {{-20, -6}, {20, 6}}, imageSource = "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"), Text(origin = {-58, 73}, extent = {{-28, 7}, {28, -7}}, textString = "BYD D1 Model", fontName = "Space Grotesk SemiBold", textStyle = {TextStyle.Bold})}),
    experiment(StartTime = 0, StopTime = 3142.6, Tolerance = 1e-06, Interval = 0.1000003, solver = "rungekutta"));
end BYD_D1_v2B;

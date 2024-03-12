within ByD_D1.Buses;

expandable connector vpc_powertrain_bus_in
  extends Modelica.Icons.SignalBus;
  
  Modelica.Units.SI.Power ess_ctrl_pwr_max_prop;
  Modelica.Units.SI.Power ess_ctrl_pwr_max_reg;
  Modelica.Units.SI.Power accelec_pwr_dmd;
  Modelica.Units.SI.Torque mot_cstr_trq_max_pos;
  Modelica.Units.SI.Torque mot_cstr_trq_max_neg;
  Modelica.Units.SI.AngularVelocity mot_spd_out;
  Modelica.Units.SI.Velocity chas_lin_spd_out_simu;
  Real ess_plant_soc_simu;
  
end vpc_powertrain_bus_in;

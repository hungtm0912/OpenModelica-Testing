within ByD_D1.Buses;

expandable connector metrics_bus_in
  extends Modelica.Icons.SignalBus;
  Modelica.Units.SI.AngularVelocity mot_spd_out;
  Modelica.Units.SI.Torque mot_trq_out;
  Modelica.Units.SI.Voltage ess_voltage;
  Modelica.Units.SI.Current ess_current;
  Modelica.Units.SI.Velocity chas_lin_spd_out_simu;
  Modelica.Units.SI.Length distance;
  Modelica.Units.SI.Velocity cycle_speed;
  Real ess_plant_soc_simu;
  
end metrics_bus_in;

within ByD_D1.Buses;

expandable connector metrics_bus_out
  extends Modelica.Icons.SignalBus;
  Modelica.Units.NonSI.Energy_kWh pos_energy;
  Modelica.Units.NonSI.Energy_kWh neg_energy;
  Modelica.Units.NonSI.Energy_kWh consumption;
  Real specific_consumption(unit = "kWh/km");
  Real error_cycle;
  Modelica.Units.SI.Velocity rmse_cycle;
  Real error_voltage;
  Modelica.Units.SI.Voltage rmse_voltage;
  Real error_current;
  Modelica.Units.SI.Current rmse_current;
  Real error_power;
  Modelica.Units.SI.Power rmse_power;
  Real error_rpm;
  Modelica.Units.SI.AngularVelocity rmse_rpm;
  Real error_torque;
  Modelica.Units.SI.Torque rmse_torque;
  Real supermetrics;
end metrics_bus_out;

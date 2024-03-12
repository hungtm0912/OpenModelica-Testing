within ByD_D1.Buses;

expandable connector mot_bus_out
  extends Modelica.Icons.SignalSubBus;
  Modelica.Units.SI.Torque mot_cstr_trq_max_pos;
  Modelica.Units.SI.Torque mot_cstr_trq_max_neg;
  Modelica.Units.SI.AngularVelocity mot_spd_out;
  Modelica.Units.SI.Torque mot_trq_out;
end mot_bus_out;

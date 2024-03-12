within ByD_D1.Buses;

expandable connector driving_cycle_bus
  extends Modelica.Icons.SignalBus;
  
  Modelica.Units.SI.Velocity cycle_speed;
  Real cycle_grade;
  Boolean key_on_dmd;

end driving_cycle_bus;

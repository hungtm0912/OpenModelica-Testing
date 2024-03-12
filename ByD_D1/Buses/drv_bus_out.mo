within ByD_D1.Buses;

expandable connector drv_bus_out
  extends Modelica.Icons.SignalBus;
  
  Modelica.Units.SI.Torque trq_dmd;
  Real drv_acc_cmd;
  Real drv_brk_cmd;

end drv_bus_out;

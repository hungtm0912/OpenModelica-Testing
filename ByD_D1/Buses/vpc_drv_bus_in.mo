within ByD_D1.Buses;

expandable connector vpc_drv_bus_in
  extends Modelica.Icons.SignalBus;
  
  Modelica.Units.SI.Torque trq_dmd;
  Real drv_acc_cmd;
  Real drv_brk_cmd;

end vpc_drv_bus_in;

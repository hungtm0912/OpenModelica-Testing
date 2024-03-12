within ByD_D1.Buses;

expandable connector BYD_D1_Main_Info_Bus
  extends Modelica.Icons.SignalBus;
  Modelica.Units.SI.Torque vpc_mot_trq_dmd_simu;
  Real cycle_grade;
  Real drv_brk_dmd_simu;
  Boolean key_on_dmd;

  Modelica.Units.SI.Torque vpc_brk_trq_dmd_simu;
  Modelica.Units.SI.Density air_density;
end BYD_D1_Main_Info_Bus;

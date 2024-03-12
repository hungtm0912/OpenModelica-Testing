within ByD_D1.Buses;

expandable connector ess_bus_out
  extends Modelica.Icons.SignalSubBus;
  Modelica.Units.SI.Power ess_ctrl_pwr_max_prop;
  Modelica.Units.SI.Power ess_ctrl_pwr_max_reg;
  Modelica.Units.SI.Voltage ess_voltage;
  Modelica.Units.SI.Current ess_current;
  Real ess_plant_soc_simu;
end ess_bus_out;

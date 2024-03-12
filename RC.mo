model RC
  Real v;
  Real i;
  parameter Real R=1000;
  parameter Real C=100e-6;
  parameter Real v_ini = 10;
initial equation
v = v_ini;
equation
der(v) = i/C;
v = -i*R;
annotation(
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.0001));
end RC;

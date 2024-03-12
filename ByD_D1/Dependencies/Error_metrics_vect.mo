within ByD_D1.Dependencies;

model Error_metrics_vect
  parameter Integer nu(min=0)=0;
  parameter Real delta[nu] = zeros(nu);
  parameter Real delay_ref[nu] = zeros(nu);
   
  Modelica.Blocks.Interfaces.RealVectorInput u_var[nu] annotation(
    Placement(visible = true, transformation(origin = {-100, 60}, extent = {{-20, -42}, {20, 42}}, rotation = 0), iconTransformation(origin = {-100, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealVectorOutput y_rel_time[nu] annotation(
    Placement(visible = true, transformation(origin = {100, 40}, extent = {{-20, -40}, {20, 40}}, rotation = 0), iconTransformation(origin = {100, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealVectorOutput y_thres_RMSE[nu] annotation(
    Placement(visible = true, transformation(origin = {100, -40}, extent = {{-20, -40}, {20, 40}}, rotation = 0), iconTransformation(origin = {100, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealVectorInput u_ref[nu] annotation(
    Placement(visible = true, transformation(origin = {-100, -60}, extent = {{-20, -42}, {20, 42}}, rotation = 0), iconTransformation(origin = {-100, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  ByD_D1.Dependencies.Error_metrics_integrator error_metrics_integrator(delay_ref = delay_ref, delta = delta, nu = nu)  annotation(
    Placement(visible = true, transformation(origin = {-42, 26}, extent = {{-26, -26}, {26, 26}}, rotation = 0)));
  ByD_D1.Dependencies.Avoid_zero_array_by_scalar_division array_by_scalar_div(nu=nu) annotation(
    Placement(visible = true, transformation(origin = {46, 72}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
  Modelica.Blocks.Sources.ContinuousClock Clock annotation(
    Placement(visible = true, transformation(origin = {10, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ByD_D1.Dependencies.Avoid_zero_array_sqrt_division sqrt_div(nu = nu)  annotation(
    Placement(visible = true, transformation(origin = {51, -41}, extent = {{-21, -21}, {21, 21}}, rotation = 0)));
equation
  connect(u_var, error_metrics_integrator.u_var) annotation(
    Line(points = {{-100, 60}, {-80, 60}, {-80, 36}, {-68, 36}}, color = {0, 0, 127}, thickness = 0.5));
  connect(u_ref, error_metrics_integrator.u_ref) annotation(
    Line(points = {{-100, -60}, {-80, -60}, {-80, 16}, {-68, 16}}, color = {0, 0, 127}, thickness = 0.5));
  connect(array_by_scalar_div.y, y_rel_time) annotation(
    Line(points = {{64, 72}, {77, 72}, {77, 40}, {100, 40}}, color = {0, 0, 127}, thickness = 0.5));
  connect(error_metrics_integrator.y_rel_time, array_by_scalar_div.u) annotation(
    Line(points = {{-16, 36}, {-4, 36}, {-4, 83}, {28, 83}}, color = {0, 0, 127}, thickness = 0.5));
  connect(Clock.y, array_by_scalar_div.u_denominator) annotation(
    Line(points = {{21, 64}, {28, 64}}, color = {0, 0, 127}));
  connect(error_metrics_integrator.y_thres_MSE, sqrt_div.u1) annotation(
    Line(points = {{-16, 16}, {4, 16}, {4, -28}, {30, -28}}, color = {0, 0, 127}, thickness = 0.5));
  connect(error_metrics_integrator.y_rel_time, sqrt_div.u2) annotation(
    Line(points = {{-16, 36}, {18, 36}, {18, -49}, {30, -49}}, color = {0, 0, 127}, thickness = 0.5));
  connect(sqrt_div.y, y_thres_RMSE) annotation(
    Line(points = {{72, -40}, {100, -40}}, color = {0, 0, 127}, thickness = 0.5));

annotation(
    uses(Modelica(version = "4.0.0")),
    Icon(graphics = {Rectangle(extent = {{-100, 100}, {100, -100}}), Text(origin = {0, 4}, extent = {{-50, 36}, {50, -36}}, textString = "Error
metrics
vect")}),
  Diagram);

end Error_metrics_vect;

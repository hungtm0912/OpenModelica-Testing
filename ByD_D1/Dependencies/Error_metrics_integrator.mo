within ByD_D1.Dependencies;

model Error_metrics_integrator
  parameter Integer nu(min=0)=0;
  parameter Real delta[nu] = zeros(nu);
  parameter Real delay_ref[nu] = zeros(nu);
  Real dif[nu];
  
  Modelica.Blocks.Interfaces.RealVectorInput u_var[nu] annotation(
    Placement(visible = true, transformation(origin = {-100, 60}, extent = {{-20, -42}, {20, 42}}, rotation = 0), iconTransformation(origin = {-100, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealVectorOutput y_rel_time[nu] annotation(
    Placement(visible = true, transformation(origin = {100, 40}, extent = {{-20, -40}, {20, 40}}, rotation = 0), iconTransformation(origin = {100, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealVectorOutput y_thres_MSE[nu] annotation(
    Placement(visible = true, transformation(origin = {100, -40}, extent = {{-20, -40}, {20, 40}}, rotation = 0), iconTransformation(origin = {100, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealVectorInput u_ref[nu] annotation(
    Placement(visible = true, transformation(origin = {-100, -60}, extent = {{-20, -42}, {20, 42}}, rotation = 0), iconTransformation(origin = {-100, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
for i in 1:nu loop
  dif[i] = if abs(delay_ref[i]) > 0 then abs(u_var[i] - delay(u_ref[i],delay_ref[i],delay_ref[i])) else abs(u_var[i]-u_ref[i]);
  der(y_rel_time[i]) = if dif[i]>delta[i] then 1 else 0;
  der(y_thres_MSE[i]) = if dif[i]>delta[i] then dif[i]^2 else 0;
end for;

annotation(
    uses(Modelica(version = "4.0.0")),
    Icon(graphics = {Rectangle(extent = {{-100, 100}, {100, -100}}), Text(origin = {0, 4}, extent = {{-50, 36}, {50, -36}}, textString = "Error
metrics
vect")}),
  Diagram);

end Error_metrics_integrator;

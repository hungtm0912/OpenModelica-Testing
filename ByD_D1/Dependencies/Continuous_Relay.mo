within ByD_D1.Dependencies;

model Continuous_Relay
parameter Real X_on = 1;
parameter Real X_off = 0;
parameter Real Y_off = 1;
parameter Real Y_on = 0;
parameter Real Transition_Rate = 0.7;
parameter Real slope = (Y_on - Y_off)/(X_on - X_off);
parameter Real X_on_start = X_on - (X_on - X_off)*Transition_Rate;
parameter Real Ymax = max(Y_on,Y_off);
parameter Real Ymin = min(Y_on,Y_off);
  Modelica.Blocks.Interfaces.RealInput u annotation(
    Placement(visible = true, transformation(origin = {-104, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-104, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y annotation(
    Placement(visible = true, transformation(origin = {106, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add(k2 = -1)  annotation(
    Placement(visible = true, transformation(origin = {-45, 51}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant xoff(k = X_off)  annotation(
    Placement(visible = true, transformation(origin = {-70, 34}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Product product annotation(
    Placement(visible = true, transformation(origin = {-16, 44}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant slopee(k = slope) annotation(
    Placement(visible = true, transformation(origin = {-42, 28}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1 annotation(
    Placement(visible = true, transformation(origin = {14, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant Yoff(k = Y_off) annotation(
    Placement(visible = true, transformation(origin = {-16, 68}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant Y_max(k = Ymax) annotation(
    Placement(visible = true, transformation(origin = {16, 80}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Min min2 annotation(
    Placement(visible = true, transformation(origin = {41, 59}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Blocks.Math.Max max2 annotation(
    Placement(visible = true, transformation(origin = {61, 45}, extent = {{-7, -7}, {7, 7}}, rotation = -90)));
  Modelica.Blocks.Sources.Constant Xonstart(k = X_on_start) annotation(
    Placement(visible = true, transformation(origin = {-78, -50}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Add add2(k2 = -1) annotation(
    Placement(visible = true, transformation(origin = {-53, -39}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Blocks.Math.Product product1 annotation(
    Placement(visible = true, transformation(origin = {-20, -20}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant slopee1(k = slope) annotation(
    Placement(visible = true, transformation(origin = {-48, -14}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant Yoff2(k = Y_off) annotation(
    Placement(visible = true, transformation(origin = {-16, -44}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Add add11 annotation(
    Placement(visible = true, transformation(origin = {12, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Min min1 annotation(
    Placement(visible = true, transformation(origin = {45, -49}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant Y_max2(k = Ymax) annotation(
    Placement(visible = true, transformation(origin = {22, -64}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Max max1 annotation(
    Placement(visible = true, transformation(origin = {69, -31}, extent = {{-7, 7}, {7, -7}}, rotation = 90)));
  Modelica.Blocks.Sources.Constant Y_min2(k = Ymin)  annotation(
    Placement(visible = true, transformation(origin = {60, -70}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Logical.Hysteresis hysteresis(pre_y_start = false,uHigh = X_on, uLow = X_off)  annotation(
    Placement(visible = true, transformation(origin = {36, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.Switch switch1 annotation(
    Placement(visible = true, transformation(origin = {72, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant YMin3(k = Ymin)  annotation(
    Placement(visible = true, transformation(origin = {54, 82}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
equation
  connect(xoff.y, add.u2) annotation(
    Line(points = {{-63.4, 34}, {-57.4, 34}, {-57.4, 47}, {-53, 47}}, color = {0, 0, 127}));
  connect(u, add.u1) annotation(
    Line(points = {{-104, 0}, {-80, 0}, {-80, 55}, {-53, 55}}, color = {0, 0, 127}));
  connect(slopee.y, product.u2) annotation(
    Line(points = {{-35.4, 28}, {-31.4, 28}, {-31.4, 40}, {-25.4, 40}}, color = {0, 0, 127}));
  connect(add.y, product.u1) annotation(
    Line(points = {{-37.3, 51}, {-31.3, 51}, {-31.3, 47}, {-25.3, 47}}, color = {0, 0, 127}));
  connect(product.y, add1.u2) annotation(
    Line(points = {{-7.2, 44}, {-1.2, 44}, {-1.2, 50}, {2.8, 50}}, color = {0, 0, 127}));
  connect(Yoff.y, add1.u1) annotation(
    Line(points = {{-9.4, 68}, {-5.4, 68}, {-5.4, 62}, {2.6, 62}}, color = {0, 0, 127}));
  connect(add1.y, min2.u2) annotation(
    Line(points = {{26, 56}, {33, 56}, {33, 55}}, color = {0, 0, 127}));
  connect(Y_max.y, min2.u1) annotation(
    Line(points = {{22, 80}, {28, 80}, {28, 63}, {33, 63}}, color = {0, 0, 127}));
  connect(min2.y, max2.u2) annotation(
    Line(points = {{48, 60}, {57, 60}, {57, 53}}, color = {0, 0, 127}));
  connect(Xonstart.y, add2.u2) annotation(
    Line(points = {{-72, -50}, {-66, -50}, {-66, -44}, {-62, -44}}, color = {0, 0, 127}));
  connect(u, add2.u1) annotation(
    Line(points = {{-104, 0}, {-80, 0}, {-80, -34}, {-62, -34}}, color = {0, 0, 127}));
  connect(slopee1.y, product1.u1) annotation(
    Line(points = {{-42, -14}, {-38, -14}, {-38, -15}, {-30, -15}}, color = {0, 0, 127}));
  connect(add2.y, product1.u2) annotation(
    Line(points = {{-46, -38}, {-36, -38}, {-36, -25}, {-30, -25}}, color = {0, 0, 127}));
  connect(Yoff2.y, add11.u2) annotation(
    Line(points = {{-10, -44}, {0, -44}}, color = {0, 0, 127}));
  connect(product1.y, add11.u1) annotation(
    Line(points = {{-12, -20}, {-8, -20}, {-8, -32}, {0, -32}}, color = {0, 0, 127}));
  connect(Y_max2.y, min1.u2) annotation(
    Line(points = {{28, -64}, {32, -64}, {32, -54}, {36, -54}}, color = {0, 0, 127}));
  connect(add11.y, min1.u1) annotation(
    Line(points = {{24, -38}, {32, -38}, {32, -44}, {36, -44}}, color = {0, 0, 127}));
  connect(min1.y, max1.u2) annotation(
    Line(points = {{52, -48}, {64, -48}, {64, -40}}, color = {0, 0, 127}));
  connect(Y_min2.y, max1.u1) annotation(
    Line(points = {{66, -70}, {74, -70}, {74, -40}}, color = {0, 0, 127}));
  connect(hysteresis.y, switch1.u2) annotation(
    Line(points = {{48, 0}, {60, 0}}, color = {255, 0, 255}));
  connect(max1.y, switch1.u3) annotation(
    Line(points = {{70, -24}, {68, -24}, {68, -16}, {52, -16}, {52, -8}, {60, -8}}, color = {0, 0, 127}));
  connect(max2.y, switch1.u1) annotation(
    Line(points = {{62, 38}, {60, 38}, {60, 20}, {52, 20}, {52, 8}, {60, 8}}, color = {0, 0, 127}));
  connect(u, hysteresis.u) annotation(
    Line(points = {{-104, 0}, {24, 0}}, color = {0, 0, 127}));
  connect(switch1.y, y) annotation(
    Line(points = {{84, 0}, {106, 0}}, color = {0, 0, 127}));
  connect(YMin3.y, max2.u1) annotation(
    Line(points = {{60, 82}, {66, 82}, {66, 54}}, color = {0, 0, 127}));

annotation(
    uses(Modelica(version = "4.0.0")),
    Icon(graphics = {Text(origin = {-2, -1}, extent = {{-66, 25}, {66, -25}}, textString = "Continuous
Relay", textStyle = {TextStyle.Bold}), Rectangle(extent = {{-100, 100}, {100, -100}})}));
end Continuous_Relay;

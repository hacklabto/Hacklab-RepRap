//When built, this file will echo a partlist, specific to your configurations.

include <configuration.scad>


echo("Part list for build_volume", build_volume);
echo("Many ",  nut_diameter, " diameter nuts.");
echo ("4x     stepper motor.");
echo("4x      frame-vertex");
echo("8x     pla-bushing");
echo("6x     bar-clamp");
echo("1x     build platform mount");
echo("1x     ", build_volume[X], "x", build_volume[Y], "mm build platform");
echo("2x     z-motor-mount");
echo("1x     x-end-motor");
echo("1x      x-end-idler");

local ns = reqNamespace

--Define new components here
--ns.Component.create("compName",{"attrib1","attrib2"},{attrib1=defaultValue,attrib2=defaultValue})

LOG("Loading components...", LogLevel.Info, 1)

ns.Component.create("playerMove",{"x","y","z"})
ns.Component.create("boombox",{"volume","isPlaying","sound","channel"})
ns.Component.create("topo")
ns.Component.create("bullet",{"damage","speed","lifetime"},{damage=0,speed=3,lifetime=100}) --lifetime is in frames
ns.Component.create("mainCamera", {"rotationCenter","radius","rotationSpeed"},{rotationCenter={x = -20.0, y = -8.0, z = -300.0}, radius=10, rotationSpeed=1})

LOG("Components load completed", LogLevel.Info, 1)
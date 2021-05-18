local ns = require("namespace")

--Define new components here
--ns.Component.create("compName",{"attrib1","attrib2"},{attrib1=defaultValue,attrib2=defaultValue})

LOG("Loading components...", LogLevel.Info, 1)

ns.Component.create("playerMove",{"x","y","z"})
ns.Component.create("boombox",{"volume","isPlaying","sound","channel"})
ns.Component.create("topo")
ns.Component.create("enemyMove", {"speed"})
ns.Component.create("enemyCollision")
ns.Component.create("bullet",{"damage","speed","lifetime"},{damage=0,speed=3,lifetime=100}) --lifetime is in frames
ns.Component.create("MainCamera", {"rotationCenter","radius","rotationSpeed"},{rotationCenter={x = 0.0, y = 0.0, z = -100.0}, radius=100, rotationSpeed=3})
ns.Component.create("health",{"lives,invulnerable"},{lives=3,invulnerable=false})
ns.Component.create("variableCollider")
ns.Component.create("powerUp", {"speed"})

LOG("Components load completed", LogLevel.Info, 1)
local ns = require("namespace")

--Define new components here
--ns.Component.create("compName",{"attrib1","attrib2"},{attrib1=defaultValue,attrib2=defaultValue})

LOG("Loading components...", LogLevel.Info, 1)

ns.Component.create("playerMove",{"x","y","z"})
ns.Component.create("topo")
ns.Component.create("scrollMovement", {"speed"})
ns.Component.create("damagePlayer")
ns.Component.create("enemyCollision")
ns.Component.create("bullet",{"damage","speed","lifetime"},{damage=0,speed=3,lifetime=100}) --lifetime is in frames
ns.Component.create("MainCamera", {"rotationCenter","radius","rotationSpeed"},{rotationCenter={x = -50.0, y = 0.0, z = -100.0}, radius=100, rotationSpeed=3})
ns.Component.create("health",{"lives","maxLives","invulnerabilityTime"},{lives=3, maxLives=3, invulnerabilityTime=0})
ns.Component.create("variableCollider")
ns.Component.create("powerUp", {"rotationSpeed", "type"})
ns.Component.create("endzone")
ns.Component.create("bosszone")
ns.Component.create("chancla", {"shootTime", "shootTimer", "currentHP", "attackMinTime", "attackMaxTime", "attackTimer", "attackTime", "state", "speed"}, {shootTime = 20, shootTimer = 0, currentHP=30, attackMinTime = 100, attackMaxTime = 1000, attackTimer = 0, state = 1, speed = 2}) --state 0 = shooting 1 = attacking 2 = returning
ns.Component.create("chanclaBullet", {"speed","lifetime", "rotation"},{speed=600,lifetime=200,rotation=0})
ns.Component.create("chanclaGuardPatrol", {"pos1", "pos2", "dir", "speed"})

LOG("Components load completed", LogLevel.Info, 1)
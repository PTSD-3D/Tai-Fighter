--New systems are to be required here for loading

LOG("Loading systems...", LogLevel.Info, 1)

require('MoveSystem')
require('BulletSystem')
require('CameraRotationSystem')
require('EnemyCollisionSystem')
require('ScrollMovementSystem')
require('HealthSystem')
require('PerspectiveTimerSystem')
require("VariableColliderSystem")
require("PowerUpSystem")
require("EndZoneSystem")
require("BossZoneSystem")
require("ChanclaSystem")
require("ChanclaBulletSystem")
require("ChanclaGuardPatrolSystem")

LOG("Systems load completed", LogLevel.Info, 1)

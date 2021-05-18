--New systems are to be required here for loading

LOG("Loading systems...", LogLevel.Info, 1)

require('MoveSystem')
require('SoundSystem')
require('BulletSystem')
require('CameraRotationSystem')
require('EnemyCollisionSystem')
require('EnemyMovementSystem')
require('HealthSystem')
require("VariableColliderSystem")
require("PowerUpSystem")

LOG("Systems load completed", LogLevel.Info, 1)

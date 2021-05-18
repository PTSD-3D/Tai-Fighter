local ns = require('namespace')

local EnemyCollisionSystem = ns.class("EnemyCollisionSystem",ns.System)

function EnemyCollisionSystem:requires() return {"enemyCollision"} end

function EnemyCollisionSystem:onCollision(enemy, other, collision)
	LOG("Enemy DEAD")
	Manager:removeEntity(enemy)
end

function EnemyCollisionSystem:update(dt)
end

Manager:addSystem(EnemyCollisionSystem())
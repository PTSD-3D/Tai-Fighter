local ns = require('namespace')

local resources = require('resources')

local EnemyCollisionSystem = ns.class("EnemyCollisionSystem",ns.System)

function EnemyCollisionSystem:requires() return {"enemyCollision"} end

function EnemyCollisionSystem:onCollision(enemy, other, collision)
	local chan = playSound(resources.Sounds.EnemyDeath.id)
	setChannelVolume(chan,1)
	LOG("Enemy DEAD")
	Manager:removeEntity(enemy)
end

function EnemyCollisionSystem:update(dt)
end

Manager:addSystem(EnemyCollisionSystem())
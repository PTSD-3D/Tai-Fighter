local ns = require('namespace')

local EnemyCollisionSystem = ns.class("EnemyCollisionSystem",ns.System)

function EnemyCollisionSystem:requires() return {"enemyCollision"} end

function EnemyCollisionSystem:onCollision(enemy, other, collision)
	if(other:has("playerMove")) then
		LOG("Player DEAD")
	else
		LOG("Enemy DEAD")
		Manager:removeEntity(enemy)
		end
end

function EnemyCollisionSystem:update(dt)
end

Manager:addSystem(EnemyCollisionSystem())
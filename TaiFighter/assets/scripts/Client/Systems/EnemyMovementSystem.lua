local ns = require('namespace')

local EnemyMovementSystem = ns.class("EnemyMovementSystem",ns.System)

function EnemyMovementSystem:requires() return {"enemyMove"} end

function EnemyMovementSystem:update(dt)
	for _, entity in pairs(self.targets) do
		local enemySpeed = entity:get("enemyMove").speed
		local movement = vec3:new(-enemySpeed*dt,0,0)
		entity.Transform:translate(movement)
	end
end

Manager:addSystem(EnemyMovementSystem())
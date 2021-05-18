local ns = require('namespace')

local BulletSystem = ns.class("BulletSystem",ns.System)

function BulletSystem:requires() return {"bullet"} end

function BulletSystem:update(dt)
	for _, entity in pairs(self.targets) do
		local bulletInfo = entity:get("bullet")
		local movement = vec3:new(bulletInfo.speed*dt,0,0)
		entity.Transform:translate(movement)
		bulletInfo.lifetime = bulletInfo.lifetime - 1
		if(bulletInfo.lifetime <= 0) then
			--delete entity
			Manager:removeEntity(entity)
		end
	end
end

function BulletSystem:onCollision(bullet,other,_)
	if(not other:has("playerMove")) then
		Manager:removeEntity(bullet)
	end
end

Manager:addSystem(BulletSystem())
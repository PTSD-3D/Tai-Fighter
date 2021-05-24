local ns = require('namespace')

local resources = require('resources')

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
	--If it hits anything other than player and powerUps we destroy de bullet
	if(not other:has("playerMove") and not other:has("powerUp")) then
		Manager:removeEntity(bullet)
	end
	--If the enemy is specifically an InvencibleEnemy we play the sound
	if(not other:has("enemyCollision") and other:has("scrollMovement") and other:has("damagePlayer")) then
		local chan = playSound(resources.Sounds.ImpactNoDamage.id)
		setChannelVolume(chan,1)
	end
end

Manager:addSystem(BulletSystem())
local ns = require('namespace')

local ChanclaBulletSystem = ns.class("ChanclaBulletSystem",ns.System)

function ChanclaBulletSystem:requires() return {"chanclaBullet"} end

function ChanclaBulletSystem:initialize()
	ns.System.initialize(self)
	math.randomseed(os.time())
end

function ChanclaBulletSystem:update(dt)
	for _, entity in pairs(self.targets) do
		local bulletInfo = entity:get("chanclaBullet")
		local movement = vec3:new(-math.cos(math.rad(bulletInfo.rotation)) * bulletInfo.speed*dt,math.sin(math.rad(bulletInfo.rotation))*bulletInfo.speed*dt,0)
		print(bulletInfo.rotation)
		entity.Transform:translate(movement)
		bulletInfo.lifetime = bulletInfo.lifetime - 1
		if(bulletInfo.lifetime <= 0) then
			print("me borro")
			Manager:removeEntity(entity)
		end
	end
end

function ChanclaBulletSystem:onCollision(bullet,other,_)
	if(other:has("playerMove")) then
		Manager:removeEntity(bullet)
	end
end

Manager:addSystem(ChanclaBulletSystem())
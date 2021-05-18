local ns = require('namespace')
local resources = require('resources')

local PowerUpSystem = ns.class("PowerUpSystem", ns.System)

function PowerUpSystem:requires() return { "powerUp" } end

function PowerUpSystem:update(dt)
	for _, entity in pairs(self.targets) do
		local objectSpeed = entity:get("powerUp").speed
		local movement = vec3:new(-objectSpeed*dt,0,0)
		entity.Transform:translate(movement)
	end
end

function PowerUpSystem:onCollision(powerup, other, _)
	if(other:has("playerMove")) then
		local chan = playSound(resources.Sounds.GetPowerUp.id)
		setChannelVolume(chan,1)
		LOG("Conseguiste el PowerUp yasssssss")
		Manager:removeEntity(powerup)
	end
end

Manager:addSystem(PowerUpSystem())
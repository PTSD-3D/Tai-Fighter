local ns = require('namespace')
local resources = require('resources')

local PowerUpSystem = ns.class("PowerUpSystem", ns.System)

function PowerUpSystem:requires() return { "powerUp" } end

function PowerUpSystem:update(dt)
	for _, entity in pairs(self.targets) do
		local objectSpeed = entity:get("powerUp").rotationSpeed
		local movement = vec3:new(0,0,-objectSpeed*dt)
		entity.Transform:rotate(movement)
	end
end

function PowerUpSystem:onCollision(powerup, other, _)
	if(other:has("playerMove")) then
		local type = powerup:get("powerUp").type
		if(type == 1) then
			local health = other:get("health")
			if(health.lives < health.maxLives) then
				health.lives = health.lives + 1
				LOG("Current lives: " .. health.lives)
			end
		elseif(type ==2) then
			local health = other:get("health")
			health.maxLives = health.maxLives + 1
			health.lives = health.maxLives
			LOG("Current lives: " .. health.lives)
		elseif(type==3) then
			local health = other:get("health")
			health.invulnerabilityTime = 300
			LOG("Ahora eres invulnerable por " .. health.invulnerabilityTime .. " frames")
		elseif(type==4) then
			local player = other:get("superShoot")
			player.shoots = 10
			LOG("Conseguiste el SuperShootPowerUp yasssssss")
		elseif(type==5) then
			Manager.eventManager:fireEvent(ns.Add3DTimeEvent(250))
		end
		local chan = playSound(resources.Sounds.GetPowerUp.id)
		setChannelVolume(chan,1)
		
		Manager:removeEntity(powerup)
	end
end

Manager:addSystem(PowerUpSystem())
local ns = require('namespace')

local resources = require('resources')

local HealthSystem = ns.class("HealthSystem",ns.System)

function HealthSystem:requires() return {"health"} end

function HealthSystem:restockLives()
	for _, entity in pairs(self.targets) do
		local health = entity:get("health")
		health.lives = health.maxLives
		UpdateGameUI(health.lives)
	end
end

function HealthSystem:onCollision(player, other, _)
	if not self.isActive then return end
	if(player:get("health").invulnerabilityTime == 0 and other:has("damagePlayer")) then
		local health = player:get("health")
		health.lives = health.lives -1
		if(health.lives == 0) then
			 LOG("Player DEAD")
			 ShowDeathUI()
			 self.isActive = false
			 Manager.eventManager:fireEvent(ns.PlayerDeathEv())
		else
			LOG("Current lives: " .. health.lives)
			UpdateGameUI(health.lives)
			health.invulnerabilityTime = 60
			end

		if(health.maxLives > 3) then health.maxLives = health.maxLives -1 end
		
		local chan = playSound(resources.Sounds.PlayerExplodes.id)
		setChannelVolume(chan,1)
	end
end

function HealthSystem:update(dt)
	if not self.isActive then return end
	for _, entity in pairs(self.targets) do
		local health = entity:get("health")
		if(health.invulnerabilityTime > 0) then
			health.invulnerabilityTime = health.invulnerabilityTime - 1
			if(health.invulnerabilityTime == 0) then
				entity.Mesh:setMaterial("body")
				LOG("Ya no eres invulnerable")
			else entity.Mesh:setMaterial("bodyInvulnerable")
			end
		end
	end
end

function HealthSystem:onAddEntity(entity)
	if(self.player ~= nil) then
		LOG("2 players, possible conflicts with perspective",LogLevel.Error,1)
	end
	self.player = entity
end

function HealthSystem:activateSys()
	self.isActive = true
end

function HealthSystem:initialize()
	ns.System.initialize(self)
	self.timer = 0 -- for invulnerability
	self.player = nil
	self.isActive = true
	Manager.eventManager:addListener("ChangeSceneEvent", self, self.restockLives)
	Manager.eventManager:addListener("ChangeSceneEvent", self, self.activateSys)
end

Manager:addSystem(HealthSystem())
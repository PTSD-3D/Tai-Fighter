local ns = require('namespace')

local resources = require('resources')

local HealthSystem = ns.class("HealthSystem",ns.System)

function HealthSystem:requires() return {"health"} end

function HealthSystem:changeCollider(event)
	local rbScale = vec3:new(0, 0, 0)
	if (event.sideview) then
		LOG("Health collider sideview", LogLevel.Trace,1)
		rbScale = vec3:new(10000,1,1)
	else
		LOG("Health collider 3D", LogLevel.Trace,1)
		rbScale = vec3:new(1,1,1)
	end
	self.player.Rigidbody:setCollisionScale(rbScale)
end

function HealthSystem:onCollision(player, other, _)
	if(not player:get("health").invulnerable and other:has("enemyMove")) then
		local chan = playSound(resources.Sounds.PlayerExplodes.id)
		setChannelVolume(chan,1)
		LOG("Player DEAD")
	end
end

function HealthSystem:onAddEntity(entity)
	if(self.player ~= nil) then
		LOG("2 players, possible conflicts with perspective",LogLevel.Error,1)
	end
	self.player = entity
end

function HealthSystem:initialize()
	ns.System.initialize(self)
	self.timer = 0 -- for invulnerability
	self.player = nil
	Manager.eventManager:addListener("changePerspectiveEvent", self, self.changeCollider)
end

Manager:addSystem(HealthSystem())
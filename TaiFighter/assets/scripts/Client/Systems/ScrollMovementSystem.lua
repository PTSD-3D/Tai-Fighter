local ns = require('namespace')

local ScrollMovementSystem = ns.class("ScrollMovementSystem",ns.System)

function ScrollMovementSystem:forceStop()
	self.scrolling = false
end

function ScrollMovementSystem:restartMovement()
	self.scrolling = true
end

function ScrollMovementSystem:requires() return {"scrollMovement"} end

function ScrollMovementSystem:update(dt)
	if not self.scrolling then return end
	for _, entity in pairs(self.targets) do
		local moveSpeed = entity:get("scrollMovement").speed
		local movement = vec3:new(-moveSpeed*dt,0,0)
		entity.Transform:translate(movement)
	end
end

function ScrollMovementSystem:initialize()
	ns.System.initialize(self)
	self.scrolling = true
	Manager.eventManager:addListener("PauseGameEv", self, self.forceStop)
	Manager.eventManager:addListener("ResumeGameEv",self,self.restartMovement)
	Manager.eventManager:addListener("ChangeSceneEvent", self, self.restartMovement)
end

Manager:addSystem(ScrollMovementSystem())
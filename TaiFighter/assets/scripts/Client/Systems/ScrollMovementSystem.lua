local ns = require('namespace')

local ScrollMovementSystem = ns.class("ScrollMovementSystem",ns.System)

function ScrollMovementSystem:requires() return {"scrollMovement"} end

function ScrollMovementSystem:update(dt)
	for _, entity in pairs(self.targets) do
		local moveSpeed = entity:get("scrollMovement").speed
		local movement = vec3:new(-moveSpeed*dt,0,0)
		entity.Transform:translate(movement)
	end
end

Manager:addSystem(ScrollMovementSystem())
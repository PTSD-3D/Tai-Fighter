local ns = require('namespace')

local ChanclaGuardPatrolSystem = ns.class("ChanclaGuardPatrolSystem",ns.System)

function ChanclaGuardPatrolSystem:requires() return {"chanclaGuardPatrol"} end

function ChanclaGuardPatrolSystem:initialize()
	ns.System.initialize(self)
    LOG("ChanclaGuardPatrolSystem init")
end

function ChanclaGuardPatrolSystem:update(dt)
	for _, entity in pairs(self.targets) do
		local chanclaGuard = entity:get("chanclaGuardPatrol")
		local tr = entity.Transform
        local movement = vec3:new(0, 0, chanclaGuard.speed * chanclaGuard.dir * dt)
        entity.Transform:translate(movement)
        if (tr.position.z < chanclaGuard.pos1 or tr.position.z > chanclaGuard.pos2) then
            chanclaGuard.dir = chanclaGuard.dir * -1
        end
	end
end

Manager:addSystem(ChanclaGuardPatrolSystem())
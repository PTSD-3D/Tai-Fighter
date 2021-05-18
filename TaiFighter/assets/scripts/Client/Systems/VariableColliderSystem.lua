local ns = require('namespace')

local VariableColliderSystem = ns.class("VariableColliderSystem",ns.System)

function VariableColliderSystem:requires() return {"variableCollider"} end

function VariableColliderSystem:changeColliderEv(event)
	local rbScale = vec3:new(0, 0, 0)
	if (event.sideview) then
		LOG("Health collider sideview", LogLevel.Trace,1)
		rbScale = vec3:new(10000,1,1)
	else
		LOG("Health collider 3D", LogLevel.Trace,1)
		rbScale = vec3:new(1,1,1)
	end
    for _,entity in pairs(self.targets) do
	    entity.Rigidbody:setCollisionScale(rbScale)
    end 
end

function VariableColliderSystem:onAddEntity(entity)
    LOG("Hay algo en addEntity")
end

function VariableColliderSystem:initialize()
	ns.System.initialize(self)
	Manager.eventManager:addListener("changePerspectiveEvent", self, self.changeColliderEv)
end

Manager:addSystem(VariableColliderSystem())
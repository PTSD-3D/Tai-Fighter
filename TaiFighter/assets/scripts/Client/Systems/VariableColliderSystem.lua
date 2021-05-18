local ns = require('namespace')

local VariableColliderSystem = ns.class("VariableColliderSystem",ns.System)

function VariableColliderSystem:requires() return {"variableCollider"} end

function VariableColliderSystem:changeColliderEv(event)
	if (event.sideview) then
		--LOG("VCol sideview", LogLevel.Trace,1)
		self.colScale = vec3:new(10000,1,1)
	else
		--LOG("Vcol collider 3D", LogLevel.Trace,1)
		self.colScale = vec3:new(1,1,1)
	end
    for _,entity in pairs(self.targets) do
	    entity.Rigidbody:setCollisionScale(self.colScale)
    end 
end

function VariableColliderSystem:onAddEntity(entity)
    --LOG("[VCOL] entidad anadida", LogLevel.Critical, 1)
    entity.Rigidbody:setCollisionScale(self.colScale)
end

function VariableColliderSystem:initialize()
	ns.System.initialize(self)
    self.colScale = vec3:new(10000,1,1)
	Manager.eventManager:addListener("changePerspectiveEvent", self, self.changeColliderEv)
end

Manager:addSystem(VariableColliderSystem())
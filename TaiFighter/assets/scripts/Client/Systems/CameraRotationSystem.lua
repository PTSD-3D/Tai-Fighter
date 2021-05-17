local ns = require('namespace')

local CameraRotationSystem = ns.class("CameraRotationSystem", ns.System)
--camera initial position = 0, 0, 8
--looking at 0, 0, -1
function CameraRotationSystem:requires()
	return {"MainCamera"}
end

function CameraRotationSystem:initialize()
	ns.System.initialize(self)
	self.sideview = true
	self.rotating = false
	self.rotAngle = 90
	self.currentAngle = 90
	Manager.eventManager:addListener("changePerspectiveEvent", self, self.changePerspective)
end

function CameraRotationSystem:onAddEntity(entity)
	self.cameraComp = entity:get("MainCamera") --Getting its MainCamera component
	self.rotationCenter = vec3:new(self.cameraComp.rotationCenter.x, self.cameraComp.rotationCenter.y, self.cameraComp.rotationCenter.z)
	self.frontalPos = self.rotationCenter - vec3:new(self.cameraComp.radius, 0, 0)
	self.sideViewPos = self.rotationCenter + vec3:new(0, 0, self.cameraComp.radius)
	cameraSetPos(self.sideViewPos)
	cameraLookAt(self.rotationCenter)
end

function CameraRotationSystem:update(dt)
	if (self.rotating == true) then
		local newPos	
		if(self.sideview) then --If we're switching from 3D to 2D	
			self.currentAngle = self.currentAngle - self.cameraComp.rotationSpeed
		else --If we're switching from 2D to 3D	
			self.currentAngle = self.currentAngle + self.cameraComp.rotationSpeed
		end
		if(self.currentAngle >= 180) then --Clamping of the angle in case the speed is not multiple of 180/90
			self.currentAngle = 180
			self.rotating = false
			LOG("Finished Camera rotation")
		elseif(self.currentAngle <= 90) then 
			self.currentAngle = 90
			self.rotating = false
			LOG("Finished Camera rotation")
		end
		--Setting of the new position and view angle (looking towards the player)
		newPos = vec3:new(math.cos(math.rad(self.currentAngle)) * self.cameraComp.radius, self.cameraComp.rotationCenter.y, math.sin(math.rad(self.currentAngle))*self.cameraComp.radius)
		cameraSetPos(newPos + self.rotationCenter)
		cameraLookAt(self.rotationCenter)
	end
end

function CameraRotationSystem:changePerspective(event)
	LOG("Starting Camera rotation")
	self.sideview = not self.sideview
	self.rotating = true
end

Manager:addSystem(CameraRotationSystem())
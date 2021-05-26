local ns = require('namespace')
local prefabs = require('Prefab')
local resources = require('resources')

local MoveSystem = ns.class("MoveSystem", ns.System)

--data
MoveSystem.sideview = true
MoveSystem.deadzone = 0.1
MoveSystem.dirs = {
	-- 2d3d
	up = vec3:new(0, 1, 0),
	down = vec3:new(0, -1, 0),
	-- 3d
	left = vec3:new(0, 0, -1),
	right = vec3:new(0, 0, 1),
	-- 2d
	forward = vec3:new(1, 0, 0),
	backward = vec3:new(-1, 0, 0)
}

function MoveSystem:stopMove()
	self.canMove = false
end

function MoveSystem:restartMovement()
	self.canMove = true
end

function MoveSystem:initialize()
	ns.System.initialize(self)
	self.canMove = true
	--Setting a listener for when the 3Dbar is depleated (Fires the change of perspective)
	Manager.eventManager:addListener("PerspectiveChangeEnd", self, self.Change)
	Manager.eventManager:addListener("PauseGameEv", self, self.stopMove)
	Manager.eventManager:addListener("ResumeGameEv",self,self.restartMovement)
	Manager.eventManager:addListener("ChangeSceneEvent", self, self.restartMovement)
	Manager.eventManager:addListener("CameraRotationEnd", self, self.boundPlayer)
end

function MoveSystem:requires() return { "playerMove" } end

function MoveSystem:Move(entity,dir, delta, speed)
	local translate = dir * delta * speed:magnitude()
	local pos = entity.Transform.position + translate
	local camPos = getCamPosition()
	if(self.sideview) then
		local height = getOrthoHeight()
		local width = getOrthoWidth()
		local playerSize = {x = 10, y = 5} -- to have some margin
		if(pos.x + playerSize.x <= camPos.x + width/2 and pos.x - playerSize.x >= camPos.x - width/2
		 and pos.y + playerSize.y <= camPos.y + height/2 and pos.y - playerSize.y >= camPos.y - height/2) then 
			entity.Transform:translate(translate)
		end
	else
		local height = getWindowHeight()
		local width = getWindowWidth()
		local x = pos.x - camPos.x
		pos.z = pos.z + 100 --camera centered in z = -100
		local facz = width/(798 + width*0.71)  --camera projection
		local facy = facz * height/width --camera projection
		local playersize = {z = x * facz/10, y = x * facy/10} -- to have some margin
		if(pos.z + playersize.z <= x*facz and pos.z - playersize.z >= -x*facz 
		 and pos.y + playersize.y <= x*facy and pos.y - playersize.y >= -x*facy)
		then 
			entity.Transform:translate(translate)
		end
	end
end

function MoveSystem:boundPlayer(event)
	for _, entity in pairs(self.targets) do
		local pos = entity.Transform.position
		local camPos = event.camPos
		if(not self.sideview) then
			local height = getWindowHeight()
			local width = getWindowWidth()
			local x = pos.x - camPos.x
			local facz = width/(798 + width*0.71)  --camera projection
			local facy = facz * height/width  --camera projection
			local playersize = {z = x * facz/10, y = x * facy/10} -- to have some margin
			if (pos.z + playersize.z > x*facz - 100) then pos.z = x*facz - playersize.z - 100
				elseif(pos.z - playersize.z < -x*facz - 100) then pos.z = -x*facz + playersize.z -100 end
			if (pos.y + playersize.y > x*facy) then pos.y = x*facy - playersize.y
				elseif(pos.y - playersize.y < -x*facy) then pos.y = -x*facy + playersize.y end
		else
			local height = getOrthoHeight()
			local playerSize = {x = 10, y = 5}
			if (pos.y + playerSize.y > camPos.y + height/2) then pos.y = camPos.y + height/2 - playerSize.y
				elseif (pos.y + playerSize.y < camPos.y - height/2) then pos.y = camPos.y - height/2 + playerSize.y end
		end
		entity.Transform.position = pos
	end
end

function MoveSystem:Shoot(entity, delta)
	local player = entity:get("superShoot")

	if(player.shoots == 0) then
	local chan = playSound(resources.Sounds.Shoot.id)
	setChannelVolume(chan,1)
	ns.spawnEntity(Manager,prefabs.Bullet({
		Transform = {
			position={x=entity.Transform.position.x,y=entity.Transform.position.y,z=entity.Transform.position.z},
			rotation={x=0.0,y=90.0,z=0.0},
			scale={x=2,y= 2,z=2}}}
	))
	elseif(player.shoots>0)then
		local chan = playSound(resources.Sounds.HugeShoot.id)
		setChannelVolume(chan,1)
		ns.spawnEntity(Manager,prefabs.SuperShot({
			Transform = {
				position={x=entity.Transform.position.x,y=entity.Transform.position.y,z=entity.Transform.position.z},
				rotation={x=0.0,y=90.0,z=0.0},
				scale={x=4,y= 4,z=4}}}
		))
		player.shoots = player.shoots - 1
	end
end

function MoveSystem:Action()
	LOG("Secondary")
end

function MoveSystem:Change()	--Called by the key/button pressed or for the PerspectiveChangeEnd event
	self.sideview = not self.sideview
	Manager.eventManager:fireEvent(ns.changePerspectiveEvent(self.sideview))
	local chan = playSound(resources.Sounds.ChangeView.id)
	setChannelVolume(chan,1)
	LOG("Changing view")
end

--Read the input from a keyboard/mouse and sends a commad
function MoveSystem:KeyboardHandleInput(entity,dt,speed)
	--Movement
	local direction = vec3:new(0, 0, 0)
	-- Up and down
	if keyPressed(PTSDKeys.W) then direction = direction + self.dirs.up end
	if keyPressed(PTSDKeys.S) then direction = direction + self.dirs.down end
	-- 2D control
	if keyPressed(PTSDKeys.A) and self.sideview then direction = direction + self.dirs.backward end
	if keyPressed(PTSDKeys.D) and self.sideview then direction = direction + self.dirs.forward end
	-- 3D control
	if keyPressed(PTSDKeys.A) and not self.sideview then direction = direction + self.dirs.left end
	if keyPressed(PTSDKeys.D) and not self.sideview then direction = direction + self.dirs.right end

	self:Move(entity, direction,dt,speed)

	-- Actions (shoot, change, something)
	if keyJustPressed(PTSDKeys.J) or mouseButtonJustPressed(PTSDMouseButton.Right) then
		self:Action()
	end
	if keyJustPressed(PTSDKeys.H) or  mouseButtonJustPressed(PTSDMouseButton.Left) then
		self:Shoot(entity, dt)
	end
	if keyJustPressed(PTSDKeys.Space) then
		self:Change()
	end
end

--Read the input from a gamepad and sends a commad
function MoveSystem:ControllerHandleInput(entity,dt,speed)
	local axis = controllerLeftAxis(0)
	local direction = vec3:new(0, 0, 0)
	-- Up and down
	if axis.y < -self.deadzone then direction = direction + self.dirs.up end
	if axis.y > self.deadzone then direction = direction + self.dirs.down end
	-- 2D control
	if axis.x > self.deadzone and self.sideview then direction = direction + self.dirs.forward end
	if axis.x < -self.deadzone and self.sideview then direction = direction + self.dirs.backward end
	-- 3D control
	if axis.x > self.deadzone and not self.sideview then direction = direction + self.dirs.right end
	if axis.x < -self.deadzone and not self.sideview then direction = direction + self.dirs.left end
	self:Move(entity, direction,dt,speed)

	
	-- Actions (shoot, change, something)
	if controllerButtonJustPressed(0, PTSDControllerButtons.B) or controllerRightTrigger(0) > self.deadzone then
		self:Action()
	end
	if controllerButtonJustPressed(0, PTSDControllerButtons.A) or controllerLeftTrigger(0) > self.deadzone then
		self:Shoot(entity, dt)
	end
	if controllerButtonJustPressed(0, PTSDControllerButtons.Y) then
		self:Change()
	end
	
end

function MoveSystem:update(dt)
	for _, entity in pairs(self.targets) do
		if self.canMove then
			local playerMoveCom = entity:get("playerMove")
			local vx = playerMoveCom.x
			local vy = playerMoveCom.y
			local vz = playerMoveCom.z
			local speed = vec3:new(vx, vy, vz)
			self:KeyboardHandleInput(entity,dt,speed)
			self:ControllerHandleInput(entity,dt,speed)	
		end

		if keyJustPressed(PTSDKeys.P) then
			self.canMove = not self.canMove
			if self.canMove then
				HidePauseUI()
				Manager.eventManager:fireEvent(ns.ResumeGameEv())
			else
				ShowPauseUI()
				Manager.eventManager:fireEvent(ns.PauseGameEv())
			end
		end
	end
end

Manager:addSystem(MoveSystem())
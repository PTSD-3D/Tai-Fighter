local ns = require("namespace")
local prefabs = require("Prefab")
local resources = require("resources")

LOG("Loading systems...", LogLevel.Info, 1)

--Define new systems here

ns.changePerspectiveEvent = ns.class("changePerspectiveEvent")

function ns.changePerspectiveEvent:initialize(sideview)
	self.sideview = sideview
	LOG("Firing ChangedPerspectiveEvent")
end

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

function MoveSystem:requires() return { "playerMove" } end

function MoveSystem:Move(entity,dir, delta, speed)
	entity.Transform:translate(dir * delta * speed:magnitude())
end

function MoveSystem:Shoot(entity, delta)
	LOG("PEW")
	local chan = playSound(resources.Sounds.Oof.id)
	setChannelVolume(chan,1)
	ns.spawnEntity(Manager,prefabs.Bullet({
		Transform = {
			position={x=entity.Transform.position.x,y=entity.Transform.position.y,z=entity.Transform.position.z},
			rotation={x=0.0,y=0.0,z=0.0},
			scale={x=1,y= 1,z=1}}}
	))
end

function MoveSystem:Action()
	LOG("Secondary")
end

function MoveSystem:Change()
	self.sideview = not self.sideview
	Manager.eventManager:fireEvent(ns.changePerspectiveEvent(self.sideview))
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
		local playerMoveCom = entity:get("playerMove")
		local vx = playerMoveCom.x
		local vy = playerMoveCom.y
		local vz = playerMoveCom.z
		local speed = vec3:new(vx, vy, vz)
		self:KeyboardHandleInput(entity,dt,speed)
		self:ControllerHandleInput(entity,dt,speed)
	end
end

Manager:addSystem(MoveSystem())

-----------------------------------------------------------

local SoundSystem = ns.class("SoundSystem",ns.System)

function SoundSystem:requires()
	return {"boombox"}
end

function SoundSystem:onPlay(music)
	if music.channel == -1 then 
		--we play for the first time
		music.channel = playSound(music.sound.id)
	else
		resumeChannel(music.channel)
	end
end

function SoundSystem:onStop(music)
	pauseChannel(music.channel)
end

function SoundSystem:setVolume(music)
	setChannelVolume(music.channel,music.volume)
end

function SoundSystem:update(dt)
	for _, entity in pairs(self.targets) do
		local music = entity:get("boombox")
		if keyJustPressed(PTSDKeys.Q) then
			--it just cant be initialized to false srry
			if music.isPlaying == nil then
				music.isPlaying = false
			end
			if music.isPlaying then
				music.isPlaying = false
				self:onStop(music)
			else
				music.isPlaying = true
				self:onPlay(music)
			end
		end
		if music.channel == -1 then
			return
		end
		if keyJustPressed(PTSDKeys.R) and music.volume <= 1 then
			music.volume = music.volume + 0.1
			self:setVolume(music)
		elseif keyJustPressed(PTSDKeys.F) and music.volume > 0 then
			music.volume = music.volume - 0.1
			self:setVolume(music)
		end
	end
end

Manager:addSystem(SoundSystem())
-----------------------------------------------------------

local BulletSystem = ns.class("BulletSystem",ns.System)

function BulletSystem:requires() return {"bullet"} end

function BulletSystem:update(dt)
	for _, entity in pairs(self.targets) do
		local bulletInfo = entity:get("bullet")
		local movement = vec3:new(bulletInfo.speed*dt,0,0)
		entity.Transform:translate(movement)
		bulletInfo.lifetime = bulletInfo.lifetime - 1
		if(bulletInfo.lifetime <= 0) then
			--delete entity
			Manager:removeEntity(entity)
		end
	end
end

function BulletSystem:onCollision(bullet, other, collision)
	if(not other:has("playerMove")) then
		print("Collision between bullet and enemy")
		Manager:removeEntity(bullet)
	end
end
Manager:addSystem(BulletSystem())

-----------------------------------------------------------

local EnemyMovementSystem = ns.class("EnemyMovementSystem",ns.System)

function EnemyMovementSystem:requires() return {"enemyMove"} end

function EnemyMovementSystem:update(dt)
	for _, entity in pairs(self.targets) do
		local enemySpeed = entity:get("enemyMove").speed
		local movement = vec3:new(-enemySpeed*dt,0,0)
		entity.Transform:translate(movement)
	end
end

Manager:addSystem(EnemyMovementSystem())

-----------------------------------------------------------
local EnemyCollisionSystem = ns.class("EnemyCollisionSystem",ns.System)

function EnemyCollisionSystem:requires() return {"enemyCollision"} end

function EnemyCollisionSystem:onCollision(enemy, other, collision)
	-- if(other:has("bullet")) then
		LOG("Enemy DEAD")
		Manager:removeEntity(enemy)
		-- end
end

function EnemyCollisionSystem:update(dt)
end

Manager:addSystem(EnemyCollisionSystem())

-----------------------------------------------------------

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

-----------------------------------------------------------
LOG("Systems load completed", LogLevel.Info, 1)

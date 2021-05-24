local ns = require('namespace')
local resources = require('resources')
local prefabs = require('Prefab')

local ChanclaSystem = ns.class("ChanclaSystem",ns.System)

function ChanclaSystem:requires() return {"chancla"} end

function ChanclaSystem:initialize()
	ns.System.initialize(self)
    LOG("ChanclaSys init")
end

function ChanclaSystem:update(dt)
	for _, entity in pairs(self.targets) do
		local chancla = entity:get("chancla")
		chancla.currentTime = chancla.currentTime - 1
		if(chancla.currentTime <= 0) then
			chancla.currentTime = chancla.shootTime
			LOG("CHANCLAPEW")
			local chan = playSound(resources.Sounds.Shoot.id)
			setChannelVolume(chan,1)
			ns.spawnEntity(Manager,prefabs.ChanclaBullet({
			Transform = {
				position={x=entity.Transform.position.x,y=entity.Transform.position.y,z=entity.Transform.position.z},
				rotation={x=0.0,y=270.0,z=0.0},
				scale={x=2,y= 2,z=2}}}
		))
		end
	end
end

function ChanclaSystem:onCollision(chancla,other,_)
    if(other:has("playerMove")) then
		LOG("Player collided with boss. piaum")
        --changeMusic(resources.Sounds.BossFight.id, true)
	end
end

Manager:addSystem(ChanclaSystem())
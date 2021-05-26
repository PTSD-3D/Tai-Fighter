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
		local tr = entity.Transform
		chancla.shootTimer = chancla.shootTimer + 1
		if(chancla.shootTimer >= chancla.shootTime) then
			chancla.shootTimer = 0
			local chance = math.random(0,100)
			if(chance >= 95) then
				ns.spawnEntity(Manager,prefabs.ChanclaFake({
				Transform = {
				position={x=tr.position.x,y=tr.position.y,z=tr.position.z},
				rotation={x=-90,y=-90,z=0.0},
				scale={x=16,y=16,z=16}}}
			))
		else
			LOG("CHANCLAPEW")
			local chan = playSound(resources.Sounds.Shoot.id)
			setChannelVolume(chan,1)
			local randRotation = math.random(-60, 60)
			ns.spawnEntity(Manager,prefabs.ChanclaBullet({
			rotation = randRotation,
			Transform = {
				position={x=tr.position.x,y=tr.position.y,z=tr.position.z},
				rotation={x=-90 ,y=270.0,z=180.0},
				scale={x=5,y=5,z=5}}}
			))
			end
		end
	end
end

function ChanclaSystem:onCollision(chancla,other,_)
    if(other:has("bullet")) then
		local chanclaInfo = chancla:get("chancla")
        print("BossHP: " .. chanclaInfo.currentHP)
        chanclaInfo.currentHP = chanclaInfo.currentHP - 1
		chanclaInfo.shootTime = chanclaInfo.shootTime - 0.5
		local chan = playSound(resources.Sounds.EnemyDeath.id)
		setChannelVolume(chan,1)
        if (chanclaInfo.currentHP <= 0) then
            Manager:removeEntity(chancla)
            Manager:changeScene("MainMenuScene")
			ReturnMenuCallback()
        end
    end
end

Manager:addSystem(ChanclaSystem())
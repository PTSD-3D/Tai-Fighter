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

		if(chancla.attackTimer <= 0) then chancla.attackTimer = math.random(chancla.attackMinTime, chancla.attackMaxTime) end
		chancla.attackTimer = chancla.attackTimer - 1
		if(chancla.attackTimer <= 0) then chancla.state = 1 end

		if(chancla.state == 0) then
			chancla.shootTimer = chancla.shootTimer + 1
			if(chancla.shootTimer >= chancla.shootTime) then
				chancla.shootTimer = 0
				LOG("CHANCLAPEW")
				local chan = playSound(resources.Sounds.Shoot.id)
				setChannelVolume(chan,1)
				ns.spawnEntity(Manager,prefabs.ChanclaBullet({
				rotation = math.random(-60, 60),
				Transform = {
					position={x=tr.position.x,y=tr.position.y,z=tr.position.z},
					rotation={x=-90,y=450.0,z=0.0},
					scale={x=20,y=1,z=1}}}
				))
			end
		elseif(chancla.state == 1)  then
			local movement = vec3:new(-chancla.speed * dt, 0, 0)
			entity.Transform:translate(movement)
			if(tr.position.x <= -140) then chancla.state = 2 end
		elseif(chancla.state == 2) then
			local movement = vec3:new(chancla.speed * dt, 0, 0)
			entity.Transform:translate(movement)
			if(tr.position.x >= 30) then chancla.state = 0 end
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
        end
    end
end

Manager:addSystem(ChanclaSystem())
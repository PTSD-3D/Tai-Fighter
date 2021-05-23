local ns = require('namespace')
local resources = require('resources')
local prefabs = require('Prefab')

local BossZoneSystem = ns.class("BossZoneSystem",ns.System)

function BossZoneSystem:requires() return {"bosszone"} end

function BossZoneSystem:initialize()
	ns.System.initialize(self)
    LOG("BossZoneSys init")
end

function BossZoneSystem:onCollision(thisZone,other,_)
    if(other:has("playerMove")) then
		LOG("Player collided with bossZone. Now play the dank music")
        print(resources.Sounds.BossFight.id)
		ns.spawnEntity(Manager,prefabs.Chancla({
		Transform = {
			position={x=20,y=10,z=-100},
			rotation={x=-90,y=-90,z=0},
			scale={x=2,y=2,z=2}}}
			))
		Manager:removeEntity(thisZone)
        --changeMusic(resources.Sounds.BossFight.id, true)
	end
end

Manager:addSystem(BossZoneSystem())
local ns = require('namespace')
local resources = require('resources')

local BossZoneSystem = ns.class("BossZoneSystem",ns.System)

function BossZoneSystem:requires() return {"bosszone"} end

function BossZoneSystem:initialize()
	ns.System.initialize(self)
    LOG("BossZoneSys init")
end

function BossZoneSystem:onCollision(_,other,_)
    if(other:has("playerMove")) then
		LOG("Player collided with bossZone. Now play the dank music")
        print(resources.Sounds.BossFight.id)
        --changeMusic(resources.Sounds.BossFight.id, true)
	end
end

Manager:addSystem(BossZoneSystem())
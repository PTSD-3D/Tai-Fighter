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
		self:spawnBoss()
		Manager:removeEntity(thisZone)
        changeMusic(resources.Sounds.BossFight.id, true)
	end
end

function BossZoneSystem:spawnBoss()
	--The boss itself
	ns.spawnEntity(Manager,prefabs.Chancla({
		Transform = {
			position={x=30,y=0,z=-100},
			rotation={x=-90,y=-90,z=0},
			scale={x=16,y=16,z=16}}}
			))
	--Minions patroling around it
	ns.spawnEntity(Manager,prefabs.ChanclaMovableGuard({
		pos1 = -120,
		pos2 = -60,
		dir = 1,
		speed = 240,
		Transform = {
			position={x=-15,y=-60,z=-120},
			rotation={x=-90,y=-90,z=0},
			scale={x=10,y=8,z=13}}}
			))
	ns.spawnEntity(Manager,prefabs.ChanclaMovableGuard({
		pos1 = -120,
		pos2 = -60,
		dir = -1,
		speed = 240,
		Transform = {
			position={x=-15,y=-30,z=-60},
			rotation={x=-90,y=-90,z=0},
			scale={x=10,y=8,z=13}}}
			))
	ns.spawnEntity(Manager,prefabs.ChanclaMovableGuard({
		pos1 = -120,
		pos2 = -60,
		dir = 1,
		speed = 240,
		Transform = {
			position={x=-15,y=0,z=-120},
			rotation={x=-90,y=-90,z=0},
			scale={x=10,y=8,z=13}}}
			))
	ns.spawnEntity(Manager,prefabs.ChanclaMovableGuard({
		pos1 = -120,
		pos2 = -60,
		dir = -1,
		speed = 120,
		Transform = {
			position={x=-15,y=30,z=-120},
			rotation={x=-90,y=-90,z=0},
			scale={x=10,y=8,z=13}}}
			))

	ns.spawnEntity(Manager,prefabs.ChanclaMovableGuard({
		pos1 = -120,
		pos2 = -60,
		dir = -1,
		speed = 120,
		Transform = {
			position={x=-15,y=60,z=-120},
			rotation={x=-90,y=-90,z=0},
			scale={x=10,y=8,z=13}}}
			))
	--Amogus
end

Manager:addSystem(BossZoneSystem())
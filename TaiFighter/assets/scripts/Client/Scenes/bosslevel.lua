local prefabs = require("Prefab") 
local Scene={
 Entities={	
	BossZone_000=prefabs.BossZone({
		Transform = {position={x=50,y=0.0,z=-102.66244506835938},rotation={x=-0.0,y=450.0001286356067,z=0.0},scale={x=150.0,y=100.0,z=8.304150581359863}}}),
	MainCamera=prefabs.MainCamera({
		Transform = {position={x=1.6529208421707153,y=-1.6529207229614258,z=7.999999046325684},rotation={x=-90.00000250447816,y=0.0,z=89.999995674289},scale={x=1.0,y=1.0,z=1.0}}}),
	PowerUp_001=prefabs.ExtraHealPowerUp({
		Transform = {position={x=150,y=0.0,z=-100},rotation={x=-90,y=-90,z=0},scale={x=1,y=1,z=1}}}),
	PowerUp_002=prefabs.HealPowerUp({
		Transform = {position={x=180,y=0.0,z=-100},rotation={x=-90,y=-90,z=0},scale={x=1,y=1,z=1}}}),
	PowerUp_003=prefabs.InvincibilityPowerUp({
		Transform = {position={x=60,y=0.0,z=-100},rotation={x=-90,y=-90,z=0},scale={x=1,y=1,z=1}}}),
	PowerUp_004=prefabs.SuperShootPowerUp({
		Transform = {position={x=80,y=10.0,z=-100},rotation={x=-90,y=-90,z=0},scale={x=2,y=2,z=2}}}),
	PowerUp_005=prefabs.TimerPowerUp({
		Transform = {position={x=100,y=10,z=-100},rotation={x=-90,y=-90,z=0},scale={x=5,y=5,z=5}}}),
	Player=prefabs.Player({
		Transform = {position={x=-0.0,y=0.0,z=-100.7860107421875},rotation={x=-90.00000250447816,y=90.00000250447816,z=0.0},scale={x=1.0,y=4.599999904632568,z=1.0}}})},
		SceneConfig=
        {
        PhysicsConfig={
            Gravity = 5
        }
    }
}
return Scene
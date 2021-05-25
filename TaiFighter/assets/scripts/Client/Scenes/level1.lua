local prefabs = require('Prefab') 
local sceneConfig = require('Prefab') 
local Scene={
 Entities={	EndZone_000=prefabs.EndZone({
		Transform = {position={x=842.125732421875,y=0.0,z=-102.66244506835938},rotation={x=-0.0,y=450.0001286356067,z=0.0},scale={x=150.0,y=100.0,z=1.0}}}),
	Enemy_001=prefabs.Enemy({
		Transform = {position={x=168.55471801757812,y=11.125066757202148,z=-152.66233825683594},rotation={x=-90.00000250447816,y=630.0000926634281,z=-0.0},scale={x=3.0,y=3.0,z=3.0}}}),
	Enemy_002=prefabs.Enemy({
		Transform = {position={x=557.6561279296875,y=6.459205627441406,z=-132.66236877441406},rotation={x=-90.00000250447816,y=630.0000926634281,z=-0.0},scale={x=3.0,y=3.0,z=3.0}}}),
	Enemy_003=prefabs.Enemy({
		Transform = {position={x=557.6561279296875,y=6.459205627441406,z=-72.66236877441406},rotation={x=-90.00000250447816,y=630.0000926634281,z=-0.0},scale={x=3.0,y=3.0,z=3.0}}}),
	Enemy_004=prefabs.Enemy({
		Transform = {position={x=66.83597564697266,y=-23.540788650512695,z=-52.662384033203125},rotation={x=-90.00000250447816,y=630.0000926634281,z=-0.0},scale={x=3.0,y=3.0,z=3.0}}}),
	Enemy_005=prefabs.Enemy({
		Transform = {position={x=114.69145202636719,y=-13.108823776245117,z=-152.66233825683594},rotation={x=-90.00000250447816,y=630.0000926634281,z=-0.0},scale={x=3.0,y=3.0,z=3.0}}}),
	Enemy_006=prefabs.Enemy({
		Transform = {position={x=557.2498779296875,y=-23.540788650512695,z=-102.66233825683594},rotation={x=-90.00000250447816,y=630.0000926634281,z=-0.0},scale={x=3.0,y=3.0,z=3.0}}}),

	InvincibleEnemy_000=prefabs.InvincibleEnemy({
		Transform = {position={x=263.272216796875,y=15.888727188110352,z=-122.66238403320312},rotation={x=-90.00000250447816,y=630.0000926634281,z=-0.0},scale={x=3.0,y=3.0,z=3.0}}}),
	InvincibleEnemy_001=prefabs.InvincibleEnemy({
		Transform = {position={x=262.3653869628906,y=-31.540786743164062,z=-71.32648468017578},rotation={x=-90.00000250447816,y=630.0000926634281,z=-0.0},scale={x=3.0,y=3.0,z=3.0}}}),
	InvincibleEnemy_002=prefabs.InvincibleEnemy({
		Transform = {position={x=450.89996337890625,y=-31.540786743164062,z=-100.68977355957031},rotation={x=-90.00000250447816,y=630.0000926634281,z=-0.0},scale={x=3.0,y=3.0,z=3.0}}}),
	InvincibleEnemy_003=prefabs.InvincibleEnemy({
		Transform = {position={x=450.89996337890625,y=-17.5760498046875,z=-100.68977355957031},rotation={x=-90.00000250447816,y=630.0000926634281,z=-0.0},scale={x=3.0,y=3.0,z=3.0}}}),
	InvincibleEnemy_004=prefabs.InvincibleEnemy({
		Transform = {position={x=450.89996337890625,y=-1.2533397674560547,z=-100.68977355957031},rotation={x=-90.00000250447816,y=630.0000926634281,z=-0.0},scale={x=3.0,y=3.0,z=3.0}}}),
	InvincibleEnemy_005=prefabs.InvincibleEnemy({
		Transform = {position={x=450.89996337890625,y=14.398191452026367,z=-100.68977355957031},rotation={x=-90.00000250447816,y=630.0000926634281,z=-0.0},scale={x=3.0,y=3.0,z=3.0}}}),
	InvincibleEnemy_006=prefabs.InvincibleEnemy({
		Transform = {position={x=450.89996337890625,y=29.693586349487305,z=-100.68977355957031},rotation={x=-90.00000250447816,y=630.0000926634281,z=-0.0},scale={x=3.0,y=3.0,z=3.0}}}),
	InvincibleEnemy_007=prefabs.InvincibleEnemy({
		Transform = {position={x=718.028564453125,y=29.693586349487305,z=-156.793701171875},rotation={x=-90.00000250447816,y=630.0000926634281,z=-0.0},scale={x=3.0,y=3.0,z=3.0}}}),
	InvincibleEnemy_008=prefabs.InvincibleEnemy({
		Transform = {position={x=718.028564453125,y=14.398191452026367,z=-127.87318420410156},rotation={x=-90.00000250447816,y=630.0000926634281,z=-0.0},scale={x=3.0,y=3.0,z=3.0}}}),
	InvincibleEnemy_009=prefabs.InvincibleEnemy({
		Transform = {position={x=718.028564453125,y=-1.2533397674560547,z=-99.80857849121094},rotation={x=-90.00000250447816,y=630.0000926634281,z=-0.0},scale={x=3.0,y=3.0,z=3.0}}}),
	InvincibleEnemy_010=prefabs.InvincibleEnemy({
		Transform = {position={x=718.028564453125,y=-17.5760498046875,z=-72.03314208984375},rotation={x=-90.00000250447816,y=630.0000926634281,z=-0.0},scale={x=3.0,y=3.0,z=3.0}}}),
	InvincibleEnemy_011=prefabs.InvincibleEnemy({
		Transform = {position={x=718.028564453125,y=-31.540786743164062,z=-47.1356315612793},rotation={x=-90.00000250447816,y=630.0000926634281,z=-0.0},scale={x=3.0,y=3.0,z=3.0}}}),
	MainCamera=prefabs.MainCamera({
		Transform = {position={x=-52.154605865478516,y=-1.6529207229614258,z=7.999999046325684},rotation={x=-90.00000250447816,y=0.0,z=89.999995674289},scale={x=1.0,y=1.0,z=1.0}}}),
	Player=prefabs.Player({
		Transform = {position={x=-53.807525634765625,y=0.0,z=-100.7860107421875},rotation={x=-90.00000250447816,y=90.00000250447816,z=0.0},scale={x=1.0,y=4.599999904632568,z=1.0}}}),
	
		TimerPowerUp_000=prefabs.InvincibilityPowerUp({
		Transform = {position={x=352,y=1.25,z=-100},rotation={x=-90,y=-90,z=0},scale={x=1,y=1,z=1}}}),
	
		InvincibilityPowerUp_000=prefabs.TimerPowerUp({
			Transform = {position={x=644,y=-1.25,z=-100},rotation={x=-90,y=-90,z=0},scale={x=5,y=5,z=5}}}),
		
	},
		SceneConfig=
        {
        PhysicsConfig={
            Gravity = 0
        }
    }
}
return Scene

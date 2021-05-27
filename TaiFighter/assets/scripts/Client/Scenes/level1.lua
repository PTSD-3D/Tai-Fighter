local prefabs = require('Prefab') 
local sceneConfig = require('Prefab') 
local Scene={
 Entities={	BossZone_000=prefabs.BossZone({
		Transform = {position={x=1488.963134765625,y=0.0,z=-102.66244506835938},rotation={x=-0.0,y=450.0001286356067,z=0.0},scale={x=150.0,y=100.0,z=1.1554402112960815}}}),
	Enemy_001=prefabs.Enemy({
		Transform = {position={x=168.55471801757812,y=11.125066757202148,z=-152.66233825683594},rotation={x=-90.00000250447816,y=630.0000926634281,z=-0.0},scale={x=3.0,y=3.0,z=3.0}}}),
	Enemy_002=prefabs.Enemy({
		Transform = {position={x=555.658935546875,y=6.4592061042785645,z=-132.66236877441406},rotation={x=-90.00000250447816,y=630.0000926634281,z=-0.0},scale={x=3.0,y=3.466320514678955,z=3.0}}}),
	Enemy_003=prefabs.Enemy({
		Transform = {position={x=555.658935546875,y=6.4592061042785645,z=-72.66236877441406},rotation={x=-90.00000250447816,y=630.0000926634281,z=-0.0},scale={x=3.0,y=3.466320514678955,z=3.0}}}),
	Enemy_004=prefabs.Enemy({
		Transform = {position={x=66.83597564697266,y=-23.540788650512695,z=-52.662384033203125},rotation={x=-90.00000250447816,y=630.0000926634281,z=-0.0},scale={x=3.0,y=3.0,z=3.0}}}),
	Enemy_005=prefabs.Enemy({
		Transform = {position={x=114.69145202636719,y=-13.108823776245117,z=-152.66233825683594},rotation={x=-90.00000250447816,y=630.0000926634281,z=-0.0},scale={x=3.0,y=3.0,z=3.0}}}),
	Enemy_006=prefabs.Enemy({
		Transform = {position={x=555.1895751953125,y=-23.540788650512695,z=-102.66233825683594},rotation={x=-90.00000250447816,y=630.0000926634281,z=-0.0},scale={x=3.0,y=3.466320514678955,z=3.0}}}),
	Enemy_007=prefabs.Enemy({
		Transform = {position={x=701.2431030273438,y=24.434816360473633,z=-72.66236877441406},rotation={x=-90.00000250447816,y=630.0000926634281,z=-0.0},scale={x=3.0,y=3.466320514678955,z=3.0}}}),
	Enemy_008=prefabs.Enemy({
		Transform = {position={x=701.2431030273438,y=24.434816360473633,z=-132.66236877441406},rotation={x=-90.00000250447816,y=630.0000926634281,z=-0.0},scale={x=3.0,y=3.466320514678955,z=3.0}}}),
	Enemy_009=prefabs.Enemy({
		Transform = {position={x=701.4700927734375,y=-20.376989364624023,z=-72.66236877441406},rotation={x=-90.00000250447816,y=630.0000926634281,z=-0.0},scale={x=3.0,y=3.466320514678955,z=3.0}}}),
	Enemy_010=prefabs.Enemy({
		Transform = {position={x=701.4700927734375,y=-20.376989364624023,z=-132.66236877441406},rotation={x=-90.00000250447816,y=630.0000926634281,z=-0.0},scale={x=3.0,y=3.466320514678955,z=3.0}}}),
	Enemy_011=prefabs.Enemy({
		Transform = {position={x=1108.3726806640625,y=40.08001708984375,z=-100.1165771484375},rotation={x=-90.00000250447816,y=630.0000926634281,z=-0.0},scale={x=3.0,y=3.466320514678955,z=3.0}}}),
	Enemy_012=prefabs.Enemy({
		Transform = {position={x=1108.3726806640625,y=1.3811779022216797,z=-48.28266143798828},rotation={x=-90.00000250447816,y=630.0000926634281,z=-0.0},scale={x=3.0,y=3.466320514678955,z=3.0}}}),
	Enemy_013=prefabs.Enemy({
		Transform = {position={x=1108.3726806640625,y=1.3811779022216797,z=-147.53659057617188},rotation={x=-90.00000250447816,y=630.0000926634281,z=-0.0},scale={x=3.0,y=3.466320514678955,z=3.0}}}),
	Enemy_014=prefabs.Enemy({
		Transform = {position={x=1108.3726806640625,y=-40.119319915771484,z=-121.62266540527344},rotation={x=-90.00000250447816,y=630.0000926634281,z=-0.0},scale={x=3.0,y=3.466320514678955,z=3.0}}}),
	Enemy_015=prefabs.Enemy({
		Transform = {position={x=1108.3726806640625,y=-40.119319915771484,z=-76.00837707519531},rotation={x=-90.00000250447816,y=630.0000926634281,z=-0.0},scale={x=3.0,y=3.466320514678955,z=3.0}}}),
	Enemy_016=prefabs.Enemy({
		Transform = {position={x=1313.5120849609375,y=35.720237731933594,z=-90.96627807617188},rotation={x=-90.00000250447816,y=630.0000926634281,z=-0.0},scale={x=3.0,y=3.466320514678955,z=3.0}}}),
	Enemy_017=prefabs.Enemy({
		Transform = {position={x=1207.2864990234375,y=1.3811779022216797,z=-132.67184448242188},rotation={x=-90.00000250447816,y=630.0000926634281,z=-0.0},scale={x=3.0,y=3.466320514678955,z=3.0}}}),
	Enemy_018=prefabs.Enemy({
		Transform = {position={x=1267.1578369140625,y=-42.00616455078125,z=-72.84510040283203},rotation={x=-90.00000250447816,y=630.0000926634281,z=-0.0},scale={x=3.0,y=3.466320514678955,z=3.0}}}),
	Enemy_019=prefabs.Enemy({
		Transform = {position={x=1267.1578369140625,y=15.195659637451172,z=-172.7259979248047},rotation={x=-90.00000250447816,y=630.0000926634281,z=-0.0},scale={x=3.0,y=3.466320514678955,z=3.0}}}),
	Enemy_020=prefabs.Enemy({
		Transform = {position={x=1377.495849609375,y=7.903898239135742,z=-146.03436279296875},rotation={x=-90.00000250447816,y=630.0000926634281,z=-0.0},scale={x=3.0,y=3.466320514678955,z=3.0}}}),
	Enemy_021=prefabs.Enemy({
		Transform = {position={x=1335.0955810546875,y=-16.974058151245117,z=-70.8070068359375},rotation={x=-90.00000250447816,y=630.0000926634281,z=-0.0},scale={x=3.0,y=3.466320514678955,z=3.0}}}),

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
		Transform = {position={x=971.2281494140625,y=29.693586349487305,z=-132.80662536621094},rotation={x=-90.00000250447816,y=630.0000926634281,z=-0.0},scale={x=3.0,y=3.466320514678955,z=3.0}}}),
	InvincibleEnemy_008=prefabs.InvincibleEnemy({
		Transform = {position={x=971.2281494140625,y=14.398191452026367,z=-115.81166076660156},rotation={x=-90.00000250447816,y=630.0000926634281,z=-0.0},scale={x=3.0,y=3.466320514678955,z=3.0}}}),
	InvincibleEnemy_009=prefabs.InvincibleEnemy({
		Transform = {position={x=971.2281494140625,y=-1.2533397674560547,z=-99.80857849121094},rotation={x=-90.00000250447816,y=630.0000926634281,z=-0.0},scale={x=3.0,y=3.466320514678955,z=3.0}}}),
	InvincibleEnemy_010=prefabs.InvincibleEnemy({
		Transform = {position={x=971.2281494140625,y=-17.5760498046875,z=-84.82369232177734},rotation={x=-90.00000250447816,y=630.0000926634281,z=-0.0},scale={x=3.0,y=3.466320514678955,z=3.0}}}),
	InvincibleEnemy_011=prefabs.InvincibleEnemy({
		Transform = {position={x=971.2281494140625,y=-31.540786743164062,z=-66.87700653076172},rotation={x=-90.00000250447816,y=630.0000926634281,z=-0.0},scale={x=3.0,y=3.466320514678955,z=3.0}}}),
	InvincibleEnemy_012=prefabs.InvincibleEnemy({
		Transform = {position={x=450.89996337890625,y=48.412322998046875,z=-100.68977355957031},rotation={x=-90.00000250447816,y=630.0000926634281,z=-0.0},scale={x=3.0,y=3.0,z=3.0}}}),
	InvincibleEnemy_013=prefabs.InvincibleEnemy({
		Transform = {position={x=450.89996337890625,y=-48.10438919067383,z=-100.68977355957031},rotation={x=-90.00000250447816,y=630.0000926634281,z=-0.0},scale={x=3.0,y=3.0,z=3.0}}}),
	InvincibleEnemy_014=prefabs.InvincibleEnemy({
		Transform = {position={x=971.2281494140625,y=44.68383026123047,z=-153.86856079101562},rotation={x=-90.00000250447816,y=630.0000926634281,z=-0.0},scale={x=3.0,y=3.466320514678955,z=3.0}}}),
	InvincibleEnemy_015=prefabs.InvincibleEnemy({
		Transform = {position={x=971.2281494140625,y=-49.05657196044922,z=-48.33079147338867},rotation={x=-90.00000250447816,y=630.0000926634281,z=-0.0},scale={x=3.0,y=3.466320514678955,z=3.0}}}),
	InvincibleEnemy_016=prefabs.InvincibleEnemy({
		Transform = {position={x=803.6964111328125,y=-3.8752968311309814,z=-132.80662536621094},rotation={x=-90.00000250447816,y=630.0000926634281,z=-0.0},scale={x=3.0,y=3.466320514678955,z=3.0}}}),
	InvincibleEnemy_017=prefabs.InvincibleEnemy({
		Transform = {position={x=835.626953125,y=21.92327308654785,z=-73.76411437988281},rotation={x=-90.00000250447816,y=630.0000926634281,z=-0.0},scale={x=3.0,y=3.466320514678955,z=3.0}}}),
	InvincibleEnemy_018=prefabs.InvincibleEnemy({
		Transform = {position={x=836.9898071289062,y=-26.4056453704834,z=-73.76411437988281},rotation={x=-90.00000250447816,y=630.0000926634281,z=-0.0},scale={x=3.0,y=3.466320514678955,z=3.0}}}),
	MainCamera=prefabs.MainCamera({
		Transform = {position={x=-52.154605865478516,y=-1.6529207229614258,z=7.999999046325684},rotation={x=-90.00000250447816,y=0.0,z=89.999995674289},scale={x=1.0,y=1.0,z=1.0}}}),
	Player=prefabs.Player({
		Transform = {position={x=-53.807525634765625,y=0.0,z=-100.7860107421875},rotation={x=-90.00000250447816,y=90.00000250447816,z=0.0},scale={x=1.0,y=4.599999904632568,z=1.0}}}),
	
	SuperShootPowerUp_000=prefabs.SuperShootPowerUp({
		Transform = {position={x=1108,y=1.0,z=-96},rotation={x=-90,y=-90,z=0},scale={x=3,y=3,z=3}}}),

	InvincibilityPowerUp_000=prefabs.InvincibilityPowerUp({
		Transform = {position={x=352,y=1.25,z=-100},rotation={x=-90,y=-90,z=0},scale={x=1,y=1,z=1}}}),
		
	ExtraHealthPowerUp_000=prefabs.ExtraHealPowerUp({
		Transform = {position={x=1284,y=8.0,z=-118},rotation={x=-90,y=-90,z=0},scale={x=1,y=1,z=1}}}),

	TimerPowerUp_000=prefabs.TimerPowerUp({
		Transform = {position={x=870,y=-1.25,z=-100},rotation={x=-90,y=-90,z=0},scale={x=5,y=5,z=5}}}),

        },
		SceneConfig=
        {
        PhysicsConfig={
            Gravity = 5
        }
    }
}
return Scene

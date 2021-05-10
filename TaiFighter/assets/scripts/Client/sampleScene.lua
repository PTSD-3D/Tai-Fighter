local prefabs = reqPrefab 
local sceneConfig = reqPrefab 
local Scene={
 Entities={	camera=
        {
		Transform = {position={x=1.6529208421707153,y=-1.6529207229614258,z=7.999999046325684},rotation={x=-90.00000250447816,y=0.0,z=89.999995674289},scale={x=1.0,y=1.0,z=1.0}},
            Components= {
            }
        }
        ,
	End=
        {
		Transform = {position={x=400.64349365234375,y=0.0,z=-42.662445068359375},rotation={x=-0.0,y=450.0001286356067,z=0.0},scale={x=150.0,y=100.0,z=1.0}},
            Components= {
            }
        }
        ,
	Enemy_000=prefabs.Enemy({
		Transform = {position={x=300.64349365234375,y=-7.999998569488525,z=-62.662384033203125},rotation={x=-90.00000250447816,y=630.0000926634281,z=-0.0},scale={x=3.0,y=3.0,z=3.0}}}),
	Enemy_001=prefabs.Enemy({
		Transform = {position={x=300.64349365234375,y=-7.999998569488525,z=-22.662384033203125},rotation={x=-90.00000250447816,y=630.0000926634281,z=-0.0},scale={x=3.0,y=3.0,z=3.0}}}),
	Enemy_002=prefabs.Enemy({
		Transform = {position={x=190.64349365234375,y=29.9999942779541,z=-72.66236877441406},rotation={x=-90.00000250447816,y=630.0000926634281,z=-0.0},scale={x=3.0,y=3.0,z=3.0}}}),
	Enemy_003=prefabs.Enemy({
		Transform = {position={x=190.64349365234375,y=29.9999942779541,z=-12.662368774414062},rotation={x=-90.00000250447816,y=630.0000926634281,z=-0.0},scale={x=3.0,y=3.0,z=3.0}}}),
	Enemy_004=prefabs.Enemy({
		Transform = {position={x=120.64350128173828,y=0.0,z=7.337615966796875},rotation={x=-90.00000250447816,y=630.0000926634281,z=-0.0},scale={x=3.0,y=3.0,z=3.0}}}),
	Enemy_005=prefabs.Enemy({
		Transform = {position={x=120.64349365234375,y=0.0,z=-92.66233825683594},rotation={x=-90.00000250447816,y=630.0000926634281,z=-0.0},scale={x=3.0,y=3.0,z=3.0}}}),
	Enemy_006=prefabs.Enemy({
		Transform = {position={x=150.64349365234375,y=0.0,z=-42.66233825683594},rotation={x=-90.00000250447816,y=630.0000926634281,z=-0.0},scale={x=3.0,y=3.0,z=3.0}}}),
	Player=prefabs.Player({
		Transform = {position={x=-0.0,y=0.0,z=-40.7860107421875},rotation={x=-90.00000250447816,y=90.00000250447816,z=0.0},scale={x=1.0,y=4.599999904632568,z=1.0}}})},
		SceneConfig=sceneConfig.sampleScene({})
}
return Scene

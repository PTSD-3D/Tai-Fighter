local prefabs = reqPrefab 
local sceneConfig = reqSceneConfigurations 
local Scene={
 Entities={	End=
        {
		Transform = {position={x=0.0,y=400.0,z=0.0},rotation={x=0.0,y=0.0,z=0.0},scale={x=150.0,y=1.0,z=100.0}}
            Components= {
            }
        }
        ,
	Enemy_000=prefabs.Enemy({
		Transform = {position={x=0.0,y=150.0,z=0.0},rotation={x=0.0,y=0.0,z=0.0},scale={x=3.0,y=3.0,z=3.0}}}),
	Enemy_001=prefabs.Enemy({
		Transform = {position={x=-50.0,y=120.0,z=0.0},rotation={x=0.0,y=0.0,z=0.0},scale={x=3.0,y=3.0,z=3.0}}}),
	Enemy_002=prefabs.Enemy({
		Transform = {position={x=50.0,y=120.0,z=0.0},rotation={x=0.0,y=0.0,z=0.0},scale={x=3.0,y=3.0,z=3.0}}}),
	Enemy_003=prefabs.Enemy({
		Transform = {position={x=30.0,y=190.0,z=30.0},rotation={x=0.0,y=0.0,z=0.0},scale={x=3.0,y=3.0,z=3.0}}}),
	Enemy_004=prefabs.Enemy({
		Transform = {position={x=-30.0,y=190.0,z=30.0},rotation={x=0.0,y=0.0,z=0.0},scale={x=3.0,y=3.0,z=3.0}}}),
	Enemy_005=prefabs.Enemy({
		Transform = {position={x=20.0,y=300.0,z=-8.0},rotation={x=0.0,y=0.0,z=0.0},scale={x=3.0,y=3.0,z=3.0}}}),
	Enemy_006=prefabs.Enemy({
		Transform = {position={x=-20.0,y=300.0,z=-8.0},rotation={x=0.0,y=0.0,z=0.0},scale={x=3.0,y=3.0,z=3.0}}})},
		SceneConfig=sceneConfig.sampleScene({})
}
return Scene

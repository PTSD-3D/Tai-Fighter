local prefabs = reqPrefab 
local sceneConfig = reqSceneConfigurations 
local Scene={
 Entities={	Enemy_000=prefabs.Enemy({
		Transform = {position={x=100.0,y=120.0,z=-50.0},rotation={x=0.0,y=0.0,z=0.0},scale={x=1.0,y=1.0,z=1.0}}}),
	Enemy_001=prefabs.Enemy({
		Transform = {position={x=50.0,y=100.0,z=-50.0},rotation={x=0.0,y=0.0,z=0.0},scale={x=1.0,y=1.0,z=1.0}}}),
	Enemy_002=prefabs.Enemy({
		Transform = {position={x=150.0,y=100.0,z=-50.0},rotation={x=0.0,y=0.0,z=0.0},scale={x=1.0,y=1.0,z=1.0}}}),
	Enemy_003=prefabs.Enemy({
		Transform = {position={x=80.0,y=90.0,z=-100.0},rotation={x=0.0,y=0.0,z=0.0},scale={x=1.0,y=1.0,z=1.0}}}),
	Enemy_004=prefabs.Enemy({
		Transform = {position={x=120.0,y=90.0,z=-100.0},rotation={x=0.0,y=0.0,z=0.0},scale={x=1.0,y=1.0,z=1.0}}})},
		SceneConfig=
        {
        PhysicsConfig={
            Gravity = 0
        }
    }
}
return Scene

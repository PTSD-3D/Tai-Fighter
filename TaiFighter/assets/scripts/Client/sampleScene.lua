local prefabs = reqPrefab
local sceneConfig = reqSceneConfigurations
local Scene = {
	Entities = {
		End = {
			Transform = {
				position = {x = -0.0, y = 0.0, z = -400.0},
				rotation = {x = -0.0, y = 540.0, z = -0.0},
				scale = {x = 150.0, y = 100.0, z = 1.0}
			},
			Components = {}
		},
		Camera = prefabs.MainCamera(),
		Enemy_000 = prefabs.Enemy(
			{
				Transform = {
					position = {x = 0.0, y = 0.0, z = -100},
					rotation = {x = -90.0, y = 90.0, z = -0.0},
					scale = {x = 1.0, y = 4.6, z = 1}
				}
			}
		),

		
		--The scale and positioning of the models is all messed up (bullets were coming out of their right side)
		--This is currently being worked on in another branch, so we see it fit to just comment it
		--so you can all appretiate the god tier rotation animation on this bad boy.

		-- Enemy_001=prefabs.Enemy({
		-- 	Transform = {position={x=20.0,y=-7.999999046325684,z=-300.0},rotation={x=-90.0,y=720.0,z=-0.0},scale={x=3.0,y=3.0,z=3.0}}}),
		-- Enemy_002=prefabs.Enemy({
		-- 	Transform = {position={x=-30.0,y=30.0,z=-190.0},rotation={x=-90.0,y=720.0,z=-0.0},scale={x=3.0,y=3.0,z=3.0}}}),
		-- Enemy_003=prefabs.Enemy({
		-- 	Transform = {position={x=30.0,y=30.0,z=-190.0},rotation={x=-90.0,y=720.0,z=-0.0},scale={x=3.0,y=3.0,z=3.0}}}),
		-- Enemy_004=prefabs.Enemy({
		-- 	Transform = {position={x=50.0,y=0.0,z=-120.0},rotation={x=-90.0,y=720.0,z=-0.0},scale={x=3.0,y=3.0,z=3.0}}}),
		-- Enemy_005=prefabs.Enemy({
		-- 	Transform = {position={x=-50.0,y=0.0,z=-120.0},rotation={x=-90.0,y=720.0,z=-0.0},scale={x=3.0,y=3.0,z=3.0}}}),
		-- Enemy_006=prefabs.Enemy({
		-- 	Transform = {position={x=-0.0,y=0.0,z=-150.0},rotation={x=-90.0,y=720.0,z=-0.0},scale={x=3.0,y=3.0,z=3.0}}})
	},

	SceneConfig = prefabs.sampleScene({})
}
return Scene
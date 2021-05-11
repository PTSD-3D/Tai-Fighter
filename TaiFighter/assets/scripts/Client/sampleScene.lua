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
		Camera = prefabs.MainCamera(
			{

			}
		),
		Enemy_000 = prefabs.Enemy(
			{
				Transform = {
					position = {x = 0.0, y = 0.0, z = -100},
					rotation = {x = -90.0, y = 90.0, z = -0.0},
					scale = {x = 1.0, y = 4.6, z = 1}
				}
			}
		)
	},
	SceneConfig = prefabs.sampleScene({})
}
return Scene

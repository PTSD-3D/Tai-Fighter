local prefabs = require("Prefab")
local Scene={
Entities={
	Camera = prefabs.MainCamera(),
},
SceneConfig=prefabs.sampleScene({})
}
return Scene
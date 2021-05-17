local pf = require("Prefab")

--TODO require
function pf.sampleScene()
	return {
		PhysicsConfig = {
			Gravity = 0
		},
		GraphicsConfig = {
			LockMouse = false,
			Skybox = {
				type = 1, --ns.SkyboxTypes.Skybox
				enable = true,
				material = "Skybox",
				distance = 300
			}
		}
	}
end
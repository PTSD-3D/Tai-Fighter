local pf = require("Prefab")

-- Params holds required parameters to build an instance of this prefab. This will be populated with transform information from Blender via our script in /tools
function pf.PowerUp(params)
	return {
		Components = {
			-- Example user defined components
			{ name = "powerUp", arguments = {0.5} },
			{ name = "variableCollider", arguments = {}}
		},
		Transform = params.Transform,
		Mesh = { mesh = "Heal.mesh", material = "Heal" },
		Rigidbody = {size=params.Transform.scale,mass=1,position=params.Transform.position,type=2,trigger=false,rotation=params.Transform.rotation}
	}
end
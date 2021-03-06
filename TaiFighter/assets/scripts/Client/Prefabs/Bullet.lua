local pf = require("Prefab")

-- Params holds required parameters to build an instance of this prefab. This will be populated with transform information from Blender via our script in /tools
function pf.Bullet(params)
	return {
		Components = {
			-- Example user defined components
			{ name = "bullet", arguments = {1,90,100} },
			{ name = "variableCollider", arguments = {}}
		},
		Transform = params.Transform,
		Mesh = { mesh = "BalaTaifighter.mesh", material = "Bala" },
		Rigidbody = {size=params.Transform.scale,mass=1,position=params.Transform.position,type=2,trigger=true,rotation=params.Transform.rotation}
	}
end

function pf.SuperShot(params)
	return {
		Components = {
			-- Example user defined components
			{ name = "bullet", arguments = {5,180,100} },
			{ name = "variableCollider", arguments = {}}
		},
		Transform = params.Transform,
		Mesh = { mesh = "BalaTaifighter.mesh", material = "BalaSuper" },
		Rigidbody = {size=params.Transform.scale,mass=1,position=params.Transform.position,type=2,trigger=true,rotation=params.Transform.rotation}
	}
end
local pf = require("Prefab")

-- Params holds required parameters to build an instance of this prefab. This will be populated with transform information from Blender via our script in /tools
function pf.Chancla(params)
	return {
		Components = {
			-- Example user defined components
			{ name = "damagePlayer", arguments = {0.5}},
			{ name = "chancla", arguments = {}}
		},
		Transform = params.Transform,
		Mesh = { mesh = "Chancla.mesh", material = "Chancla" },
		--Rigidbody = {size=scale(params.Transform.scale, params.Scale or 1.1),mass=1,position=params.Transform.position,type=2,trigger=true,rotation=params.Transform.rotation}
		Rigidbody = {	size={x=16,y=16,z=160},
									mass=1,position=params.Transform.position,
									type=2,trigger=false,
									rotation=params.Transform.rotation}
	}
end

function pf.ChanclaFake(params)
	return {
		Components = {
			-- Example user defined components
			{ name = "damagePlayer", arguments = {0.5}},
			{ name = "scrollMovement", arguments = {2}}
		},
		Transform = params.Transform,
		Mesh = { mesh = "Chancla.mesh", material = "Chancla" },
		--Rigidbody = {size=scale(params.Transform.scale, params.Scale or 1.1),mass=1,position=params.Transform.position,type=2,trigger=true,rotation=params.Transform.rotation}
		Rigidbody = {	size={x=16,y=16,z=160},
									mass=1,position=params.Transform.position,
									type=2,trigger=false,
									rotation=params.Transform.rotation}
	}
end


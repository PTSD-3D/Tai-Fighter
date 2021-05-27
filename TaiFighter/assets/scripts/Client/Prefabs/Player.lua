local pf = require("Prefab")

local function scale(table, factor)
	return {
		x = table.x * factor,
		y = table.y * factor,
		z = table.z * factor
	}
end

-- Params holds required parameters to build an instance of this prefab. This will be populated with transform information from Blender via our script in /tools
function pf.Player(params)
	return {
		Components = {
			-- Example user defined components
			{ name = "playerMove", arguments = { 30, 30, 30 }},
			{ name = "health", arguments = { 3, false}},
			{ name = "variableCollider", arguments = {}},
			{ name = "superShoot" , arguments = {0}}
			-- { name = "playerMove", arguments = { { x = 1, y = 0, z = 0 } } }
		},
		Transform = params.Transform,
		Mesh = { mesh = "Nave.mesh", material = "body" },
		Rigidbody = {	size=params.Transform.scale,
									mass=1,position=params.Transform.position,
									type=2,trigger=false,
									rotation=params.Transform.rotation}
	}
end
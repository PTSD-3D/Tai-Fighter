local pf = require("Prefab")

local function scale(table, factor)
	return {
		x = table.x * factor,
		y = table.y * factor,
		z = table.z * factor
	}
end

-- Params holds required parameters to build an instance of this prefab. This will be populated with transform information from Blender via our script in /tools
function pf.InvincibleEnemy(params)
	return {
		Components = {
			-- Example user defined components
			{ name = "scrollMovement", arguments = {15}},
			{ name = "damagePlayer", arguments = {0.5}},
			-- { name = "playerMove", arguments = { { x = 1, y = 0, z = 0 } } }
		},
		Transform = params.Transform,
		Mesh = { mesh = "InvincibleEnemy.mesh", material = "InvincibleEnemy" },
		Rigidbody = {	size=scale(params.Transform.scale, params.Scale or 1.1),
									mass=1,position=params.Transform.position,
									type=2,trigger=false,
									rotation=params.Transform.rotation}
	}
end
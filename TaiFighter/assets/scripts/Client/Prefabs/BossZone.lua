local pf = require('Prefab')

-- Params holds required parameters to build an instance of this prefab. This will be populated with transform information from Blender via our script in /tools
function pf.BossZone(params)
	return {
		Components = {
			-- Example user defined components
			{ name = "bosszone",arguments={}},
            { name = "scrollMovement", arguments = {15}}
		},
		Transform = params.Transform,
        Mesh = {mesh="Cube.mesh", material="Green"},
		Rigidbody = {size=params.Transform.scale,mass=1,position=params.Transform.position,type=2,trigger=true,rotation=params.Transform.rotation}
	}
end
local pf = require("Prefab")


-- Params holds required parameters to build an instance of this prefab. This will be populated with transform information from Blender via our script in /tools
function pf.Player(params)
	return {
		Components = {
			-- Example user defined components
			{ name = "playerMove", arguments = { 1, 1, 1 }}, 
			{ name = "boombox", arguments={0.5,false,require("resources").Sounds.PTSD_Anthem,-1}},
			{ name = "health", arguments = { 3, false}}
			-- { name = "playerMove", arguments = { { x = 1, y = 0, z = 0 } } }
		},
		Transform = params.Transform,
		Mesh = { mesh = "Nave.mesh", material = "body" },
		Rigidbody = {size=params.Transform.scale,mass=0,position=params.Transform.position,type=1,trigger=false,rotation=params.Transform.rotation}
	}
end
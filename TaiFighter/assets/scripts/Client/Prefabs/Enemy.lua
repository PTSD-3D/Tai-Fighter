local pf = reqPrefab

-- Params holds required parameters to build an instance of this prefab. This will be populated with transform information from Blender via our script in /tools
function pf.Enemy(params)
	return {
		Components = {
			-- Example user defined components
			{ name = "enemyMove", arguments = {0.5}},
			{ name = "enemyCollision", arguments={}}
		},
		Transform = params.Transform,
		Mesh = { mesh = "Nave.mesh", material = "KirbyMat" },
		Rigidbody = {size=params.Transform.scale,mass=1,position=params.Transform.position,type=2,trigger=false,rotation=params.Transform.rotation}
	}
end
local pf = reqPrefab

-- Params holds required parameters to build an instance of this prefab. This will be populated with transform information from Blender via our script in /tools
function pf.MainCamera(params)
	print "Soy camera\n"
	return {
		Components = {
			-- Example user defined components
			{ name = "MainCamera",arguments = {}}
		},
		Transform = {
			position = {x = -20.0, y = 0, z = -300.0},
			rotation = {x = -90.0, y = 720.0, z = -0.0},
			scale = {x = 1.5, y = 1.5, z = 1.5}
		},
		Mesh = { }
	}
end

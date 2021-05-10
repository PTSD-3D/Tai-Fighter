local pf = reqPrefab

-- Params holds required parameters to build an instance of this prefab. This will be populated with transform information from Blender via our script in /tools
function pf.MainCamera(params)
    print "Soy camera\n"
	return {
		Components = {
			-- Example user defined components
			{ name = "MainCamera", arguments = { }}, 
		},
		Transform = params.Transform,
		Mesh = { }
	}
end
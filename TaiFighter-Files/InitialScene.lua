local Scene={
	Camera=
        {
            Components= {
				{name="position", arguments={100.0,70.0,-100.0}},
				{name="rotation", arguments={0.0,0.0,0.0}},
				{name="scale", arguments={1.0,1.0,1.0}}
            }
        }
        ,
	Enemy_000={
	Components= {
				{name="position", arguments={100.0,120.0,0.0}},
				{name="rotation", arguments={0.0,0.0,0.0}},
				{name="scale", arguments={1.0,1.0,1.0}},
		{name="velocity",arguments={1,1}}
	},
	Mesh={"enemy.mesh"}
}
,
	Enemy_001={
	Components= {
				{name="position", arguments={50.0,100.0,0.0}},
				{name="rotation", arguments={0.0,0.0,0.0}},
				{name="scale", arguments={1.0,1.0,1.0}},
		{name="velocity",arguments={1,1}}
	},
	Mesh={"enemy.mesh"}
}
,
	Enemy_002={
	Components= {
				{name="position", arguments={150.0,100.0,0.0}},
				{name="rotation", arguments={0.0,0.0,0.0}},
				{name="scale", arguments={1.0,1.0,1.0}},
		{name="velocity",arguments={1,1}}
	},
	Mesh={"enemy.mesh"}
}
,
	Player=
        {
            Components= {
				{name="position", arguments={100.0,50.0,0.0}},
				{name="rotation", arguments={0.0,0.0,0.0}},
				{name="scale", arguments={1.0,1.0,1.0}}
            }
        },
		Mesh = {"ogrehead.mesh"}
}
 return Scene

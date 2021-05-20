local pf = require("Prefab")

function pf.HealPowerUp(params)
	return {
		Components = {
			-- Example user defined components
			{ name = "powerUp", arguments = {5, 1}},
			{ name = "scrollMovement", arguments = {0.5}}
		},
		Transform = params.Transform,
		Mesh = { mesh = "Heal.mesh", material = "Heal" },
		Rigidbody = {size=params.Transform.scale,mass=1,position=params.Transform.position,type=2,trigger=false,rotation=params.Transform.rotation}
	}
end

function pf.ExtraHealPowerUp(params)
	return {
		Components = {
			-- Example user defined components
			{ name = "powerUp", arguments = {5, 2}},
			{ name = "scrollMovement", arguments = {0.5}}
		},
		Transform = params.Transform,
		Mesh = { mesh = "Heal.mesh", material = "MaxHeal" },
		Rigidbody = {size=params.Transform.scale,mass=1,position=params.Transform.position,type=2,trigger=false,rotation=params.Transform.rotation}
	}
end

function pf.InvincibilityPowerUp(params)
	return {
		Components = {
			-- Example user defined components
			{ name = "powerUp", arguments = {5, 3}},
			{ name = "scrollMovement", arguments = {0.5}}
		},
		Transform = params.Transform,
		Mesh = { mesh = "Shield.mesh", material = "Shield" },
		Rigidbody = {size=params.Transform.scale,mass=1,position=params.Transform.position,type=2,trigger=false,rotation=params.Transform.rotation}
	}
end

function pf.SuperShootPowerUp(params)
	return {
		Components = {
			-- Example user defined components
			{ name = "powerUp", arguments = {5, 4}},
			{ name = "scrollMovement", arguments = {0.5}}
		},
		Transform = params.Transform,
		Mesh = { mesh = "BulletPowerUp.mesh", material = "BulletMaterial3" },
		Rigidbody = {size=params.Transform.scale,mass=1,position=params.Transform.position,type=2,trigger=false,rotation=params.Transform.rotation}
	}
end

function pf.TimerPowerUp(params)
	return {
		Components = {
			-- Example user defined components
			{ name = "powerUp", arguments = {5, 5}},
			{ name = "scrollMovement", arguments = {0.5}}
		},
		Transform = params.Transform,
		Mesh = { mesh = "3D.mesh", material = "3DMaterial" },
		Rigidbody = {size=params.Transform.scale,mass=1,position=params.Transform.position,type=2,trigger=false,rotation=params.Transform.rotation}
	}
end
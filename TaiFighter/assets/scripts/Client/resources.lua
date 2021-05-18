local SoundType = {
	Sonido = 0,
	Musica = 1
}

local SoundChannel = {
	Ambiente = 0,
	Dialogo = 1,
	General = 2
}

local Resources = {
	PATHS = {
		Sound = "./assets/sounds/"
	},
	Sounds = {
		Oof = {
			path = "oof.mp3", id, tipo=SoundType.Sonido, soundChannel=SoundChannel.Dialogo, volume = 0.5
		},
		PTSD_Anthem = {
			path = "PTSD-Anthem.mp3", id, tipo = SoundType.Musica, volume = 0.3
		},		
		Clowning = {
			path = "clowning-around.mp3", id, tipo=SoundType.Musica, volume = 0.3
		},
		--Sonidos nuevos
		ChangeView = {
			path = "ChangeView.wav", id, tipo=SoundType.Sonido, soundChannel=SoundChannel.Dialogo, volume = 0.3
		},
		Damage = {
			path = "Damage.wav", id, tipo=SoundType.Sonido, soundChannel=SoundChannel.Dialogo, volume = 0.3
		},
		EnemyDeath = {
			path = "EnemyDeath.wav", id, tipo=SoundType.Sonido, soundChannel=SoundChannel.Dialogo, volume = 0.3
		},
		EnemyShoot = {
			path = "EnemyShoot.wav", id, tipo=SoundType.Sonido, soundChannel=SoundChannel.Dialogo, volume = 0.3
		},
		GetPowerUp = {
			path = "GetPowerUp.wav", id, tipo=SoundType.Sonido, soundChannel=SoundChannel.Dialogo, volume = 0.3
		},
		GoBack = {
			path = "GoBack.wav", id, tipo=SoundType.Sonido, soundChannel=SoundChannel.Dialogo, volume = 0.3
		},
		GoPause = {
			path = "GoPause.wav", id, tipo=SoundType.Sonido, soundChannel=SoundChannel.Dialogo, volume = 0.3
		},
		Healing = {
			path = "Healing.wav", id, tipo=SoundType.Sonido, soundChannel=SoundChannel.Dialogo, volume = 0.3
		},
		HugeShoot = {
			path = "HugeShoot.wav", id, tipo=SoundType.Sonido, soundChannel=SoundChannel.Dialogo, volume = 0.3
		},
		ImpactNoDamage = {
			path = "ImpactNoDamage.wav", id, tipo=SoundType.Sonido, soundChannel=SoundChannel.Dialogo, volume = 0.3
		},
		Kaboom = {
			path = "Kaboom.wav", id, tipo=SoundType.Sonido, soundChannel=SoundChannel.Dialogo, volume = 0.3
		},
		MenuMove = {
			path = "MenuMove.wav", id, tipo=SoundType.Sonido, soundChannel=SoundChannel.Dialogo, volume = 0.3
		},
		PlayerExplodes = {
			path = "PlayerExplodes.wav", id, tipo=SoundType.Sonido, soundChannel=SoundChannel.Dialogo, volume = 0.3
		},
		PlayerMakeDamage = {
			path = "PlayerMakeDamage.wav", id, tipo=SoundType.Sonido, soundChannel=SoundChannel.Dialogo, volume = 0.3
		},
		PressButton = {
			path = "PressButton.wav", id, tipo=SoundType.Sonido, soundChannel=SoundChannel.Dialogo, volume = 0.3
		},
		Shoot = {
			path = "Shoot.wav", id, tipo=SoundType.Sonido, soundChannel=SoundChannel.Dialogo, volume = 0.3
		},

		--Muscica para el juego
		MainMenuTheme = {
			path = "MainMenuTheme.wav", id, tipo=SoundType.Musica, volume = 0.05
		},
		LevelTheme = {
			path = "LevelTheme.wav", id, tipo=SoundType.Musica, volume = 0.05
		},
		BossFight = {
			path = "BossFight.wav", id, tipo=SoundType.Musica, volume = 0.05
		},
	},
	UISchemes = {
		TaharezLookScheme = {
			path = "TaharezLook.scheme", type=UIFileType.Scheme
		}
	},
	UILayouts = {	
		TaiFighterLayout = {
			path = "TaiFighter.layout", type=UIFileType.Layout
		},
		PauseLayout = {
			path = "Pause.layout", type=UIFileType.Layout
		},
		TitleLayout = {
			path = "Title.layout", type=UIFileType.Layout
		}
	},
	Meshes = {
		--si
	}
}
return Resources
--Main menu UI

function CreateMainMenuUIButtons()
	createButton("PlayButton", "Play", "TaifighterLook/Button", "LemonMilk-41", vec2:new(0.35, 0.43), vec2:new(0.3, 0.12))
	setButtonFunction("PlayButton","PlayCallback")

	createButton("SettingsButton", "Settings", "TaifighterLook/Button", "LemonMilk-41", vec2:new(0.35, 0.60), vec2:new(0.3, 0.12))
	setButtonFunction("SettingsButton","SwitchToSettingsMenu")

	createButton("ExitButton", "Exit", "TaifighterLook/Button", "LemonMilk-41", vec2:new(0.35, 0.77), vec2:new(0.3, 0.12))
	setButtonFunction("ExitButton","ExitCallback")
end

function ShowMainMenuUI()
	setWindowVisible("TaiFighterMainMenuWindow",true)

	setWindowVisible("PlayButton", true)
	setWindowVisible("SettingsButton", true)
	setWindowVisible("ExitButton", true)

	changeText("Title","TaiFighter")

	setUIMouseCursorVisible(true);
end

function HideMainMenuUI()
	setWindowVisible("TaiFighterMainMenuWindow",false)

	setWindowVisible("SettingsButton", false)
	setWindowVisible("ExitButton", false)
	setWindowVisible("PlayButton", false)
end

function PlayCallback()
	LOG("Get into the game")

	HideMainMenuUI()
	--showTaiFighterUI()
	Manager:changeScene('level1')
end

--Settings UI

function CreateSettingsUI()

end

function ShowSettingsUI()

end

function HideSettingsUI()

end

--Death UI

function createDeathUI()
	createButton("RetryButton", "Retry", "TaharezLook/Button","DejaVuSans-12",vec2:new(.45, .5), vec2:new(.1, .05))
	setButtonFunction("RetryButton","RetryCallback")

	createButton("ReturnMenuButton","Return to menu", "TaharezLook/Button","DejaVuSans-12",vec2:new(.45, .7), vec2:new(.1, .05))
	setButtonFunction("ReturnMenuButton","ReturnMenuCallback")

	hideDeathUI()
end

function showDeathUI()
	setWindowVisible("ReturnMenuButton", true)
	setWindowVisible("RetryButton", true)
end

function hideDeathUI()
	setWindowVisible("ReturnMenuButton", false)
	setWindowVisible("RetryButton", false)
end

--Game UI

function showTaiFighterUI()
	setWindowVisible("TaiFighterWindow", true)
	setWindowVisible("PauseWindow", false)
	setWindowVisible("TaiFighterMainMenuWindow",false)

	
	setWindowVisible("PushButton", false)
	setWindowVisible("ExitButton", false)
	setWindowVisible("PlayButton", false)

	changeText("Title","Payum")
	setProgressBarValue("DimensionBar", 0.2);

	setUIMouseCursorVisible(false);
end

--Pause UI

function CreatePauseUI()
	createButton("ContinueButtonPause", "Continue", "TaifighterLook/Button", "LemonMilk-41", vec2:new(0.35, 0.4), vec2:new(0.3, 0.12))
	setButtonFunction("ContinueButtonPause","ContinueFromPause")

	createButton("MainMenuButtonPause", "Main menu", "TaifighterLook/Button", "LemonMilk-41", vec2:new(0.35, 0.57), vec2:new(0.3, 0.12))
	setButtonFunction("MainMenuButtonPause","ReturnMenuCallback")

	createButton("ExitButtonPause", "Exit", "TaifighterLook/Button", "LemonMilk-41", vec2:new(0.35, 0.74), vec2:new(0.3, 0.12))
	setButtonFunction("ExitButtonPause","ExitCallback")

	HidePauseUI()
end

function ShowPauseUI()
	setWindowVisible("PauseWindow", true)

	setWindowVisible("ContinueButtonPause", true)
	setWindowVisible("MainMenuButtonPause", true)
	setWindowVisible("ExitButtonPause", true)

	setUIMouseCursorVisible(true);
end

function HidePauseUI()
	setWindowVisible("PauseWindow", false)

	setWindowVisible("ContinueButtonPause", false)
	setWindowVisible("MainMenuButtonPause", false)
	setWindowVisible("ExitButtonPause", false)
end

function ContinueFromPause()
	HidePauseUI()
	--ShowGameUI()
end

--General callbacks

function ExitCallback()
	ExitGame()
end

function ReturnMenuCallback()
	hideDeathUI()
	HidePauseUI()
	ShowMainMenuUI()
	Manager:changeScene('MainMenuScene')
end

function RetryCallback()
	hideDeathUI()
	Manager:changeScene(Manager:getCurrentSceneName())
end

function SwitchToSettingsMenu()
	HideMainMenuUI()
	ShowSettingsUI()
end

function CreateUIs()
	createDeathUI()
	CreateMainMenuUIButtons()
	CreateSettingsUI()
	CreatePauseUI()
end
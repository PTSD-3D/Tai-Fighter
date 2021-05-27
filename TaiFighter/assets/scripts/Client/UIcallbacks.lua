--Main menu UI

function CreateMainMenuUIButtons()
	createButton("PlayButton", "Play", "TaifighterLook/Button", "LemonMilk-41", vec2:new(0.35, 0.5), vec2:new(0.3, 0.15))
	setButtonFunction("PlayButton","PlayCallback")

	--createButton("SettingsButton", "Settings", "TaifighterLook/Button", "LemonMilk-41", vec2:new(0.35, 0.60), vec2:new(0.3, 0.12))
	--setButtonFunction("SettingsButton","SwitchToSettingsMenu")

	createButton("ExitButton", "Exit", "TaifighterLook/Button", "LemonMilk-41", vec2:new(0.35, 0.7), vec2:new(0.3, 0.15))
	setButtonFunction("ExitButton","ExitCallback")
end

function ShowMainMenuUI()
	setWindowVisible("TaiFighterMainMenuWindow",true)

	setWindowVisible("PlayButton", true)
	--setWindowVisible("SettingsButton", true)
	setWindowVisible("ExitButton", true)

	changeText("Title","TaiFighter")

	setUIMouseCursorVisible(true);
end

function HideMainMenuUI()
	setWindowVisible("TaiFighterMainMenuWindow",false)

	--setWindowVisible("SettingsButton", false)
	setWindowVisible("ExitButton", false)
	setWindowVisible("PlayButton", false)
end

function PlayCallback()
	LOG("Get into the game")

	HideMainMenuUI()
	Manager:changeScene('level1Done')
	ShowTaiFighterUI()
end

--Death UI

function CreateDeathUI()
	createButton("RetryButton", "Retry", "TaifighterLook/Button", "LemonMilk-41", vec2:new(0.25, 0.60), vec2:new(0.5, 0.12))
	setButtonFunction("RetryButton","RetryCallback")

	createButton("ReturnMenuButton","Return to menu", "TaifighterLook/Button", "LemonMilk-41", vec2:new(0.25, 0.77), vec2:new(0.5, 0.12))
	setButtonFunction("ReturnMenuButton","ReturnMenuCallback")

	HideDeathUI()
end

function ShowDeathUI()
	setWindowVisible("RetryButton", true)
	setWindowVisible("ReturnMenuButton", true)
end

function HideDeathUI()
	setWindowVisible("ReturnMenuButton", false)
	setWindowVisible("RetryButton", false)
end

--Game UI

function ShowTaiFighterUI()
	setWindowVisible("TaiFighterWindow", true)
	
	setWindowVisible("ExtraLife",false)

	setProgressBarValue("DimensionBar", 0.2);

	setUIMouseCursorVisible(false);
end

function UpdateGameUI(lives)
	setWindowVisible("Life0",lives>0 and true or false) --Ternary operator
	setWindowVisible("Life1",lives>1 and true or false)
	setWindowVisible("Life2",lives>2 and true or false)
	setWindowVisible("ExtraLife",lives>3 and true or false)
end

function HideTaiFighterUI()
	setWindowVisible("TaiFighterWindow",false)
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
	Manager.eventManager:fireEvent(require('namespace').ResumeGameEv())
end

--General callbacks

function ExitCallback()
	ExitGame()
end

function ReturnMenuCallback()
	HideDeathUI()
	HidePauseUI()
	HideTaiFighterUI()
	ShowMainMenuUI()
	Manager:changeScene('MainMenuScene')
end

function RetryCallback()
	HideDeathUI()
	Manager:changeScene(Manager:getCurrentSceneName())
end

function SwitchToSettingsMenu()
	HideMainMenuUI()
	ShowSettingsUI()
end

function CreateUIs()
	CreateDeathUI()
	CreateMainMenuUIButtons()
	--CreateSettingsUI()
	CreatePauseUI()
end
local resources = require('resources')

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

function showMainMenuUI()
	setWindowVisible("TaiFighterWindow", false)
	setWindowVisible("PauseWindow", false)
	setWindowVisible("TaiFighterMainMenuWindow",true)

	setWindowVisible("PushButton", false)
	setWindowVisible("ExitButton", false)
	setWindowVisible("PlayButton", true)

	changeText("Title","TaiFighter")

	setUIMouseCursorVisible(true);
end

function showPauseUI()
	setWindowVisible("TaiFighterWindow", false)
	setWindowVisible("TaiFighterMainMenuWindow",false)
	setWindowVisible("PauseWindow", true)

	setWindowVisible("PushButton", true)
	setWindowVisible("ExitButton", true)
	setWindowVisible("PlayButton", false)

	changeText("Title","TaiFighter")

	setUIMouseCursorVisible(true);
end

function exitCallback()
	LOG("EXIT place holder")
end

function PlayCallback()
	LOG("Get into the game")

	showTaiFighterUI()
	Manager:changeScene('bosslevel')
	print(resources.Sounds.BossFight.id)
	playMusic(resources.Sounds.BossFight.id,false)
end

function ReturnMenuCallback()
	hideDeathUI()
	showMainMenuUI()
	Manager:changeScene('MainMenuScene')
end

function RetryCallback()
	hideDeathUI()
	Manager:changeScene(Manager:getCurrentSceneName())
end
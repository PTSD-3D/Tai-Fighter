function showTaiFighterUI()
	setWindowVisible("TaiFighterWindow", true)
	setWindowVisible("PauseWindow", false)
	
	setWindowVisible("PushButton", false)
	setWindowVisible("ExitButton", false)
	setWindowVisible("PlayButton", false)

	changeText("Title","Payum")

	setUIMouseCursorVisible(false);
end

function showMainMenuUI()
	setWindowVisible("TaiFighterWindow", false)
	setWindowVisible("PauseWindow", false)

	setWindowVisible("PushButton", false)
	setWindowVisible("ExitButton", false)
	setWindowVisible("PlayButton", true)

	changeText("Title","TaiFighter")

	setUIMouseCursorVisible(true);
end

function showPauseUI()
	setWindowVisible("TaiFighterWindow", false)
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

function playCallback()
	LOG("PLAY placeholder")
	showTaiFighterUI()
end
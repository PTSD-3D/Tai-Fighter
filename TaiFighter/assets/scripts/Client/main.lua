local ns = require('namespace')



local status, ret = pcall(ns.loadScene, Manager, require('MainMenuScene'))
if status then
	LOG("Scene loaded correctly")
else
	local message = tostring("Fatal error loading scene: " .. ret)
	LOG(message, LogLevel.Error, 1)
end
-- Showing component Added event working
--local ents = Manager:getEntitiesWithComponent("playerMove")
--if ents ~= {} then ents[1]:add(ns.Component.all["topo"]()) end

--UI setup
setUIMouseCursor("TaifighterLook/MouseLook")
setUIMouseCursorVisible(false)

-- showTaiFighterUI()
-- showPauseUI()
createDeathUI()
CreateMainMenuUIButtons()
ShowMainMenuUI()

LOG("main.lua completed")
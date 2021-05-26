local ns = require('namespace')

local EndSystem = ns.class("EndSystem",ns.System)

function EndSystem:requires() return {"endzone"} end

function EndSystem:initialize()
	ns.System.initialize(self)
    LOG("Endsys init")
end

function EndSystem:onCollision(_,other,_)
    if(other:has("playerMove")) then
		Manager:changeScene('MainMenuScene')
		HideTaiFighterUI()
		ShowMainMenuUI()
	end
end

Manager:addSystem(EndSystem())
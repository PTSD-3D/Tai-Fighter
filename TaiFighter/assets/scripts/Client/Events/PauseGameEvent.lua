local ns = require("namespace")

ns.PauseGameEv = ns.class("PauseGameEv")

function ns.PerspectiveChangeEnd:initialize()
	LOG("Firing Pause game event")
end
local ns = require("namespace")

ns.PlayerDeathEv = ns.class("PlayerDeathEv")

function ns.PerspectiveChangeEnd:initialize()
	LOG("Firing PlayerDeathEv")
end
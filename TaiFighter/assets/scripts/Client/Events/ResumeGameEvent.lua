local ns = require("namespace")

ns.ResumeGameEv = ns.class("ResumeGameEv")

function ns.PerspectiveChangeEnd:initialize()
	LOG("Firing resume game event")
end
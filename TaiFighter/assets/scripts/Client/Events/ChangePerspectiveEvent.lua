local ns = require("namespace")

ns.changePerspectiveEvent = ns.class("changePerspectiveEvent")

function ns.changePerspectiveEvent:initialize(sideview)
	self.sideview = sideview
	LOG("Firing ChangedPerspectiveEvent")
end
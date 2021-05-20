local ns = require("namespace")

ns.Add3DTimeEvent = ns.class("Add3DTimeEvent")

function ns.Add3DTimeEvent:initialize(time)
	self.time = time
end
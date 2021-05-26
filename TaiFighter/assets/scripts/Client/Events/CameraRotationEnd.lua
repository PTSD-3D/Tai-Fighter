local ns = require("namespace")

ns.CameraRotationEnd = ns.class("CameraRotationEnd")

function ns.CameraRotationEnd:initialize(camPos)
	self.camPos = camPos
	LOG("Firing CameraRotationEnd")
end
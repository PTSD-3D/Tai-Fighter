local ns = require('namespace')

local PerspectiveTimerSystem = ns.class("PerspectiveTimerSystem",ns.System)

--function BulletSystem:requires() return {"bullet"} end
local timeElapsed = 0.0
local maxTimeIn3D = 500.0
local in3DMode= false

function PerspectiveTimerSystem:initialize()
	LOG("aqui")
	ns.System.initialize(self)
	Manager.eventManager:addListener("changePerspectiveEvent", self, self.setPerspective)
end

function PerspectiveTimerSystem:setPerspective()
	in3DMode = not in3DMode
end

function PerspectiveTimerSystem:update(dt)
	--Esto se hace si el jugador está en modo 3D
	if in3DMode then
		timeElapsed = timeElapsed + dt	--Contamos el tiempo que lleva en modo3D
	end

	if timeElapsed >= maxTimeIn3D then
		Manager.eventManager:fireEvent(ns.PerspectiveChangeEnd())
		LOG("Evento disparado")
		timeElapsed = 0.0
	end
end

Manager:addSystem(PerspectiveTimerSystem())
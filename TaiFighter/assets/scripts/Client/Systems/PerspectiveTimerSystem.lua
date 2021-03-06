local ns = require('namespace')

local PerspectiveTimerSystem = ns.class("PerspectiveTimerSystem",ns.System)

local maxTimeIn3D = 500.0 --Arround 16 seconds from full to empty
local timeLeft = 500.0
local progressBarPercentage = 0.0

local in3DMode= false

function PerspectiveTimerSystem:initialize()
	ns.System.initialize(self)
	Manager.eventManager:addListener("changePerspectiveEvent", self, self.setPerspective)
	Manager.eventManager:addListener("Add3DTimeEvent", self, self.addTime)
end

function PerspectiveTimerSystem:setPerspective(event)
	in3DMode = not event.sideview	--Changes the local state wich is synchronized with MoveSystem.sideview
end

function PerspectiveTimerSystem:addTime(event)
	timeLeft = timeLeft + event.time
	if(timeLeft > maxTimeIn3D) then timeLeft = maxTimeIn3D end
	LOG("Recuperaste " .. event.time .. " frames de barra 3D ahora tienes " .. timeLeft)
end

function PerspectiveTimerSystem:update(dt)
	if in3DMode then
		timeLeft = timeLeft - dt*30	--In 3D mode the bar is consumed

		--If we go below 0.0 the value is clamp to prevent errors
		if timeLeft < 0.0 then
			timeLeft = 0.0
		end

	elseif not in3DMode and timeLeft < maxTimeIn3D then
		timeLeft = timeLeft + dt*15	--Regenerates the bar half speed we use it (May require balance)

		--If we go above maxTimeIn3D the value is clamp to prevent giving extra time
		if timeLeft > maxTimeIn3D then
			timeLeft = maxTimeIn3D
		end
	end

	progressBarPercentage = timeLeft / maxTimeIn3D
	setProgressBarValue("DimensionBar", progressBarPercentage)

	if timeLeft <= 0.0 then	--If we depleated the 3Dbar we fire the PerspectiveChangeEnd to notify it
		Manager.eventManager:fireEvent(ns.PerspectiveChangeEnd())
		LOG("Out of juice for 3D mode")
		--timeLeft = maxTimeIn3D	auto regenerates the full bar
	end
end

Manager:addSystem(PerspectiveTimerSystem())
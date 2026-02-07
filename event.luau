local Event = {}

local EVENT_MARKER = {}

local eventMeta = {
	__tostring = function(self)
		return ("Event(%s)"):format(self.name)
	end,
}

setmetatable(Event, {
	__index = function(_, eventName)
		local ev = {
			__type = EVENT_MARKER,
			name = eventName,
		}

		setmetatable(ev, eventMeta)
		Event[eventName] = ev
		return ev
	end,
})

function Event.isEvent(value)
	return type(value) == "table" and value.__type == EVENT_MARKER
end

return Event

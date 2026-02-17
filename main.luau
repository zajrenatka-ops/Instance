local m = {}

local event = require(script.Event)
local debugmode = false

local print = function(...)
	if debugmode then
		print(`[Instance]:`, ...)
	end
end
local warn = function(...)
	if debugmode then
		warn(`[Instance]:`, ...)
	end
end

m.Event = event

function m.props(object:Object, props:any)
	for key, value in pairs(props) do
		if event.isEvent(key) then
			
			if key.name == `OnServerInvoke` then
				object.OnServerInvoke = value
			else
				object[key.name]:Connect(function(...)
					value(object, ...)
				end)
			end

		else
			object[key] = value
		end
	end
end

local function instancechildren(parentto:any, children:any)
	for _, child in pairs(children) do
		if typeof(child) == `Instance` then
			child.Parent = parentto
		elseif type(child) == `table` then
			instancechildren(parentto, child)
		end
	end
end

function m.new(objectname:string, props:any, childs:any)
	print(objectname, props, childs)
	
	if typeof(props) ~= `table` then
		warn(`Второй аргумент не table.`)
		props = {}
	end
	
	if typeof(childs) ~= `table` then
		warn(`Третий аргумент не table.`)
		childs = {}
	end
	
	if m.isobjectexists(objectname) == false then
		error(`Объект с именем {objectname} не существует.`, 2)
		return
	end
	
	local instance = Instance.new(objectname)
	m.props(instance, props)
	
	instancechildren(instance, childs)
	
	return instance
end

function m.guibase(basename:string, props:any, childs:any)
	local base = m.new(basename, props, childs)
	base.IgnoreGuiInset = true
	base.ResetOnSpawn = false
	base.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	
	return base
end

function m.isobjectexists(objectname:string)
	local success, error = pcall(function()
		return Instance.new(objectname)
	end)
	
	return success
end

function m.ispropertyexists(object:Object, propname:string)
	local success, error = pcall(function()
		local a = object[propname]
	end)
	
	return success
end

function m.guiobject(basename:string, props:any, childs:any)
	local object = m.new(basename, props, childs)
	if m.ispropertyexists(object, `BorderSizePixel`) then
		object.BorderSizePixel = 0
	end
	
	return object
end

return m

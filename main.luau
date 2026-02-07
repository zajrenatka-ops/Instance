local m = {}
local event = require(script.Event)

local values = script.Parent:WaitForChild(`Values`)

local print = function(...)
	if values.DebugMode.Value == true then
		print(`[AdminPanel/Instance]:`, ...)
	end
end
local warn = function(...)
	if values.DebugMode.Value == true then
		warn(`[AdminPanel/Instance]:`, ...)
	end
end

m.Event = event

function m.props(object:Object, props:any)
	for key, value in pairs(props) do
		if event.isEvent(key) then
			print(key.name)
			if object[key.name] then
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
	if m.isobjectexists(objectname) == false then
		error(`Объект с именем {objectname} не существует.`, 2)
		return
	end
	
	local instance = Instance.new(objectname)
	m.props(instance, props)
	
	instancechildren(instance, childs or {})
	
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

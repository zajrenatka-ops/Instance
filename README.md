# ⚒️ Instance | Копия Roact/React от Ренатки

# Причина создания:
* Я чертвоски ненавижу React и Roact. Мне не сдались ваши *mount* и *unmount*, мне нужен *Instance* и точка.
* Я так и не смог разобраться в Roact и React так что это чудо вышло на свет

# Как работает этот чудо модуль:
* Первый параметр это объект который ты хочешь создать.
* Второй параметр это table со свойствами объекта который ты хочешь изменить
* Третий параметр это table с объектами которые будут помещены в объект из первого параметра.


# Пример кода:
```lua
local Instance = require(game:GetService(`ReplicatedStorage`).Instance)

local mainGui = Instance.guibase(`ScreenGui`, {
	Parent = script.Parent,
	Name = `MainGui`,
},{
	{
		idk = Instance.new(`TextButton`, {
			Size = UDim2.fromScale(.5,.5),
			Text = `Clip It`,
			[Instance.Event.MouseButton1Click] = function(self)
				self.Text = `Clipped`
				print(`АОАОАО КЛИПНУТО`)
			end,
		},{
			idk2 = Instance.new(`TextButton`, {
				Size = UDim2.fromScale(.5,.5),
				Text = `Clip It 2`,
				[Instance.Event.MouseButton1Click] = function(self)
					self.Text = `Clipped`
					print(`АОАОАО КЛИПНУТО 2`)
				end,
			})
		})
	}
})
```

знайте что я не умею оформлять readme хд

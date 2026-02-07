# ⚒️ Instance | Копия Roact/React от Ренатки

Причина создания: Я чертвоски ненавижу React и Roact. Мне не сдались ваши *mount* и *unmount*, мне нужен *Instance* и точка.

# Как работает этот чудо модуль:
* Первый параметр это объект который ты хочешь создать.
* Второй параметр это table со свойствами объекта который ты хочешь изменить.
* Третий параметр это table с объектами которые будут помещены в объект из первого параметра.
* Есть Instance.Event для обработки ивентов, например MouseButton1Click


# Пример кода:
```lua
local Instance = require(129028739508373)

local TestPart:Part = Instance.new(`Part`, {
	Name = `TestPart`,
	Size = Vector3.new(15,15,15),
	Position = Vector3.new(0,0,0),
	Parent = workspace
},{
	{
		TestPart2 = Instance.new(`Part`, {
			Name = `TestPart2`,
			Size = Vector3.new(15,15,15),
			Position = Vector3.new(0,0,0),
			Parent = workspace,
			[Instance.Event.Touched] = function(self, hit)
				local Player = game.Players:GetPlayerFromCharacter(hit.Parent)
				
				if Player then
					print(`{Player.Name} дотронулся до {self.Name}`)
				end
			end,
		})
	}
})
```

знайте что я не умею оформлять readme хд

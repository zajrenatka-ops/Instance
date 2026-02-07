# i am vibe coder btw| ВАЙБ КОДИНГ КРУГЛЫЙ ГОД
code example | пример кода:

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
знайте что я не умею оформлять readme

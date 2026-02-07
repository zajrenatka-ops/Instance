# i am vibe coder btw
code example:
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

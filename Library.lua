local WindowTable = {}

function WindowTable:CreateWindow()
	
	-- Gui to Lua
	-- Version: 3.2

	-- Instances:

	local Main = Instance.new("ScreenGui")
	local MainFrame = Instance.new("Frame")
	local TopBar = Instance.new("Frame")
	local HubName = Instance.new("TextLabel")
	local ContentContainer = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local Pages = Instance.new("Folder")
	local mainCorner = Instance.new("UICorner")
	local Navigation = Instance.new("Frame")
	local UICorner_2 = Instance.new("UICorner")
	local TabHolder = Instance.new("ScrollingFrame")
	local UIPadding = Instance.new("UIPadding")
	local UIListLayout_2 = Instance.new("UIListLayout")
	local TabButton = Instance.new("TextLabel")

	--Properties:

	Main.Name = "Main"
	Main.Parent = game.CoreGui
	Main.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	MainFrame.Name = "MainFrame"
	MainFrame.Parent = Main
	MainFrame.BackgroundColor3 = Color3.fromRGB(56, 56, 56)
	MainFrame.Position = UDim2.new(0.261538476, 0, 0.207317069, 0)
	MainFrame.Size = UDim2.new(0, 583, 0, 372)

	TopBar.Name = "TopBar"
	TopBar.Parent = MainFrame
	TopBar.BackgroundColor3 = Color3.fromRGB(189, 255, 161)
	TopBar.BorderSizePixel = 0
	TopBar.Position = UDim2.new(0, 0, 0.0806451589, 0)
	TopBar.Size = UDim2.new(0, 583, 0, 2)

	HubName.Name = "HubName"
	HubName.Parent = TopBar
	HubName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	HubName.BackgroundTransparency = 1.000
	HubName.Position = UDim2.new(0, 0, -15, 0)
	HubName.Size = UDim2.new(0, 120, 0, 30)
	HubName.Font = Enum.Font.FredokaOne
	HubName.Text = "Hub Name"
	HubName.TextColor3 = Color3.fromRGB(255, 255, 255)
	HubName.TextSize = 14.000

	ContentContainer.Name = "ContentContainer"
	ContentContainer.Parent = MainFrame
	ContentContainer.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
	ContentContainer.Position = UDim2.new(0.224528298, 0, 0.107526883, 0)
	ContentContainer.Size = UDim2.new(0.759000003, 0, 0.870967805, 0)

	UICorner.CornerRadius = UDim.new(0, 4)
	UICorner.Parent = ContentContainer

	Pages.Name = "Pages"
	Pages.Parent = ContentContainer


	mainCorner.CornerRadius = UDim.new(0, 4)
	mainCorner.Name = "mainCorner"
	mainCorner.Parent = MainFrame

	Navigation.Name = "Navigation"
	Navigation.Parent = MainFrame
	Navigation.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
	Navigation.Position = UDim2.new(0.0172714088, 0, 0.107526883, 0)
	Navigation.Size = UDim2.new(0, 118, 0, 324)

	UICorner_2.CornerRadius = UDim.new(0, 4)
	UICorner_2.Parent = Navigation

	TabHolder.Name = "TabHolder"
	TabHolder.Parent = Navigation
	TabHolder.Active = true
	TabHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TabHolder.BackgroundTransparency = 1.000
	TabHolder.BorderSizePixel = 0
	TabHolder.Size = UDim2.new(0, 118, 0, 324)
	TabHolder.ScrollBarThickness = 4

	UIPadding.Parent = TabHolder
	UIPadding.PaddingBottom = UDim.new(0, 8)
	UIPadding.PaddingLeft = UDim.new(0, 8)
	UIPadding.PaddingTop = UDim.new(0, 8)

	UIListLayout_2.Parent = TabHolder
	UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout_2.Padding = UDim.new(0, 1)


	
	local TabHandler = {}
	
	function TabHandler:CreateTab(tabname)
		tabname = tabname or "New Tab"
		
		local TabButton = Instance.new("TextButton")
		local newPage = Instance.new("ScrollingFrame")
		local UIListLayout = Instance.new("UIListLayout")
		
		TabButton.Name = "TabButton"
		TabButton.Parent = TabHolder
		TabButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TabButton.BackgroundTransparency = 1.000
		TabButton.Position = UDim2.new(0.0853324682, 0, 0, 0)
		TabButton.Size = UDim2.new(0, 100, 0, 28)
		TabButton.Font = Enum.Font.FredokaOne
		TabButton.Text = "Button"
		TabButton.TextColor3 = Color3.fromRGB(189, 255, 161)
		TabButton.TextSize = 14.000
		
		newPage.Name = "newPage"
		newPage.Parent = ContentContainer
		newPage.Active = true
		newPage.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
		newPage.BorderSizePixel = 0
		newPage.Position = UDim2.new(0, 0, 4.70950248e-08, 0)
		newPage.Size = UDim2.new(0, 442, 0, 324)
		newPage.ScrollBarThickness = 4
		
		UIListLayout.Parent = newPage
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout.Padding = UDim.new(0, 5)
		
		TabButton.MouseButton1Click:Connect(function()
			for i,v in next, Pages	:GetChildren() do -- We get all the pages that we added
				v.Visible = false   -- then we make them invisible 
			end 
			newPage.Visible = true  -- We make current page visible but not others

			for i,v in next, Pages:GetChildren() do   -- We get all the elements inside the frame
				if v:IsA("TextButton") then -- We can't animate UIListLayout, so we check if its a TextButton
					game.TweenService:Create(v, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						BackgroundColor3 = Color3.fromRGB(115, 49, 37) -- We animate other Tab Buttons and making the current one seem Checked
					}):Play()
				end
			end
			game.TweenService:Create(TabButton, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
				TextColor3 = Color3.fromRGB(189, 255, 161) -- We animate other Tab Buttons and making the current one seem Checked
			}):Play()
		end)
		
		newPage.Name = "newPage"
		newPage.Parent = Pages
		newPage.Active = true
		newPage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		newPage.BackgroundTransparency = 1.000
		newPage.Size = UDim2.new(1, 0, 1, 0)
		newPage.ScrollBarThickness = 5

		UIListLayout.Name = "elementsListing"
		UIListLayout.Parent = newPage
		UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout.Padding = UDim.new(0, 5)
		
		
		
	end
	
	return TabHandler
	
end

return WindowTable

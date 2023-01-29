local WindowTable = {}

function WindowTable:CreateWindow()
	
	-- Gui to Lua
	-- Version: 3.2

	-- Instances:

	local Main = Instance.new("ScreenGui")
	local MainFrame = Instance.new("Frame")
	local TopBar = Instance.new("Frame")
	local HubName = Instance.new("TextLabel")
	local allPages = Instance.new("Frame")
	local pageCorner = Instance.new("UICorner")
	local Pages = Instance.new("Folder")
	local mainCorner = Instance.new("UICorner")
	local SideBar = Instance.new("Frame")
	local sideCorner = Instance.new("UICorner")
	local allTabs = Instance.new("ScrollingFrame")
	local UIPadding = Instance.new("UIPadding")
	local UIListLayout = Instance.new("UIListLayout")

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

	allPages.Name = "allPages"
	allPages.Parent = MainFrame
	allPages.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
	allPages.Position = UDim2.new(0.224528298, 0, 0.107526883, 0)
	allPages.Size = UDim2.new(0.759000003, 0, 0.870967805, 0)

	pageCorner.CornerRadius = UDim.new(0, 4)
	pageCorner.Name = "pageCorner"
	pageCorner.Parent = allPages

	Pages.Name = "Pages"
	Pages.Parent = allPages





	mainCorner.CornerRadius = UDim.new(0, 4)
	mainCorner.Name = "mainCorner"
	mainCorner.Parent = MainFrame

	SideBar.Name = "SideBar"
	SideBar.Parent = MainFrame
	SideBar.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
	SideBar.Position = UDim2.new(0.0172714088, 0, 0.107526883, 0)
	SideBar.Size = UDim2.new(0, 118, 0, 324)

	sideCorner.CornerRadius = UDim.new(0, 4)
	sideCorner.Name = "sideCorner"
	sideCorner.Parent = SideBar

	allTabs.Name = "allTabs"
	allTabs.Parent = SideBar
	allTabs.Active = true
	allTabs.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	allTabs.BackgroundTransparency = 1.000
	allTabs.BorderSizePixel = 0
	allTabs.Size = UDim2.new(0, 118, 0, 324)
	allTabs.ScrollBarThickness = 4

	UIPadding.Parent = allTabs
	UIPadding.PaddingBottom = UDim.new(0, 8)
	UIPadding.PaddingLeft = UDim.new(0, 8)
	UIPadding.PaddingTop = UDim.new(0, 8)

	UIListLayout.Parent = allTabs
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 1)


	
	local TabHandler = {}
	
	function TabHandler:CreateTab(tabname)
		tabname = tabname or "New Tab"
		
		local TabButton = Instance.new("TextLabel")
		local newPage = Instance.new("ScrollingFrame")
		local elementsListing = Instance.new("UIListLayout")


		
		TabButton.Name = "TabButton"
		TabButton.Parent = allTabs
		TabButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TabButton.BackgroundTransparency = 1.000
		TabButton.Position = UDim2.new(0.0853324682, 0, 0, 0)
		TabButton.Size = UDim2.new(0, 100, 0, 28)
		TabButton.Font = Enum.Font.FredokaOne
		TabButton.Text = tabname
		TabButton.TextColor3 = Color3.fromRGB(189, 255, 161)
		TabButton.TextSize = 14.000
		
		newPage.Name = "newPage"
		newPage.Parent = allPages
		newPage.Active = true
		newPage.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
		newPage.BorderSizePixel = 0
		newPage.Position = UDim2.new(0, 0, 4.70950248e-08, 0)
		newPage.Size = UDim2.new(0, 442, 0, 324)
		newPage.ScrollBarThickness = 4
		
		elementsListing.Name = "elementsListing"
		elementsListing.Parent = newPage
		elementsListing.SortOrder = Enum.SortOrder.LayoutOrder
		elementsListing.Padding = UDim.new(0, 5)
		
		TabButton.MouseButton1Click:Connect(function()
			for i,v in next, allPages:GetChildren() do -- We get all the pages that we added
				v.Visible = false   -- then we make them invisible 
			end 
			newPage.Visible = true  -- We make current page visible but not others

			--Animations Below  -- Optional
			for i,v in next, allTabs:GetChildren() do   -- We get all the elements inside the frame
				if v:IsA("TextButton") then -- We can't animate UIListLayout, so we check if its a TextButton
					game.TweenService:Create(v, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						BackgroundColor3 = Color3.fromRGB(115, 49, 37) -- We animate other Tab Buttons and making the current one seem Checked
					}):Play()
				end
			end
			game.TweenService:Create(TabButton, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
				BackgroundColor3 = Color3.fromRGB(189, 255, 161) -- We animate other Tab Buttons and making the current one seem Checked
			}):Play()
		end)
		
	end
	
	return TabHandler
	
end

return WindowTable
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local HttpService = game:GetService("HttpService")

local WindowTable = {}

function WindowTable:CreateWindow()

	-- Gui to Lua
	-- Version: 3.2

	-- Instances:
	
	if game.CoreGui:FindFirstChild("Main") then
		game.CoreGui:FindFirstChild("Main"):Destroy()
	end

	local Main = Instance.new("ScreenGui")
	
	if syn then 
		syn.protect_gui(Main)
	end
	
	for i,v in ipairs(game.CoreGui:GetChildren()) do
		if v.Name == Main.Name then
			v:Destroy()
		end
	end
	
	
	
	local MainFrame = Instance.new("Frame")
	local TopBar = Instance.new("Frame")
	local HubName = Instance.new("TextLabel")
	local allPages = Instance.new("Frame")
	local pageCorner = Instance.new("UICorner")
	local mainCorner = Instance.new("UICorner")
	local SideBar = Instance.new("Frame")
	local allTabs = Instance.new("Frame")
	local tabListing = Instance.new("UIListLayout")
	local sideCorner = Instance.new("UICorner")

	--Properties:

	Main.Name = "Main"
	Main.Parent = game.CoreGui
	Main.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	MainFrame.Name = "MainFrame"
	MainFrame.Parent = Main
	MainFrame.BackgroundColor3 = Color3.fromRGB(56, 56, 56)
	MainFrame.Position = UDim2.new(0.287230164, 0, 0.311678439, 0)
	MainFrame.Size = UDim2.new(0, 583, 0, 372)
	MainFrame.Active = true
	MainFrame.Draggable = true

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

	mainCorner.CornerRadius = UDim.new(0, 4)
	mainCorner.Name = "mainCorner"
	mainCorner.Parent = MainFrame

	SideBar.Name = "SideBar"
	SideBar.Parent = MainFrame
	SideBar.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
	SideBar.Position = UDim2.new(0.0172714088, 0, 0.107526883, 0)
	SideBar.Size = UDim2.new(0, 118, 0, 324)

	allTabs.Name = "allTabs"
	allTabs.Parent = SideBar
	allTabs.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	allTabs.BackgroundTransparency = 1.000
	allTabs.BorderSizePixel = 0
	allTabs.Size = UDim2.new(0, 118, 0, 323)

	tabListing.Name = "tabListing"
	tabListing.Parent = allTabs
	tabListing.SortOrder = Enum.SortOrder.LayoutOrder
	tabListing.Padding = UDim.new(0, 2)

	sideCorner.CornerRadius = UDim.new(0, 4)
	sideCorner.Name = "sideCorner"
	sideCorner.Parent = SideBar
	
	local pagesFolder = Instance.new("Folder")


	pagesFolder.Name = "pagesFolder"
	pagesFolder.Parent = allPages

	local TabHandler = {}
	
	function TabHandler:CreateTab(tabname)
		tabname = tabname or "New Tab"
		
		local TabButton = Instance.new("TextButton")
		local newPage = Instance.new("ScrollingFrame")
		local elementsListing = Instance.new("UIListLayout")
		local elementsPadding = Instance.new("UIPadding")
		
		TabButton.Name = "TabButton"
		TabButton.Parent = allTabs
		TabButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TabButton.BackgroundTransparency = 1.000
		TabButton.Size = UDim2.new(0, 100, 0, 28)
		TabButton.Font = Enum.Font.FredokaOne
		TabButton.Text = tabname
		TabButton.TextColor3 = Color3.fromRGB(128,128,128)
		TabButton.TextSize = 14.000
		
		TabButton.MouseButton1Click:Connect(function()
			for i,v in next, pagesFolder:GetChildren() do -- We get all the pages that we added
				v.Visible = false   -- then we make them invisible 
			end 
			newPage.Visible = true  -- We make current page visible but not others
			
			for i,v in next, allTabs:GetChildren() do   -- We get all the elements inside the frame
				if v:IsA("TextButton") then -- We can't animate UIListLayout, so we check if its a TextButton
					game.TweenService:Create(v, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						TextColor3 = Color3.fromRGB(128,128,128) -- We animate other Tab Buttons and making the current one seem Checked
					}):Play()
				end
			end
			game.TweenService:Create(TabButton, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
				TextColor3 = Color3.fromRGB(189, 255, 161) -- We animate other Tab Buttons and making the current one seem Checked
			}):Play()

		end)		
		
		newPage.Name = "newPage"
		newPage.Parent = pagesFolder
		newPage.Active = true
		newPage.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
		newPage.BorderSizePixel = 0
		newPage.Position = UDim2.new(0, 0, 4.70950248e-08, 0)
		newPage.Size = UDim2.new(0, 442, 0, 324)
		newPage.ScrollBarThickness = 4
		newPage.ZIndex = 99

		elementsListing.Name = "elementsListing"
		elementsListing.Parent = newPage
		elementsListing.HorizontalAlignment = Enum.HorizontalAlignment.Center
		elementsListing.SortOrder = Enum.SortOrder.LayoutOrder
		elementsListing.Padding = UDim.new(0, 5)
		
		elementsPadding.Name = "elementsPadding"
		elementsPadding.Parent = newPage
		elementsPadding.PaddingLeft = UDim.new(0, 5)
		elementsPadding.PaddingTop = UDim.new(0, 5)
		elementsPadding.PaddingBottom = UDim.new(0, 5)
		elementsPadding.PaddingRight = UDim.new(0,5)
		
		local tabPadding = Instance.new("UIPadding")		

		tabPadding.Name = "tabPadding"
		tabPadding.Parent = allTabs
		tabPadding.PaddingLeft = UDim.new(0, 8)
		tabPadding.PaddingBottom = UDim.new(0, 4)
		
		local ElementHandler = {}
		
		function ElementHandler:CreateSection(sectionText)
			sectionText = sectionText or "Section"
			local Section = Instance.new("TextLabel")

			Section.Name = "Section"
			Section.Parent = newPage
			Section.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Section.BackgroundTransparency = 1.000
			Section.BorderSizePixel = 0
			Section.Size = UDim2.new(0, 428, 0, 36)
			Section.Font = Enum.Font.FredokaOne
			Section.Text = sectionText
			Section.TextColor3 = Color3.fromRGB(189, 255, 161)
			Section.TextSize = 14.000
			
		end
		
		function ElementHandler:CreateButton(buttonText, callback)
			buttonText = buttonText or "Button"
			callback = callback or function() end
			

			local textButton = Instance.new("TextButton")
			local buttonCorner = Instance.new("UICorner")

			--Properties:

			textButton.Parent = newPage
			textButton.BackgroundColor3 = Color3.fromRGB(189, 255, 161)
			textButton.Position = UDim2.new(0, 0, 9.56663868e-08, 0)
			textButton.Size = UDim2.new(0, 428, 0, 27)
			textButton.AutoButtonColor = false
			textButton.Font = Enum.Font.FredokaOne
			textButton.Text = buttonText
			textButton.TextColor3 = Color3.fromRGB(56, 56, 56)
			textButton.TextSize = 14.000
			textButton.ZIndex = 1
			textButton.MouseButton1Click:Connect(function()
				callback()
			end)

			buttonCorner.CornerRadius = UDim.new(0, 5)
			buttonCorner.Name = "buttonCorner"
			buttonCorner.Parent = textButton
			
		end
		
		function ElementHandler:CreateToggle(toggleText, callback)
			toggleText = toggleText or "Toggle"
			callback = callback or function() end
			
			local Toggle = Instance.new("TextButton")
			local buttonCorner = Instance.new("UICorner")
			local ToggleText = Instance.new("TextLabel")
			local RadioButton = Instance.new("Frame")
			local RadioCorner = Instance.new("UICorner")

			--Properties:

			Toggle.Name = "Toggle"
			Toggle.Parent = newPage
			Toggle.BackgroundColor3 = Color3.fromRGB(189, 255, 161)
			Toggle.Size = UDim2.new(0, 428, 0, 27)
			Toggle.Font = Enum.Font.FredokaOne
			Toggle.Text = ""
			Toggle.TextColor3 = Color3.fromRGB(56, 56, 56)
			Toggle.TextSize = 14.000
			Toggle.TextWrapped = true

			buttonCorner.CornerRadius = UDim.new(0, 5)
			buttonCorner.Name = "buttonCorner"
			buttonCorner.Parent = Toggle

			ToggleText.Name = "ToggleText"
			ToggleText.Parent = Toggle
			ToggleText.Text = toggleText
			ToggleText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ToggleText.BackgroundTransparency = 1.000
			ToggleText.Position = UDim2.new(0.023488272, 0, 0, 0)
			ToggleText.Size = UDim2.new(0, 175, 0, 27)
			ToggleText.Font = Enum.Font.FredokaOne
			ToggleText.TextColor3 = Color3.fromRGB(56, 56, 56)
			ToggleText.TextSize = 14.000
			ToggleText.TextXAlignment = Enum.TextXAlignment.Left

			RadioButton.Name = "RadioButton"
			RadioButton.Parent = Toggle
			RadioButton.BackgroundColor3 = Color3.fromRGB(56,56,56)
			RadioButton.BorderColor3 = Color3.fromRGB(189, 255, 16)
			RadioButton.Position = UDim2.new(0.927724838, 0, 0.222222224, 0)
			RadioButton.Size = UDim2.new(0, 21, 0, 15)

			RadioCorner.CornerRadius = UDim.new(0, 5)
			RadioCorner.Name = "RadioCorner"
			RadioCorner.Parent = RadioButton
			
			local tog = false
			
			Toggle.MouseButton1Click:Connect(function()
				tog = not tog
				callback(tog) -- Callbacks whenever we toggle
				if tog then 
					game.TweenService:Create(RadioButton, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						BackgroundColor3 = Color3.fromRGB(186, 81, 83)
					}):Play()
					--- We put our animation here when the toggle is on
				else
					game.TweenService:Create(RadioButton, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						BackgroundColor3 = Color3.fromRGB(56,56,56)
					}):Play()
					---We Put our animation here when the toggle is off
				end
			end)
			
		end
		
		return ElementHandler

	end
	
	return TabHandler
end

return WindowTable


local Library = {}

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")

function Library:CreateWindow(cfg)
    local Name = cfg.Name or "KA7"
    local Theme = cfg.Theme or Color3.fromRGB(20,20,20)

    local Gui = Instance.new("ScreenGui")
    Gui.Name = "KA7Library"
    Gui.Parent = CoreGui

    local Main = Instance.new("Frame")
    Main.Parent = Gui
    Main.Size = UDim2.new(0,520,0,340)
    Main.Position = UDim2.new(0.5,-260,0.5,-170)
    Main.BackgroundColor3 = Theme
    Main.BorderSizePixel = 2
    Main.Active = true
    Main.Draggable = true

    local UICorner = Instance.new("UICorner", Main)
    UICorner.CornerRadius = UDim.new(0,8)

    local Top = Instance.new("TextLabel")
    Top.Parent = Main
    Top.Size = UDim2.new(1,0,0,35)
    Top.BackgroundTransparency = 1
    Top.Text = Name
    Top.TextColor3 = Color3.new(1,1,1)
    Top.Font = Enum.Font.GothamBold
    Top.TextSize = 18

    local Tabs = Instance.new("Frame")
    Tabs.Parent = Main
    Tabs.Size = UDim2.new(0,130,1,-35)
    Tabs.Position = UDim2.new(0,0,0,35)
    Tabs.BackgroundColor3 = Color3.fromRGB(15,15,15)

    local TabList = Instance.new("UIListLayout", Tabs)
    TabList.Padding = UDim.new(0,5)

    local Pages = Instance.new("Frame")
    Pages.Parent = Main
    Pages.Size = UDim2.new(1,-135,1,-40)
    Pages.Position = UDim2.new(0,135,0,35)
    Pages.BackgroundTransparency = 1

    local Toggle = Instance.new("ImageButton")
    Toggle.Parent = Gui
    Toggle.Size = UDim2.new(0,45,0,45)
    Toggle.Position = UDim2.new(0,15,0.5,-20)
    Toggle.Image = "rbxassetid://87950815567502"
    Toggle.BackgroundColor3 = Color3.fromRGB(20,20,20)

    local tc = Instance.new("UICorner", Toggle)
    tc.CornerRadius = UDim.new(0,8)

    Toggle.MouseButton1Click:Connect(function()
        Main.Visible = not Main.Visible
    end)

    local Close = Instance.new("TextButton")
    Close.Parent = Main
    Close.Size = UDim2.new(0,30,0,30)
    Close.Position = UDim2.new(1,-35,0,2)
    Close.Text = "X"
    Close.BackgroundColor3 = Color3.fromRGB(35,35,35)
    Close.TextColor3 = Color3.new(1,1,1)

    local Confirm = Instance.new("Frame")
    Confirm.Parent = Main
    Confirm.Size = UDim2.new(0,170,0,80)
    Confirm.Position = UDim2.new(0.5,-85,0.5,-40)
    Confirm.Visible = false
    Confirm.BackgroundColor3 = Color3.fromRGB(15,15,15)

    local cf = Instance.new("UICorner", Confirm)
    cf.CornerRadius = UDim.new(0,8)

    local Yes = Instance.new("TextButton")
    Yes.Parent = Confirm
    Yes.Size = UDim2.new(0,70,0,25)
    Yes.Position = UDim2.new(0,10,1,-35)
    Yes.Text = "Close Script"
    Yes.TextScaled = true
    Yes.BackgroundColor3 = Color3.fromRGB(25,25,25)
    Yes.TextColor3 = Color3.new(1,1,1)

    local No = Instance.new("TextButton")
    No.Parent = Confirm
    No.Size = UDim2.new(0,70,0,25)
    No.Position = UDim2.new(1,-80,1,-35)
    No.Text = "Cancel"
    No.BackgroundColor3 = Color3.fromRGB(25,25,25)
    No.TextColor3 = Color3.new(1,1,1)

    Close.MouseButton1Click:Connect(function()
        Confirm.Visible = true
    end)

    No.MouseButton1Click:Connect(function()
        Confirm.Visible = false
    end)

    Yes.MouseButton1Click:Connect(function()
        Gui:Destroy()
    end)

    local Sizes = {
        {350,240},{380,260},{410,280},{440,300},{470,320},
        {520,340},{560,360},{600,380},{680,420},{760,470},{840,520}
    }

    local Window = {}

    function Window:CreateTab(name)
        local Btn = Instance.new("TextButton")
        Btn.Parent = Tabs
        Btn.Size = UDim2.new(1,-10,0,30)
        Btn.Text = name
        Btn.BackgroundColor3 = Color3.fromRGB(25,25,25)
        Btn.TextColor3 = Color3.new(1,1,1)

        local Page = Instance.new("ScrollingFrame")
        Page.Parent = Pages
        Page.Size = UDim2.new(1,0,1,0)
        Page.Visible = false
        Page.BackgroundTransparency = 1
        Page.CanvasSize = UDim2.new(0,0,5,0)

        Btn.MouseButton1Click:Connect(function()
            for _,v in pairs(Pages:GetChildren()) do
                if v:IsA("ScrollingFrame") then
                    v.Visible = false
                end
            end
            Page.Visible = true
        end)

        local Tab = {}

        function Tab:AddButton(text,callback)
            local B = Instance.new("TextButton")
            B.Parent = Page
            B.Size = UDim2.new(1,-10,0,30)
            B.Position = UDim2.new(0,5,0,#Page:GetChildren()*35)
            B.Text = text
            B.BackgroundColor3 = Color3.fromRGB(30,30,30)
            B.TextColor3 = Color3.new(1,1,1)

            B.MouseButton1Click:Connect(function()
                callback()
            end)
        end

        return Tab
    end

    local SizeTab = Window:CreateTab("Size")

    for i,v in ipairs(Sizes) do
        SizeTab:AddButton("Size "..i,function()
            Main.Size = UDim2.new(0,v[1],0,v[2])
        end)
    end

    Window:CreateTab("Discord")

    return Window
end

return Library

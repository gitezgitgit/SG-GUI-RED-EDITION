local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SG_GUI_RED_EDITION"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")
 
-- 4829173
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 300, 0, 250)
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -125)
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- 947563
mainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
mainFrame.BorderSizePixel = 5
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui
 
-- 197263
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 40)
titleLabel.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- 385742
titleLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
titleLabel.Text = "SG GUI RED EDITION"
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.TextSize = 24
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.BorderSizePixel = 5
titleLabel.Parent = mainFrame
 
-- 746292
local fixedButtonsFrame = Instance.new("Frame")
fixedButtonsFrame.Size = UDim2.new(1, 0, 0, 50)
fixedButtonsFrame.Position = UDim2.new(0, 0, 0, 40)
fixedButtonsFrame.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- 167895
fixedButtonsFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
fixedButtonsFrame.BorderSizePixel = 5
fixedButtonsFrame.Parent = mainFrame
 
-- 905172
local resetButton = Instance.new("TextButton")
resetButton.Size = UDim2.new(0.5, -2, 1, 0)
resetButton.Position = UDim2.new(0, 0, 0, 0)
resetButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- 564738
resetButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
resetButton.BorderSizePixel = 5
resetButton.Text = "RE"
resetButton.Font = Enum.Font.SourceSansBold
resetButton.TextSize = 20
resetButton.TextColor3 = Color3.fromRGB(255, 255, 255)
resetButton.Parent = fixedButtonsFrame
resetButton.MouseButton1Click:Connect(function()
    local character = player.Character
    if character then
        local position = character.HumanoidRootPart.Position
        character:BreakJoints()
        wait(0.1)
        player:LoadCharacter()
        wait(0.1)
        character = player.Character
        if character then
            local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
            humanoidRootPart.CFrame = CFrame.new(position)
        end
    end
end)
 
-- 371240
local r6Button = Instance.new("TextButton")
r6Button.Size = UDim2.new(0.5, -2, 1, 0)
r6Button.Position = UDim2.new(0.5, 2, 0, 0)
r6Button.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- 102938
r6Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
r6Button.BorderSizePixel = 5
r6Button.Text = "R6"
r6Button.Font = Enum.Font.SourceSansBold
r6Button.TextSize = 20
r6Button.TextColor3 = Color3.fromRGB(255, 255, 255)
r6Button.Parent = fixedButtonsFrame
r6Button.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://pastebin.com/raw/9wJepMwY", true))()
end)
 
-- 854726
local scrollingFrame = Instance.new("ScrollingFrame")
scrollingFrame.Size = UDim2.new(1, -10, 1, -100)
scrollingFrame.Position = UDim2.new(0, 5, 0, 95)
scrollingFrame.BackgroundTransparency = 0 -- 293847
scrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- 847362
scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 5000)
scrollingFrame.ScrollBarThickness = 5
scrollingFrame.BorderSizePixel = 5
scrollingFrame.Parent = mainFrame
 
local layout = Instance.new("UIListLayout")
layout.Parent = scrollingFrame
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.Padding = UDim.new(0, 5)
 
function _G.createButton(name, text, scriptUrl)
    local button = Instance.new("TextButton")
    button.Name = name
    button.Size = UDim2.new(0.9, 0, 0, 50)
    button.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- 564930
    button.BorderColor3 = Color3.fromRGB(0, 0, 0)
    button.BorderSizePixel = 5
    button.Text = text
    button.Font = Enum.Font.SourceSansBold
    button.TextSize = 18
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Parent = scrollingFrame
    button.MouseButton1Click:Connect(function()
        loadstring(game:HttpGet(scriptUrl))()
    end)
end
 
_G.createButton("Railgun titan absalom", "Railgun titan absalom", "https://web.archive.org/web/20230520230408/https://pastebin.com/raw/Sq3AWXf5")
_G.createButton("What happened?", "What happened?", "https://pastefy.app/O95WzLrY/raw")
_G.createButton("Jeff The Killer", "Jeff The Killer", "https://pastefy.app/4I8ufh0o/raw")
_G.createButton("Herobrine", "Herobrine", "https://pastefy.app/Rfpe0mkO/raw")
_G.createButton("Samsung Note 7", "Samsung Note 7", "https://pastefy.app/dA68xt1p/raw")
_G.createButton("DEX EXPLORER", "DEX EXPLORER", "https://pastefy.app/g0TuOj5M/raw")
_G.createButton("Ro-Xploit 5.0", "Ro-Xploit 5.0", "https://pastefy.app/5KWLtUiQ/raw")
_G.createButton("F3X TOOL", "F3X TOOL", "https://pastefy.app/MHI03xg5/raw")
_G.createButton("Ouch!", "Ouch!", "https://pastefy.app/h6fhUC6z/raw")
_G.createButton("Air Power", "Air Power", "https://web.archive.org/web/20250129032544/https://pastebin.com/raw/BgPSg5Wg")
_G.createButton("Lua Hammer", "Lua Hammer", "https://pastebin.com/raw/5xkUq66A")
_G.createButton("Draw", "Draw", "https://web.archive.org/web/20230402091723/https://pastebin.com/raw/1322re6a")
_G.createButton("Master of Star", "Master of Star", "https://web.archive.org/web/20230403113552/https://pastebin.com/raw/8YWDfKjF")
_G.createButton("Shedletsky", "Shedletsky", "https://pastefy.app/ILydDmgJ/raw")
_G.createButton("John doe", "John doe", "https://pastebin.com/raw/d2Lin7Ea")
_G.createButton("Thomas", "Thomas", "https://web.archive.org/web/20230403101809/https://pastebin.com/raw/tMr759X7")
_G.createButton("Steve Minecraft", "Steve Minecraft", "https://pastebin.com/raw/2NNDTLjL")
_G.createButton("Mario.exe", "Mario.exe", "https://pastefy.app/aKhOO5r3/raw")
_G.createButton("Dark Wings", "Dark Wings", "https://web.archive.org/web/20190719191941/http://pastebin.com/raw/L0GbxNfL")
_G.createButton("Gnome spam", "Gnome spam", "https://pastefy.app/Zvnbe0Mi/raw")
_G.createButton("Change sky", "Change sky", "https://pastefy.app/HJKdEvB3/raw")
_G.createButton("Eletric Moves", "Eletric Moves", "https://web.archive.org/web/20200606103010/https://pastebin.com/raw/VLCC4Hqx")
_G.createButton("Restaurant Cafe", "Restaurant Cafe", "https://web.archive.org/web/20230331215846/https://pastebin.com/raw/HtUABLMJ")
_G.createButton("Topk3k 3.0", "Topk3k 3.0", "https://web.archive.org/web/20230519070821/https://pastebin.com/raw/cGvhHsmj")
_G.createButton("C00lgui", "C00lgui", "https://rawscripts.net/raw/a-literal-baseplate.-c00lgui-v2-by-rc7-29706")
_G.createButton("ExSer New", "ExSer New", "https://raw.githubusercontent.com/gitluau/luauexser/refs/heads/main/pHzp8uG1PO962o6qucrlP3AJy17eV3B.lua")
 
print("GUI caricata correttamente. Usa _G.createButton per aggiungere altri pulsanti.")
 
-- 634859
local rotatingImage = Instance.new("ImageLabel")
rotatingImage.Size = UDim2.new(0, 100, 0, 100)
rotatingImage.Position = UDim2.new(1, -110, 0, 10)
rotatingImage.AnchorPoint = Vector2.new(1, 0)
rotatingImage.Image = "rbxassetid://136906643509432"
rotatingImage.BackgroundTransparency = 1
rotatingImage.Parent = screenGui
 
local tweenService = game:GetService("TweenService")
local rotationTween = tweenService:Create(
    rotatingImage,
    TweenInfo.new(5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1, true),
    {Rotation = 360}
)
rotationTween:Play()
 
local greetingText = Instance.new("TextLabel")
greetingText.Size = UDim2.new(0, 200, 0, 50)
greetingText.Position = UDim2.new(1, -210, 0, 10)
greetingText.AnchorPoint = Vector2.new(1, 0)
greetingText.BackgroundTransparency = 1
greetingText.Text = "Hi " .. player.Name .. "!"
greetingText.Font = Enum.Font.SourceSansBold
greetingText.TextSize = 24
greetingText.TextColor3 = Color3.fromRGB(255, 255, 255)
greetingText.Parent = screenGui
 
local footerText = Instance.new("TextLabel")
footerText.Size = UDim2.new(0, 300, 0, 50)
footerText.Position = UDim2.new(0.5, -150, 1, -60)
footerText.AnchorPoint = Vector2.new(0.5, 1)
footerText.BackgroundTransparency = 1
footerText.Text = "King"
footerText.Font = Enum.Font.SourceSans
footerText.TextSize = 18
footerText.TextColor3 = Color3.fromRGB(255, 255, 255)
footerText.Parent = screenGui
  end    
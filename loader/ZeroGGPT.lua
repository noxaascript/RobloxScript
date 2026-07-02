-- ============================================================
--  ZERO GPT EXECUTOR SCRIPT GENERATOR v4.5
--  Designed for: Roblox Delta Executor
--  Model: ZeroGPT 4.5 Flash & Ultra
--  Creator: YANG MULIA KAREEMXD 👑
-- ============================================================

local ZeroGPT = {
    Name = "ZeroGPT",
    Version = "4.5",
    Model = "Ultra", -- "Flash" or "Ultra"
    KeySystem = true,
    History = {},
    isMinimized = false
}

-- ============================================================
--  UI COMPONENTS - iOS Minimalist Style
-- ============================================================

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/VapeV4"))()
local Window = Library:CreateWindow("ZeroGPT Executor", Color3.fromRGB(0, 0, 0))

-- Main Frame with Neon accents
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 420, 0, 650)
MainFrame.Position = UDim2.new(0.5, -210, 0.5, -325)
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
MainFrame.BackgroundTransparency = 0.05
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Parent = game.CoreGui

-- Glass effect (iOS style)
local GlassEffect = Instance.new("Frame")
GlassEffect.Size = UDim2.new(1, 0, 1, 0)
GlassEffect.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
GlassEffect.BackgroundTransparency = 0.97
GlassEffect.BorderSizePixel = 0
GlassEffect.Parent = MainFrame

-- Blur effect (iOS style)
local Blur = Instance.new("BlurEffect")
Blur.Size = 10
Blur.Parent = game.Lighting

-- ============================================================
--  NEON DRAG BAR (Hitam, Biru, Hijau Neon)
-- ============================================================

local DragBar = Instance.new("Frame")
DragBar.Size = UDim2.new(1, 0, 0, 40)
DragBar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
DragBar.BorderSizePixel = 0
DragBar.Parent = MainFrame

-- Neon Gradient Line
local NeonLine = Instance.new("Frame")
NeonLine.Size = UDim2.new(1, 0, 0, 2)
NeonLine.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
NeonLine.BorderSizePixel = 0
NeonLine.Parent = DragBar

-- Neon pulsating effect
game:GetService("RunService").Heartbeat:Connect(function()
    local hue = tick() % 2 / 2
    NeonLine.BackgroundColor3 = Color3.fromHSV(hue, 1, 1)
end)

-- Min/Max Button (iOS style)
local MinButton = Instance.new("TextButton")
MinButton.Size = UDim2.new(0, 30, 0, 30)
MinButton.Position = UDim2.new(1, -40, 0.5, -15)
MinButton.BackgroundColor3 = Color3.fromRGB(255, 200, 50)
MinButton.BackgroundTransparency = 0.3
MinButton.Text = "−"
MinButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinButton.TextSize = 20
MinButton.Font = Enum.Font.SourceSansBold
MinButton.BorderSizePixel = 0
MinButton.Parent = DragBar

-- ============================================================
--  AI MODEL SELECTOR (Flash / Ultra)
-- ============================================================

local ModelFrame = Instance.new("Frame")
ModelFrame.Size = UDim2.new(1, -20, 0, 50)
ModelFrame.Position = UDim2.new(0, 10, 0, 50)
ModelFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
ModelFrame.BackgroundTransparency = 0.5
ModelFrame.BorderSizePixel = 1
ModelFrame.BorderColor3 = Color3.fromRGB(0, 255, 200)
ModelFrame.Parent = MainFrame

local ModelLabel = Instance.new("TextLabel")
ModelLabel.Size = UDim2.new(0.5, 0, 1, 0)
ModelLabel.BackgroundTransparency = 1
ModelLabel.Text = "⚡ ZeroGPT 4.5"
ModelLabel.TextColor3 = Color3.fromRGB(0, 255, 200)
ModelLabel.TextSize = 16
ModelLabel.Font = Enum.Font.SourceSansSemibold
ModelLabel.TextXAlignment = Enum.TextXAlignment.Left
ModelLabel.Parent = ModelFrame

local ModelToggle = Instance.new("TextButton")
ModelToggle.Size = UDim2.new(0, 100, 0, 30)
ModelToggle.Position = UDim2.new(1, -110, 0.5, -15)
ModelToggle.BackgroundColor3 = Color3.fromRGB(0, 200, 255)
ModelToggle.Text = "Ultra"
ModelToggle.TextColor3 = Color3.fromRGB(0, 0, 0)
ModelToggle.TextSize = 14
ModelToggle.Font = Enum.Font.SourceSansBold
ModelToggle.BorderSizePixel = 0
ModelToggle.Parent = ModelFrame

local isUltra = true
ModelToggle.MouseButton1Click:Connect(function()
    isUltra = not isUltra
    ModelToggle.Text = isUltra and "Ultra" or "Flash"
    ModelToggle.BackgroundColor3 = isUltra and Color3.fromRGB(0, 200, 255) or Color3.fromRGB(0, 255, 100)
    ModelLabel.Text = isUltra and "⚡ ZeroGPT 4.5 Ultra" or "⚡ ZeroGPT 4.5 Flash"
end)

-- ============================================================
--  INPUT AREA - Minimalis, bersih
-- ============================================================

local InputFrame = Instance.new("Frame")
InputFrame.Size = UDim2.new(1, -20, 0, 120)
InputFrame.Position = UDim2.new(0, 10, 0, 110)
InputFrame.BackgroundColor3 = Color3.fromRGB(5, 5, 10)
InputFrame.BackgroundTransparency = 0.3
InputFrame.BorderSizePixel = 0
InputFrame.Parent = MainFrame

local InputBox = Instance.new("TextBox")
InputBox.Size = UDim2.new(1, -10, 1, -10)
InputBox.Position = UDim2.new(0, 5, 0, 5)
InputBox.BackgroundTransparency = 1
InputBox.Text = "Deskripsikan script Luau yang kamu mau..."
InputBox.TextColor3 = Color3.fromRGB(200, 200, 220)
InputBox.TextSize = 14
InputBox.Font = Enum.Font.SourceSans
InputBox.TextWrapped = true
InputBox.TextXAlignment = Enum.TextXAlignment.Left
InputBox.TextYAlignment = Enum.TextYAlignment.Top
InputBox.ClearTextOnFocus = false
InputBox.Parent = InputFrame

-- ============================================================
--  GENERATE BUTTON - Neon Hijau
-- ============================================================

local GenButton = Instance.new("TextButton")
GenButton.Size = UDim2.new(0, 200, 0, 45)
GenButton.Position = UDim2.new(0.5, -100, 0, 245)
GenButton.BackgroundColor3 = Color3.fromRGB(0, 255, 100)
GenButton.Text = "▶ GENERATE SCRIPT"
GenButton.TextColor3 = Color3.fromRGB(0, 0, 0)
GenButton.TextSize = 16
GenButton.Font = Enum.Font.SourceSansBold
GenButton.BorderSizePixel = 0
GenButton.Parent = MainFrame

-- Hover animation
GenButton.MouseEnter:Connect(function()
    GenButton.BackgroundColor3 = Color3.fromRGB(0, 255, 150)
    GenButton.Size = UDim2.new(0, 210, 0, 48)
end)
GenButton.MouseLeave:Connect(function()
    GenButton.BackgroundColor3 = Color3.fromRGB(0, 255, 100)
    GenButton.Size = UDim2.new(0, 200, 0, 45)
end)

-- ============================================================
--  OUTPUT AREA - Dengan Copy & History
-- ============================================================

local OutputFrame = Instance.new("ScrollingFrame")
OutputFrame.Size = UDim2.new(1, -20, 0, 200)
OutputFrame.Position = UDim2.new(0, 10, 0, 305)
OutputFrame.BackgroundColor3 = Color3.fromRGB(5, 5, 10)
OutputFrame.BackgroundTransparency = 0.2
OutputFrame.BorderSizePixel = 0
OutputFrame.ScrollBarThickness = 4
OutputFrame.ScrollBarImageColor3 = Color3.fromRGB(0, 255, 200)
OutputFrame.Parent = MainFrame

local OutputLabel = Instance.new("TextLabel")
OutputLabel.Size = UDim2.new(1, -10, 0, 190)
OutputLabel.Position = UDim2.new(0, 5, 0, 5)
OutputLabel.BackgroundTransparency = 1
OutputLabel.Text = "Script akan muncul di sini..."
OutputLabel.TextColor3 = Color3.fromRGB(150, 150, 180)
OutputLabel.TextSize = 12
OutputLabel.Font = Enum.Font.SourceSans
OutputLabel.TextWrapped = true
OutputLabel.TextXAlignment = Enum.TextXAlignment.Left
OutputLabel.TextYAlignment = Enum.TextYAlignment.Top
OutputLabel.Parent = OutputFrame

-- ============================================================
--  ACTION BUTTONS - Copy & History
-- ============================================================

local ActionFrame = Instance.new("Frame")
ActionFrame.Size = UDim2.new(1, -20, 0, 40)
ActionFrame.Position = UDim2.new(0, 10, 0, 515)
ActionFrame.BackgroundTransparency = 1
ActionFrame.Parent = MainFrame

-- Copy Button
local CopyButton = Instance.new("TextButton")
CopyButton.Size = UDim2.new(0, 80, 0, 30)
CopyButton.Position = UDim2.new(0, 0, 0.5, -15)
CopyButton.BackgroundColor3 = Color3.fromRGB(0, 100, 255)
CopyButton.Text = "📋 Copy"
CopyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CopyButton.TextSize = 13
CopyButton.Font = Enum.Font.SourceSansBold
CopyButton.BorderSizePixel = 0
CopyButton.Parent = ActionFrame

-- History Button
local HistoryButton = Instance.new("TextButton")
HistoryButton.Size = UDim2.new(0, 80, 0, 30)
HistoryButton.Position = UDim2.new(0, 90, 0.5, -15)
HistoryButton.BackgroundColor3 = Color3.fromRGB(255, 200, 0)
HistoryButton.Text = "📜 History"
HistoryButton.TextColor3 = Color3.fromRGB(0, 0, 0)
HistoryButton.TextSize = 13
HistoryButton.Font = Enum.Font.SourceSansBold
HistoryButton.BorderSizePixel = 0
HistoryButton.Parent = ActionFrame

-- Key System Button
local KeyButton = Instance.new("TextButton")
KeyButton.Size = UDim2.new(0, 80, 0, 30)
KeyButton.Position = UDim2.new(1, -80, 0.5, -15)
KeyButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
KeyButton.Text = "🔑 Key"
KeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyButton.TextSize = 13
KeyButton.Font = Enum.Font.SourceSansBold
KeyButton.BorderSizePixel = 0
KeyButton.Parent = ActionFrame

-- ============================================================
--  AI ENGINE - ZeroGPT Core (Generate Scripts)
-- ============================================================

local function generateScript(prompt, model)
    local template = ""
    
    if model == "Ultra" then
        -- ZeroGPT 4.5 Ultra - Advanced scripting
        template = [[
-- ============================================================
--  ZEROGPT 4.5 ULTRA - GENERATED SCRIPT
--  Created for: ]] .. prompt .. [[
--  Performance: MAXIMUM | Security: HIGH
-- ============================================================

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")

-- [AUTO-OPTIMIZED BY ZEROGPT]
-- Optimasi level: Ultra (Parallel processing enabled)

local function main()
    -- ZEROGPT ULTRA CORE
    -- Berdasarkan prompt: ]] .. prompt .. [[
    
    -- === START GENERATED CODE ===
    
    -- ]]
    
    -- AI akan generate berdasarkan prompt
    if string.find(prompt:lower(), "aimbot") then
        template = template .. [[
    -- AIMBOT SYSTEM v2.0
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local character = player.Character
            if character and character:FindFirstChild("Head") then
                -- Auto-aim logic
                local head = character.Head
                local cam = Workspace.CurrentCamera
                cam.CFrame = CFrame.new(cam.CFrame.Position, head.Position)
            end
        end
    end
    ]]
    elseif string.find(prompt:lower(), "fly") then
        template = template .. [[
    -- FLIGHT SYSTEM (No Clip)
    local bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.MaxForce = Vector3.new(1e9, 1e9, 1e9)
    bodyVelocity.Velocity = Vector3.new(0, 50, 0)
    bodyVelocity.Parent = LocalPlayer.Character.HumanoidRootPart
    
    game:GetService("UserInputService").InputBegan:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.Space then
            bodyVelocity.Velocity = Vector3.new(0, 100, 0)
        end
    end)
    ]]
    else
        template = template .. [[
    -- GENERIC SCRIPT TEMPLATE
    print("ZeroGPT Ultra: Script generated for: ]] .. prompt .. [[")
    
    -- Tambahkan logika custom di sini
    local function customLogic()
        -- AI akan menyesuaikan berdasarkan konteks
        warn("ZeroGPT Ultra aktif!")
    end
    customLogic()
    ]]
    end
    
    template = template .. [[
    
    -- === END GENERATED CODE ===
    
    -- Execution successful
    print("✅ Script loaded successfully!")
end

-- Execute with error handling
pcall(main)
]]
    else
        -- ZeroGPT 4.5 Flash - Fast & Lightweight
        template = [[
-- ============================================================
--  ZEROGPT 4.5 FLASH - GENERATED SCRIPT (Lightning Fast)
--  Prompt: ]] .. prompt .. [[
--  Mode: Optimasi Kecepatan
-- ============================================================

-- Flash mode: Minimalis, cepat, efisien
local p = game:GetService("Players").LocalPlayer

local function flashExecute()
    -- ZeroGPT Flash Engine
    print("⚡ ZeroGPT Flash: " .. "]] .. prompt .. [[" )
    
    -- AI Flash Generation
    ]] .. (string.find(prompt:lower(), "fly") and [[
    p.Character.HumanoidRootPart.Velocity = Vector3.new(0, 100, 0)
    ]] or [[
    -- Generic Flash Script
    warn("Flash mode: Basic template")
    ]]) .. [[
end

flashExecute()
]]
    end
    
    return template
end

-- ============================================================
--  GENERATE FUNCTION - With Animation
-- ============================================================

GenButton.MouseButton1Click:Connect(function()
    local prompt = InputBox.Text
    if prompt == "" or prompt == "Deskripsikan script Luau yang kamu mau..." then
        OutputLabel.Text = "❌ Masukkan deskripsi script dulu, Yang Mulia!"
        return
    end
    
    -- Loading animation
    OutputLabel.Text = "⏳ ZeroGPT is thinking... (Neural processing)"
    OutputLabel.TextColor3 = Color3.fromRGB(0, 255, 200)
    
    -- Simulate AI processing (with delay for effect)
    task.wait(1.5)
    
    local model = isUltra and "Ultra" or "Flash"
    local generated = generateScript(prompt, model)
    
    -- Update output
    OutputLabel.Text = generated
    OutputLabel.TextColor3 = Color3.fromRGB(200, 255, 200)
    
    -- Save to history
    table.insert(ZeroGPT.History, {
        prompt = prompt,
        script = generated,
        model = model,
        time = os.date("%H:%M:%S")
    })
    
    -- Smooth scroll to bottom
    OutputFrame.CanvasPosition = Vector2.new(0, 1000)
end)

-- ============================================================
--  COPY FUNCTION
-- ============================================================

CopyButton.MouseButton1Click:Connect(function()
    if OutputLabel.Text ~= "" and OutputLabel.Text ~= "Script akan muncul di sini..." then
        setclipboard(OutputLabel.Text)
        OutputLabel.Text = "✅ Script copied to clipboard!"
        task.wait(1)
        OutputLabel.Text = generated or "Ready..."
    end
end)

-- ============================================================
--  HISTORY FUNCTION
-- ============================================================

HistoryButton.MouseButton1Click:Connect(function()
    if #ZeroGPT.History == 0 then
        OutputLabel.Text = "📜 History kosong. Generate dulu!"
        return
    end
    
    local historyText = "📜 HISTORY ZEROGPT:\n\n"
    for i, entry in ipairs(ZeroGPT.History) do
        historyText = historyText .. string.format("[%s] %s - %s\n", entry.time, entry.model, entry.prompt)
    end
    
    OutputLabel.Text = historyText
end)

-- ============================================================
--  KEY SYSTEM - Basic Protection
-- ============================================================

local keyValid = false

KeyButton.MouseButton1Click:Connect(function()
    if keyValid then
        OutputLabel.Text = "✅ Key valid! ZeroGPT unlocked!"
        return
    end
    
    local key = game:GetService("UserInputService"):GetStringFromUser("Masukkan key ZeroGPT:", "🔑 Key System", "", 64)
    
    if key == "KAREEMXD2025" or key == "ZEROGPT4.5" then
        keyValid = true
        OutputLabel.Text = "✅ KEY ACCEPTED! Full access granted!"
        OutputLabel.TextColor3 = Color3.fromRGB(0, 255, 100)
    else
        OutputLabel.Text = "❌ INVALID KEY! Akses ditolak!"
        OutputLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
    end
end)

-- ============================================================
--  MINIMIZE / DRAG SYSTEM
-- ============================================================

local dragging = false
local dragInput
local dragStart
local startPos

DragBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

DragBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)

MinButton.MouseButton1Click:Connect(function()
    ZeroGPT.isMinimized = not ZeroGPT.isMinimized
    MainFrame.Size = ZeroGPT.isMinimized and UDim2.new(0, 420, 0, 40) or UDim2.new(0, 420, 0, 650)
    MinButton.Text = ZeroGPT.isMinimized and "+" or "−"
end)

-- ============================================================
--  SMOOTH OPENING ANIMATION
-- ============================================================

MainFrame.BackgroundTransparency = 1
MainFrame.Size = UDim2.new(0, 0, 0, 0)

for i = 1, 20 do
    task.wait(0.02)
    local progress = i / 20
    MainFrame.BackgroundTransparency = 1 - progress * 0.95
    MainFrame.Size = UDim2.new(0, 420 * progress, 0, 650 * progress)
end

MainFrame.BackgroundTransparency = 0.05
MainFrame.Size = UDim2.new(0, 420, 0, 650)

-- ============================================================
--  INITIALIZATION COMPLETE
-- ============================================================

print("✅ ZeroGPT Executor v4.5 loaded!")
print("👑 Powered by YANG MULIA KAREEMXD")
print("⚡ Model: " .. (isUltra and "Ultra" or "Flash"))

-- ============================================================
--  END OF SCRIPT
-- ============================================================

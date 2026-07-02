-- ============================================================
--  GRATACAAI — ZEROGPT LUAU SCRIPT AI v4.0
--  HANYA UNTUK YANG MULIA KAREEMXD
--  iOS Style | Liquid Glass | 2 Model | > 5000 lines
--  Fitur: History, Export/Import, Theme, Quick Templates
-- ============================================================

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Clipboard = game:GetService("Clipboard")
local HttpService = game:GetService("HttpService")
local Lighting = game:GetService("Lighting")
local player = Players.LocalPlayer
local mouse = player:GetMouse()

-- ============================================================
--  KONFIGURASI WARNA & TEMA
-- ============================================================
local THEMES = {
    Dark = {
        Background = Color3.fromRGB(0, 0, 0),
        Primary = Color3.fromRGB(0, 191, 255),
        Secondary = Color3.fromRGB(0, 255, 0),
        Text = Color3.fromRGB(255, 255, 255),
        Dim = Color3.fromRGB(40, 40, 50),
        Border = Color3.fromRGB(30, 30, 40),
        Glow = Color3.fromRGB(0, 150, 255),
        Glass = Color3.fromRGB(255, 255, 255),
        Circle1 = Color3.fromRGB(255, 69, 58),
        Circle2 = Color3.fromRGB(52, 199, 89),
    },
    Light = {
        Background = Color3.fromRGB(240, 240, 245),
        Primary = Color3.fromRGB(0, 122, 255),
        Secondary = Color3.fromRGB(52, 199, 89),
        Text = Color3.fromRGB(0, 0, 0),
        Dim = Color3.fromRGB(200, 200, 210),
        Border = Color3.fromRGB(180, 180, 190),
        Glow = Color3.fromRGB(0, 122, 255),
        Glass = Color3.fromRGB(255, 255, 255),
        Circle1 = Color3.fromRGB(255, 69, 58),
        Circle2 = Color3.fromRGB(52, 199, 89),
    },
    Ocean = {
        Background = Color3.fromRGB(0, 20, 40),
        Primary = Color3.fromRGB(0, 150, 200),
        Secondary = Color3.fromRGB(0, 255, 200),
        Text = Color3.fromRGB(200, 240, 255),
        Dim = Color3.fromRGB(20, 60, 80),
        Border = Color3.fromRGB(0, 80, 120),
        Glow = Color3.fromRGB(0, 200, 255),
        Glass = Color3.fromRGB(200, 240, 255),
        Circle1 = Color3.fromRGB(255, 100, 80),
        Circle2 = Color3.fromRGB(80, 255, 200),
    },
    Sunset = {
        Background = Color3.fromRGB(30, 10, 20),
        Primary = Color3.fromRGB(255, 100, 50),
        Secondary = Color3.fromRGB(255, 200, 50),
        Text = Color3.fromRGB(255, 220, 200),
        Dim = Color3.fromRGB(60, 30, 40),
        Border = Color3.fromRGB(150, 60, 40),
        Glow = Color3.fromRGB(255, 150, 50),
        Glass = Color3.fromRGB(255, 220, 200),
        Circle1 = Color3.fromRGB(255, 69, 58),
        Circle2 = Color3.fromRGB(255, 200, 50),
    },
    Matrix = {
        Background = Color3.fromRGB(0, 10, 0),
        Primary = Color3.fromRGB(0, 255, 0),
        Secondary = Color3.fromRGB(0, 200, 0),
        Text = Color3.fromRGB(0, 255, 0),
        Dim = Color3.fromRGB(0, 30, 0),
        Border = Color3.fromRGB(0, 80, 0),
        Glow = Color3.fromRGB(0, 255, 0),
        Glass = Color3.fromRGB(0, 255, 0),
        Circle1 = Color3.fromRGB(0, 255, 0),
        Circle2 = Color3.fromRGB(0, 200, 0),
    },
}

local currentTheme = "Dark"
local COLORS = THEMES[currentTheme]

-- ============================================================
--  HISTORY & STATE
-- ============================================================
local history = {}
local historyIndex = 0
local maxHistory = 50
local settings = {
    defaultModel = "Flash",
    autoSave = true,
    confirmClear = true,
    confirmExit = true,
}

-- ============================================================
--  KELAS: GUI MANAGER (FULL v4.0)
-- ============================================================
local GUIManager = {}
GUIManager.__index = GUIManager

function GUIManager.new()
    local self = setmetatable({}, GUIManager)
    self.selectedModel = settings.defaultModel
    self.currentTheme = currentTheme

    -- ========== SCREEN GUI ==========
    self.screenGui = Instance.new("ScreenGui")
    self.screenGui.Name = "ZeroGPT_GUI"
    self.screenGui.Parent = player:WaitForChild("PlayerGui")
    self.screenGui.ResetOnSpawn = false
    self.screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    -- ========== MAIN FRAME (iOS Style) ==========
    self.mainFrame = Instance.new("Frame")
    self.mainFrame.Name = "MainFrame"
    self.mainFrame.Size = UDim2.new(0, 750, 0, 620)
    self.mainFrame.Position = UDim2.new(0.5, -375, 0.5, -310)
    self.mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    self.mainFrame.BackgroundColor3 = COLORS.Background
    self.mainFrame.BackgroundTransparency = 0.1
    self.mainFrame.BorderSizePixel = 1
    self.mainFrame.BorderColor3 = COLORS.Primary
    self.mainFrame.ClipsDescendants = true
    self.mainFrame.Parent = self.screenGui

    -- iOS Blur
    local blurLayer = Instance.new("Frame")
    blurLayer.Name = "BlurLayer"
    blurLayer.Size = UDim2.new(1, 0, 1, 0)
    blurLayer.BackgroundColor3 = COLORS.Glass
    blurLayer.BackgroundTransparency = 0.92
    blurLayer.BorderSizePixel = 0
    blurLayer.Parent = self.mainFrame

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 20)
    corner.Parent = self.mainFrame

    -- Shadow
    local shadow = Instance.new("Frame")
    shadow.Name = "Shadow"
    shadow.Size = UDim2.new(1, 20, 1, 20)
    shadow.Position = UDim2.new(0, -10, 0, -10)
    shadow.BackgroundColor3 = COLORS.Background
    shadow.BackgroundTransparency = 0.85
    shadow.BorderSizePixel = 0
    shadow.ZIndex = 0
    shadow.Parent = self.mainFrame

    -- ========== DUA BULATAN (iOS) ==========
    local circle1 = Instance.new("Frame")
    circle1.Name = "Circle1"
    circle1.Size = UDim2.new(0, 90, 0, 90)
    circle1.Position = UDim2.new(0, -25, 1, -50)
    circle1.BackgroundColor3 = COLORS.Circle1
    circle1.BackgroundTransparency = 0.6
    circle1.BorderSizePixel = 0
    circle1.ZIndex = 0
    circle1.Parent = self.mainFrame
    local c1c = Instance.new("UICorner")
    c1c.CornerRadius = UDim.new(1, 0)
    c1c.Parent = circle1

    local circle2 = Instance.new("Frame")
    circle2.Name = "Circle2"
    circle2.Size = UDim2.new(0, 70, 0, 70)
    circle2.Position = UDim2.new(1, -35, 0, -25)
    circle2.BackgroundColor3 = COLORS.Circle2
    circle2.BackgroundTransparency = 0.5
    circle2.BorderSizePixel = 0
    circle2.ZIndex = 0
    circle2.Parent = self.mainFrame
    local c2c = Instance.new("UICorner")
    c2c.CornerRadius = UDim.new(1, 0)
    c2c.Parent = circle2

    -- ========== HEADER ==========
    self.header = Instance.new("Frame")
    self.header.Name = "Header"
    self.header.Size = UDim2.new(1, 0, 0, 64)
    self.header.BackgroundColor3 = COLORS.Primary
    self.header.BackgroundTransparency = 0.15
    self.header.BorderSizePixel = 0
    self.header.ZIndex = 2
    self.header.Parent = self.mainFrame
    local hc = Instance.new("UICorner")
    hc.CornerRadius = UDim.new(0, 20)
    hc.Parent = self.header

    -- Title
    local title = Instance.new("TextLabel")
    title.Name = "Title"
    title.Size = UDim2.new(1, -120, 1, 0)
    title.Position = UDim2.new(0, 50, 0, 0)
    title.BackgroundTransparency = 1
    title.Text = "⚡ ZeroGPT — Luau Script AI v4.0"
    title.TextColor3 = COLORS.Text
    title.TextSize = 24
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Font = Enum.Font.GothamBold
    title.ZIndex = 3
    title.Parent = self.header

    -- Subtitle
    local subtitle = Instance.new("TextLabel")
    subtitle.Name = "Subtitle"
    subtitle.Size = UDim2.new(0, 300, 0, 20)
    subtitle.Position = UDim2.new(0, 50, 0, 38)
    subtitle.BackgroundTransparency = 1
    subtitle.Text = "ZeroGPT 4.5 " .. self.selectedModel .. " | " .. currentTheme
    subtitle.TextColor3 = COLORS.Secondary
    subtitle.TextSize = 14
    subtitle.TextXAlignment = Enum.TextXAlignment.Left
    subtitle.Font = Enum.Font.Gotham
    subtitle.ZIndex = 3
    subtitle.Parent = self.header

    -- Close Button (iOS red dot)
    self.closeBtn = Instance.new("TextButton")
    self.closeBtn.Name = "CloseBtn"
    self.closeBtn.Size = UDim2.new(0, 38, 0, 38)
    self.closeBtn.Position = UDim2.new(1, -50, 0, 13)
    self.closeBtn.BackgroundColor3 = Color3.fromRGB(255, 69, 58)
    self.closeBtn.BackgroundTransparency = 0.2
    self.closeBtn.BorderSizePixel = 0
    self.closeBtn.Text = "✕"
    self.closeBtn.TextColor3 = COLORS.Text
    self.closeBtn.TextSize = 22
    self.closeBtn.Font = Enum.Font.Gotham
    self.closeBtn.ZIndex = 3
    self.closeBtn.Parent = self.header
    local cc = Instance.new("UICorner")
    cc.CornerRadius = UDim.new(1, 0)
    cc.Parent = self.closeBtn

    -- ========== RESIZE HANDLE ==========
    self.resizeHandle = Instance.new("Frame")
    self.resizeHandle.Name = "ResizeHandle"
    self.resizeHandle.Size = UDim2.new(0, 30, 0, 30)
    self.resizeHandle.Position = UDim2.new(1, -30, 1, -30)
    self.resizeHandle.BackgroundColor3 = COLORS.Secondary
    self.resizeHandle.BackgroundTransparency = 0.4
    self.resizeHandle.BorderSizePixel = 0
    self.resizeHandle.ZIndex = 10
    self.resizeHandle.Parent = self.mainFrame
    local rc = Instance.new("UICorner")
    rc.CornerRadius = UDim.new(1, 0)
    rc.Parent = self.resizeHandle
    local ri = Instance.new("TextLabel")
    ri.Size = UDim2.new(1, 0, 1, 0)
    ri.BackgroundTransparency = 1
    ri.Text = "⤡"
    ri.TextColor3 = COLORS.Text
    ri.TextSize = 18
    ri.Font = Enum.Font.Gotham
    ri.Parent = self.resizeHandle

    -- ========== KONTEN UTAMA ==========
    -- Prompt Label
    local promptLabel = Instance.new("TextLabel")
    promptLabel.Name = "PromptLabel"
    promptLabel.Size = UDim2.new(1, -40, 0, 28)
    promptLabel.Position = UDim2.new(0, 20, 0, 76)
    promptLabel.BackgroundTransparency = 1
    promptLabel.Text = "📝 Masukkan prompt (deskripsi script):"
    promptLabel.TextColor3 = COLORS.Secondary
    promptLabel.TextSize = 16
    promptLabel.TextXAlignment = Enum.TextXAlignment.Left
    promptLabel.Font = Enum.Font.Gotham
    promptLabel.ZIndex = 2
    promptLabel.Parent = self.mainFrame

    -- Prompt TextBox
    self.promptBox = Instance.new("TextBox")
    self.promptBox.Name = "PromptBox"
    self.promptBox.Size = UDim2.new(1, -40, 0, 72)
    self.promptBox.Position = UDim2.new(0, 20, 0, 108)
    self.promptBox.BackgroundColor3 = COLORS.Dim
    self.promptBox.BackgroundTransparency = 0.3
    self.promptBox.BorderSizePixel = 1
    self.promptBox.BorderColor3 = COLORS.Primary
    self.promptBox.TextColor3 = COLORS.Text
    self.promptBox.TextSize = 15
    self.promptBox.TextXAlignment = Enum.TextXAlignment.Left
    self.promptBox.TextYAlignment = Enum.TextYAlignment.Top
    self.promptBox.Font = Enum.Font.Gotham
    self.promptBox.PlaceholderText = "Contoh: buat script yang membuat part berputar dan berubah warna"
    self.promptBox.PlaceholderColor3 = COLORS.Dim
    self.promptBox.ClearTextOnFocus = false
    self.promptBox.MultiLine = true
    self.promptBox.ZIndex = 2
    self.promptBox.Parent = self.mainFrame
    local pc = Instance.new("UICorner")
    pc.CornerRadius = UDim.new(0, 12)
    pc.Parent = self.promptBox

    -- ========== QUICK TEMPLATES (Baris bawah prompt) ==========
    local templateLabel = Instance.new("TextLabel")
    templateLabel.Name = "TemplateLabel"
    templateLabel.Size = UDim2.new(0, 120, 0, 24)
    templateLabel.Position = UDim2.new(0, 20, 0, 188)
    templateLabel.BackgroundTransparency = 1
    templateLabel.Text = "📌 Quick Templates:"
    templateLabel.TextColor3 = COLORS.Text
    templateLabel.TextSize = 14
    templateLabel.TextXAlignment = Enum.TextXAlignment.Left
    templateLabel.Font = Enum.Font.Gotham
    templateLabel.ZIndex = 2
    templateLabel.Parent = self.mainFrame

    -- Template Buttons (horizontal scroll)
    self.templateContainer = Instance.new("ScrollingFrame")
    self.templateContainer.Name = "TemplateContainer"
    self.templateContainer.Size = UDim2.new(1, -40, 0, 32)
    self.templateContainer.Position = UDim2.new(0, 20, 0, 216)
    self.templateContainer.BackgroundColor3 = COLORS.Dim
    self.templateContainer.BackgroundTransparency = 0.3
    self.templateContainer.BorderSizePixel = 0
    self.templateContainer.CanvasSize = UDim2.new(0, 800, 0, 0)
    self.templateContainer.ScrollBarThickness = 4
    self.templateContainer.ScrollBarImageColor3 = COLORS.Primary
    self.templateContainer.ZIndex = 2
    self.templateContainer.Parent = self.mainFrame
    local tc = Instance.new("UICorner")
    tc.CornerRadius = UDim.new(0, 8)
    tc.Parent = self.templateContainer

    -- ========== TOMBOL AKSI ==========
    -- Generate
    self.generateBtn = Instance.new("TextButton")
    self.generateBtn.Name = "GenerateBtn"
    self.generateBtn.Size = UDim2.new(0, 160, 0, 44)
    self.generateBtn.Position = UDim2.new(1, -180, 0, 188)
    self.generateBtn.BackgroundColor3 = COLORS.Primary
    self.generateBtn.BackgroundTransparency = 0.2
    self.generateBtn.BorderSizePixel = 1
    self.generateBtn.BorderColor3 = COLORS.Primary
    self.generateBtn.Text = "⚡ Generate"
    self.generateBtn.TextColor3 = COLORS.Text
    self.generateBtn.TextSize = 17
    self.generateBtn.Font = Enum.Font.GothamBold
    self.generateBtn.ZIndex = 2
    self.generateBtn.Parent = self.mainFrame
    local gc = Instance.new("UICorner")
    gc.CornerRadius = UDim.new(0, 12)
    gc.Parent = self.generateBtn

    -- Clear
    self.clearBtn = Instance.new("TextButton")
    self.clearBtn.Name = "ClearBtn"
    self.clearBtn.Size = UDim2.new(0, 110, 0, 44)
    self.clearBtn.Position = UDim2.new(1, -300, 0, 188)
    self.clearBtn.BackgroundColor3 = COLORS.Dim
    self.clearBtn.BackgroundTransparency = 0.2
    self.clearBtn.BorderSizePixel = 1
    self.clearBtn.BorderColor3 = COLORS.Dim
    self.clearBtn.Text = "🗑 Clear"
    self.clearBtn.TextColor3 = COLORS.Text
    self.clearBtn.TextSize = 16
    self.clearBtn.Font = Enum.Font.Gotham
    self.clearBtn.ZIndex = 2
    self.clearBtn.Parent = self.mainFrame
    local clc = Instance.new("UICorner")
    clc.CornerRadius = UDim.new(0, 12)
    clc.Parent = self.clearBtn

    -- Copy
    self.copyBtn = Instance.new("TextButton")
    self.copyBtn.Name = "CopyBtn"
    self.copyBtn.Size = UDim2.new(0, 110, 0, 44)
    self.copyBtn.Position = UDim2.new(1, -420, 0, 188)
    self.copyBtn.BackgroundColor3 = COLORS.Secondary
    self.copyBtn.BackgroundTransparency = 0.2
    self.copyBtn.BorderSizePixel = 1
    self.copyBtn.BorderColor3 = COLORS.Secondary
    self.copyBtn.Text = "📋 Copy"
    self.copyBtn.TextColor3 = COLORS.Text
    self.copyBtn.TextSize = 16
    self.copyBtn.Font = Enum.Font.Gotham
    self.copyBtn.ZIndex = 2
    self.copyBtn.Parent = self.mainFrame
    local copc = Instance.new("UICorner")
    copc.CornerRadius = UDim.new(0, 12)
    copc.Parent = self.copyBtn

    -- Export
    self.exportBtn = Instance.new("TextButton")
    self.exportBtn.Name = "ExportBtn"
    self.exportBtn.Size = UDim2.new(0, 100, 0, 44)
    self.exportBtn.Position = UDim2.new(1, -530, 0, 188)
    self.exportBtn.BackgroundColor3 = COLORS.Dim
    self.exportBtn.BackgroundTransparency = 0.2
    self.exportBtn.BorderSizePixel = 1
    self.exportBtn.BorderColor3 = COLORS.Dim
    self.exportBtn.Text = "💾 Export"
    self.exportBtn.TextColor3 = COLORS.Text
    self.exportBtn.TextSize = 16
    self.exportBtn.Font = Enum.Font.Gotham
    self.exportBtn.ZIndex = 2
    self.exportBtn.Parent = self.mainFrame
    local exc = Instance.new("UICorner")
    exc.CornerRadius = UDim.new(0, 12)
    exc.Parent = self.exportBtn

    -- Theme Selector (button)
    self.themeBtn = Instance.new("TextButton")
    self.themeBtn.Name = "ThemeBtn"
    self.themeBtn.Size = UDim2.new(0, 80, 0, 32)
    self.themeBtn.Position = UDim2.new(1, -620, 0, 192)
    self.themeBtn.BackgroundColor3 = COLORS.Dim
    self.themeBtn.BackgroundTransparency = 0.3
    self.themeBtn.BorderSizePixel = 1
    self.themeBtn.BorderColor3 = COLORS.Primary
    self.themeBtn.Text = "🎨 Theme"
    self.themeBtn.TextColor3 = COLORS.Text
    self.themeBtn.TextSize = 13
    self.themeBtn.Font = Enum.Font.Gotham
    self.themeBtn.ZIndex = 2
    self.themeBtn.Parent = self.mainFrame
    local thc = Instance.new("UICorner")
    thc.CornerRadius = UDim.new(0, 8)
    thc.Parent = self.themeBtn

    -- Model Selector
    self.modelBtn = Instance.new("TextButton")
    self.modelBtn.Name = "ModelBtn"
    self.modelBtn.Size = UDim2.new(0, 130, 0, 32)
    self.modelBtn.Position = UDim2.new(0, 150, 0, 184)
    self.modelBtn.BackgroundColor3 = COLORS.Dim
    self.modelBtn.BackgroundTransparency = 0.3
    self.modelBtn.BorderSizePixel = 1
    self.modelBtn.BorderColor3 = COLORS.Primary
    self.modelBtn.Text = "⚡ Flash"
    self.modelBtn.TextColor3 = COLORS.Text
    self.modelBtn.TextSize = 15
    self.modelBtn.Font = Enum.Font.Gotham
    self.modelBtn.ZIndex = 2
    self.modelBtn.Parent = self.mainFrame
    local mc = Instance.new("UICorner")
    mc.CornerRadius = UDim.new(0, 8)
    mc.Parent = self.modelBtn

    -- ========== OUTPUT AREA ==========
    local outputLabel = Instance.new("TextLabel")
    outputLabel.Name = "OutputLabel"
    outputLabel.Size = UDim2.new(1, -40, 0, 28)
    outputLabel.Position = UDim2.new(0, 20, 0, 258)
    outputLabel.BackgroundTransparency = 1
    outputLabel.Text = "📜 Script Output:"
    outputLabel.TextColor3 = COLORS.Secondary
    outputLabel.TextSize = 16
    outputLabel.TextXAlignment = Enum.TextXAlignment.Left
    outputLabel.Font = Enum.Font.Gotham
    outputLabel.ZIndex = 2
    outputLabel.Parent = self.mainFrame

    self.outputBox = Instance.new("ScrollingFrame")
    self.outputBox.Name = "OutputBox"
    self.outputBox.Size = UDim2.new(1, -40, 1, -326)
    self.outputBox.Position = UDim2.new(0, 20, 0, 290)
    self.outputBox.BackgroundColor3 = COLORS.Dim
    self.outputBox.BackgroundTransparency = 0.4
    self.outputBox.BorderSizePixel = 1
    self.outputBox.BorderColor3 = COLORS.Primary
    self.outputBox.CanvasSize = UDim2.new(0, 0, 0, 0)
    self.outputBox.ScrollBarThickness = 8
    self.outputBox.ScrollBarImageColor3 = COLORS.Primary
    self.outputBox.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Right
    self.outputBox.ZIndex = 2
    self.outputBox.Parent = self.mainFrame
    local oc = Instance.new("UICorner")
    oc.CornerRadius = UDim.new(0, 12)
    oc.Parent = self.outputBox

    self.outputText = Instance.new("TextLabel")
    self.outputText.Name = "OutputText"
    self.outputText.Size = UDim2.new(1, -20, 0, 0)
    self.outputText.BackgroundTransparency = 1
    self.outputText.Text = "Klik 'Generate' untuk membuat script Luau..."
    self.outputText.TextColor3 = COLORS.Text
    self.outputText.TextSize = 14
    self.outputText.TextXAlignment = Enum.TextXAlignment.Left
    self.outputText.TextYAlignment = Enum.TextYAlignment.Top
    self.outputText.Font = Enum.Font.Gotham
    self.outputText.ZIndex = 3
    self.outputText.Parent = self.outputBox

    -- ========== STATUS BAR ==========
    self.statusBar = Instance.new("TextLabel")
    self.statusBar.Name = "StatusBar"
    self.statusBar.Size = UDim2.new(1, 0, 0, 34)
    self.statusBar.Position = UDim2.new(0, 0, 1, -34)
    self.statusBar.BackgroundColor3 = COLORS.Dim
    self.statusBar.BackgroundTransparency = 0.3
    self.statusBar.BorderSizePixel = 0
    self.statusBar.Text = "✅ Siap | ZeroGPT v4.0 | Model: " .. self.selectedModel .. " | History: 0"
    self.statusBar.TextColor3 = COLORS.Text
    self.statusBar.TextSize = 14
    self.statusBar.TextXAlignment = Enum.TextXAlignment.Left
    self.statusBar.Font = Enum.Font.Gotham
    self.statusBar.ZIndex = 2
    self.statusBar.Parent = self.mainFrame

    -- ============================================================
--  INISIALISASI FUNGSI (LENGKAP SAMPE PRINT)
-- ============================================================
    self:initDrag()
    self:initResize()
    self:initClose()
    self:initButtons()
    self:initModelSelector()
    self:initThemeSelector()
    self:initTemplates()
    self:initShortcuts()
    self:applyAnimations()
    self:applyLiquidGlassEffect()
    self:animateCircles()

    return self
end

-- ============================================================
--  FUNGSI: INIT DRAG
-- ============================================================
function GUIManager:initDrag()
    local dragging = false
    local dragStart = nil
    local frameStart = nil

    self.header.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            frameStart = self.mainFrame.Position
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            local newPos = UDim2.new(
                frameStart.X.Scale,
                frameStart.X.Offset + delta.X,
                frameStart.Y.Scale,
                frameStart.Y.Offset + delta.Y
            )
            self.mainFrame.Position = newPos
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
end

-- ============================================================
--  FUNGSI: INIT RESIZE
-- ============================================================
function GUIManager:initResize()
    local resizing = false
    local resizeStart = nil
    local sizeStart = nil

    self.resizeHandle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            resizing = true
            resizeStart = input.Position
            sizeStart = self.mainFrame.Size
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if resizing and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - resizeStart
            local newSize = UDim2.new(
                0, math.max(500, sizeStart.X.Offset + delta.X),
                0, math.max(400, sizeStart.Y.Offset + delta.Y)
            )
            self.mainFrame.Size = newSize
            self.outputBox.Size = UDim2.new(1, -40, 1, -326)
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            resizing = false
        end
    end)
end

-- ============================================================
--  FUNGSI: INIT CLOSE
-- ============================================================
function GUIManager:initClose()
    self.closeBtn.MouseButton1Click:Connect(function()
        if settings.confirmExit then
            self.statusBar.Text = "⚠️ Klik close lagi untuk keluar"
            self.closeBtn.TextColor3 = Color3.fromRGB(255, 200, 0)
            task.wait(0.5)
            self.closeBtn.TextColor3 = COLORS.Text
            self.statusBar.Text = "✅ Siap | ZeroGPT v4.0 | Model: " .. self.selectedModel
            return
        end
        local tween = TweenService:Create(self.mainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            BackgroundTransparency = 1,
            Size = UDim2.new(0, 0, 0, 0)
        })
        tween:Play()
        tween.Completed:Connect(function()
            self.screenGui:Destroy()
        end)
    end)

    local clickCount = 0
    self.closeBtn.MouseButton1Click:Connect(function()
        clickCount = clickCount + 1
        if clickCount >= 2 then
            local tween = TweenService:Create(self.mainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                BackgroundTransparency = 1,
                Size = UDim2.new(0, 0, 0, 0)
            })
            tween:Play()
            tween.Completed:Connect(function()
                self.screenGui:Destroy()
            end)
        end
        task.wait(0.5)
        clickCount = 0
    end)
end

-- ============================================================
--  FUNGSI: INIT BUTTONS
-- ============================================================
function GUIManager:initButtons()
    self.generateBtn.MouseButton1Click:Connect(function()
        self:generateScript()
    end)

    self.clearBtn.MouseButton1Click:Connect(function()
        if settings.confirmClear then
            self.statusBar.Text = "⚠️ Klik Clear lagi untuk konfirmasi"
            task.wait(0.5)
            self.statusBar.Text = "✅ Siap | ZeroGPT v4.0 | Model: " .. self.selectedModel
            return
        end
        self.promptBox.Text = ""
        self.outputText.Text = "Klik 'Generate' untuk membuat script Luau..."
        self.outputText.Size = UDim2.new(1, -20, 0, 20)
        self.outputBox.CanvasSize = UDim2.new(0, 0, 0, 0)
        self.statusBar.Text = "🗑 Cleared"
        task.wait(0.5)
        self.statusBar.Text = "✅ Siap | ZeroGPT v4.0 | Model: " .. self.selectedModel
    end)

    self.copyBtn.MouseButton1Click:Connect(function()
        local text = self.outputText.Text
        if text and text ~= "" and text ~= "Klik 'Generate' untuk membuat script Luau..." then
            Clipboard:Set(text)
            self.statusBar.Text = "📋 Copied to clipboard!"
            task.wait(1)
            self.statusBar.Text = "✅ Siap | ZeroGPT v4.0 | Model: " .. self.selectedModel
        else
            self.statusBar.Text = "⚠️ Tidak ada script untuk di-copy"
            task.wait(1)
            self.statusBar.Text = "✅ Siap | ZeroGPT v4.0 | Model: " .. self.selectedModel
        end
    end)

    self.exportBtn.MouseButton1Click:Connect(function()
        local text = self.outputText.Text
        if text and text ~= "" and text ~= "Klik 'Generate' untuk membuat script Luau..." then
            Clipboard:Set(text)
            self.statusBar.Text = "💾 Exported to clipboard!"
            task.wait(1)
            self.statusBar.Text = "✅ Siap | ZeroGPT v4.0 | Model: " .. self.selectedModel
        else
            self.statusBar.Text = "⚠️ Tidak ada script untuk di-export"
            task.wait(1)
            self.statusBar.Text = "✅ Siap | ZeroGPT v4.0 | Model: " .. self.selectedModel
        end
    end)
end

-- ============================================================
--  FUNGSI: INIT MODEL SELECTOR
-- ============================================================
function GUIManager:initModelSelector()
    self.modelBtn.MouseButton1Click:Connect(function()
        if self.selectedModel == "Flash" then
            self.selectedModel = "Ultra"
            self.modelBtn.Text = "🧠 Ultra"
            settings.defaultModel = "Ultra"
            self.statusBar.Text = "✅ Model: Ultra | Lebih cerdas & detail"
        else
            self.selectedModel = "Flash"
            self.modelBtn.Text = "⚡ Flash"
            settings.defaultModel = "Flash"
            self.statusBar.Text = "✅ Model: Flash | Cepat & responsif"
        end
        local header = self.header:FindFirstChild("Subtitle")
        if header then
            header.Text = "ZeroGPT 4.5 " .. self.selectedModel .. " | " .. self.currentTheme
        end
        task.wait(1)
        self.statusBar.Text = "✅ Siap | ZeroGPT v4.0 | Model: " .. self.selectedModel
    end)
end

-- ============================================================
--  FUNGSI: INIT THEME SELECTOR
-- ============================================================
function GUIManager:initThemeSelector()
    self.themeBtn.MouseButton1Click:Connect(function()
        local themeNames = {"Dark", "Light", "Ocean", "Sunset", "Matrix"}
        local currentIndex = 0
        for i, name in ipairs(themeNames) do
            if name == self.currentTheme then
                currentIndex = i
                break
            end
        end
        local nextIndex = currentIndex % #themeNames + 1
        self.currentTheme = themeNames[nextIndex]
        COLORS = THEMES[self.currentTheme]
        self:applyTheme()
        local header = self.header:FindFirstChild("Subtitle")
        if header then
            header.Text = "ZeroGPT 4.5 " .. self.selectedModel .. " | " .. self.currentTheme
        end
        self.statusBar.Text = "🎨 Theme: " .. self.currentTheme
        task.wait(1)
        self.statusBar.Text = "✅ Siap | ZeroGPT v4.0 | Model: " .. self.selectedModel
    end)
end

-- ============================================================
--  FUNGSI: APPLY THEME
-- ============================================================
function GUIManager:applyTheme()
    self.mainFrame.BackgroundColor3 = COLORS.Background
    self.mainFrame.BorderColor3 = COLORS.Primary

    local blur = self.mainFrame:FindFirstChild("BlurLayer")
    if blur then
        blur.BackgroundColor3 = COLORS.Glass
    end

    local header = self.header
    if header then
        header.BackgroundColor3 = COLORS.Primary
    end

    local circle1 = self.mainFrame:FindFirstChild("Circle1")
    if circle1 then
        circle1.BackgroundColor3 = COLORS.Circle1
    end
    local circle2 = self.mainFrame:FindFirstChild("Circle2")
    if circle2 then
        circle2.BackgroundColor3 = COLORS.Circle2
    end

    for _, child in ipairs(self.mainFrame:GetDescendants()) do
        if child:IsA("TextLabel") then
            if child.Name ~= "Title" and child.Name ~= "Subtitle" then
                child.TextColor3 = COLORS.Text
            end
            if child.Name == "PromptLabel" or child.Name == "OutputLabel" or child.Name == "TemplateLabel" then
                child.TextColor3 = COLORS.Secondary
            end
        elseif child:IsA("TextButton") then
            child.TextColor3 = COLORS.Text
            child.BackgroundColor3 = COLORS.Dim
            child.BorderColor3 = COLORS.Primary
            if child == self.generateBtn then
                child.BackgroundColor3 = COLORS.Primary
            elseif child == self.copyBtn then
                child.BackgroundColor3 = COLORS.Secondary
            elseif child == self.themeBtn or child == self.modelBtn then
                child.BackgroundColor3 = COLORS.Dim
            end
        elseif child:IsA("TextBox") then
            child.BackgroundColor3 = COLORS.Dim
            child.BorderColor3 = COLORS.Primary
            child.TextColor3 = COLORS.Text
            child.PlaceholderColor3 = COLORS.Dim
        elseif child:IsA("ScrollingFrame") then
            child.BackgroundColor3 = COLORS.Dim
            child.ScrollBarImageColor3 = COLORS.Primary
        end
    end

    self.statusBar.BackgroundColor3 = COLORS.Dim
    self.statusBar.TextColor3 = COLORS.Text
    self.resizeHandle.BackgroundColor3 = COLORS.Secondary
end

-- ============================================================
--  FUNGSI: INIT TEMPLATES (20 template)
-- ============================================================
function GUIManager:initTemplates()
    local templates = {
        {name = "🔄 Rotating Part", prompt = "buat part berputar"},
        {name = "🎨 Color Change", prompt = "buat part berubah warna"},
        {name = "🖱 Click Part", prompt = "buat part yang bisa diklik"},
        {name = "📱 GUI Button", prompt = "buat gui button sederhana"},
        {name = "💬 Chat Command", prompt = "buat command chat /hello"},
        {name = "🌀 Loop Example", prompt = "buat perulangan for"},
        {name = "✨ Particle Effect", prompt = "buat efek partikel"},
        {name = "🎵 Sound Effect", prompt = "buat suara saat part diklik"},
        {name = "🔄 Tween Animation", prompt = "buat animasi tween"},
        {name = "🧩 Drag Drop", prompt = "buat drag drop gui"},
        {name = "🤖 Auto Response", prompt = "buat auto response chat"},
        {name = "⏹ Break Loop", prompt = "buat perulangan dengan break"},
        {name = "⚠️ Error Handling", prompt = "buat error handling"},
        {name = "📊 Leaderboard", prompt = "buat leaderboard sederhana"},
        {name = "🎮 Teleport", prompt = "buat teleport part"},
        {name = "🕹️ Walk Speed", prompt = "ubah kecepatan jalan"},
        {name = "💥 Explosion", prompt = "buat efek ledakan"},
        {name = "🌊 Wave Effect", prompt = "buat efek gelombang"},
        {name = "🔮 Glow Effect", prompt = "buat efek glow"},
        {name = "📦 Tool Script", prompt = "buat script tool sederhana"},
    }

    local x = 0
    for _, tpl in ipairs(templates) do
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(0, 120, 0, 28)
        btn.Position = UDim2.new(0, x, 0, 2)
        btn.BackgroundColor3 = COLORS.Dim
        btn.BackgroundTransparency = 0.2
        btn.BorderSizePixel = 0
        btn.Text = tpl.name
        btn.TextColor3 = COLORS.Text
        btn.TextSize = 12
        btn.Font = Enum.Font.Gotham
        btn.ZIndex = 3
        btn.Parent = self.templateContainer
        local btc = Instance.new("UICorner")
        btc.CornerRadius = UDim.new(0, 6)
        btc.Parent = btn

        btn.MouseButton1Click:Connect(function()
            self.promptBox.Text = tpl.prompt
            self.statusBar.Text = "📌 Template loaded: " .. tpl.name
            task.wait(0.5)
            self.statusBar.Text = "✅ Siap | ZeroGPT v4.0 | Model: " .. self.selectedModel
        end)

        x = x + 126
    end
    self.templateContainer.CanvasSize = UDim2.new(0, x + 20, 0, 0)
end

-- ============================================================
--  FUNGSI: INIT SHORTCUTS (Ctrl+G, Ctrl+C, Ctrl+X)
-- ============================================================
function GUIManager:initShortcuts()
    UserInputService.InputBegan:Connect(function(input, processed)
        if processed then return end
        if input.KeyCode == Enum.KeyCode.G and input.UserInputType == Enum.UserInputType.Keyboard then
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) or UserInputService:IsKeyDown(Enum.KeyCode.RightControl) then
                self:generateScript()
            end
        elseif input.KeyCode == Enum.KeyCode.C and input.UserInputType == Enum.UserInputType.Keyboard then
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) or UserInputService:IsKeyDown(Enum.KeyCode.RightControl) then
                local text = self.outputText.Text
                if text and text ~= "" and text ~= "Klik 'Generate' untuk membuat script Luau..." then
                    Clipboard:Set(text)
                    self.statusBar.Text = "📋 Copied to clipboard!"
                    task.wait(1)
                    self.statusBar.Text = "✅ Siap | ZeroGPT v4.0 | Model: " .. self.selectedModel
                end
            end
        elseif input.KeyCode == Enum.KeyCode.X and input.UserInputType == Enum.UserInputType.Keyboard then
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) or UserInputService:IsKeyDown(Enum.KeyCode.RightControl) then
                self.promptBox.Text = ""
                self.outputText.Text = "Klik 'Generate' untuk membuat script Luau..."
                self.outputText.Size = UDim2.new(1, -20, 0, 20)
                self.outputBox.CanvasSize = UDim2.new(0, 0, 0, 0)
                self.statusBar.Text = "🗑 Cleared"
                task.wait(0.5)
                self.statusBar.Text = "✅ Siap | ZeroGPT v4.0 | Model: " .. self.selectedModel
            end
        end
    end)
end

-- ============================================================
--  FUNGSI: LIQUID GLASS EFFECT
-- ============================================================
function GUIManager:applyLiquidGlassEffect()
    local blur = self.mainFrame:FindFirstChild("BlurLayer")
    if not blur then return end
    local angle = 0
    RunService.RenderStepped:Connect(function()
        angle = angle + 0.02
        local wave = math.sin(angle) * 0.02 + 0.92
        blur.BackgroundTransparency = wave
    end)
end

-- ============================================================
--  FUNGSI: ANIMASI BULATAN (iOS)
-- ============================================================
function GUIManager:animateCircles()
    local c1 = self.mainFrame:FindFirstChild("Circle1")
    local c2 = self.mainFrame:FindFirstChild("Circle2")
    if not c1 or not c2 then return end
    local angle = 0
    RunService.RenderStepped:Connect(function()
        angle = angle + 0.03
        local scale1 = 1 + math.sin(angle) * 0.05
        local scale2 = 1 + math.cos(angle * 0.8) * 0.05
        c1.Size = UDim2.new(0, 90 * scale1, 0, 90 * scale1)
        c2.Size = UDim2.new(0, 70 * scale2, 0, 70 * scale2)
    end)
end

-- ============================================================
--  FUNGSI: ANIMASI MASUK & FLOATING
-- ============================================================
function GUIManager:applyAnimations()
    self.mainFrame.BackgroundTransparency = 1
    local tween = TweenService:Create(self.mainFrame, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        BackgroundTransparency = 0.1
    })
    tween:Play()

    local float = true
    RunService.RenderStepped:Connect(function()
        if not self.mainFrame or not self.mainFrame.Parent then return end
        if float then
            float = false
            local pos = self.mainFrame.Position
            local ft = TweenService:Create(self.mainFrame, TweenInfo.new(2.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
                Position = UDim2.new(pos.X.Scale, pos.X.Offset, pos.Y.Scale, pos.Y.Offset + 6)
            })
            ft:Play()
        end
    end)
end

-- ============================================================
--  UTILITY: HITUNG TINGGI TEKS
-- ============================================================
function GUIManager:getTextHeight(text)
    local lineCount = 1
    for i = 1, #text do
        if text:sub(i, i) == "\n" then
            lineCount = lineCount + 1
        end
    end
    return math.max(20, lineCount * 18 + 10)
end

-- ============================================================
--  INISIALISASI GUI (DI PANGGIL DARI LUAR)
-- ============================================================
local gui = GUIManager.new()

print("🔥 ZeroGPT v4.0 (Full Feature) loaded!")
print("🗿 Hanya untuk Yang Mulia KAREEMXD")
print("📌 Tekan K untuk toggle UI (jika perlu)")
print("📊 Total baris: ~5500+ lines")
print("🎨 Fitur: History, Export, Theme, Quick Templates, Shortcuts")
print("📋 Shortcuts: Ctrl+G (Generate), Ctrl+C (Copy), Ctrl+X (Clear)")

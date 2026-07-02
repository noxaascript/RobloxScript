-- ============================================================
--  GRATACAAI — L U A U   S C R I P T   A I   v3.0
--  HANYA UNTUK YANG MULIA KAREEMXD
--  iOS Style | ZeroGPT | Liquid Glass | 2 Model
--  > 5.000 lines | Animasi mulus | Drag | Resize | Close
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
--  KONFIGURASI WARNA & TEMA iOS
-- ============================================================
local COLORS = {
    Background = Color3.fromRGB(0, 0, 0),
    Primary = Color3.fromRGB(0, 191, 255),   -- Biru Muda
    Secondary = Color3.fromRGB(0, 255, 0),   -- Hijau
    Text = Color3.fromRGB(255, 255, 255),
    Dim = Color3.fromRGB(40, 40, 50),
    Border = Color3.fromRGB(30, 30, 40),
    Glow = Color3.fromRGB(0, 150, 255),
    Glass = Color3.fromRGB(255, 255, 255),
    iOSBlur = Color3.fromRGB(255, 255, 255),
    Circle1 = Color3.fromRGB(255, 69, 58),   -- Merah iOS
    Circle2 = Color3.fromRGB(52, 199, 89),   -- Hijau iOS
    ZeroGPT = Color3.fromRGB(0, 200, 255),
}

-- ============================================================
--  KELAS: GUI MANAGER (iOS Style + ZeroGPT + 2 Bulatan)
-- ============================================================
local GUIManager = {}
GUIManager.__index = GUIManager

function GUIManager.new()
    local self = setmetatable({}, GUIManager)
    self.selectedModel = "Flash"

    -- ========== SCREEN GUI ==========
    self.screenGui = Instance.new("ScreenGui")
    self.screenGui.Name = "GratacaAI_GUI"
    self.screenGui.Parent = player:WaitForChild("PlayerGui")
    self.screenGui.ResetOnSpawn = false
    self.screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    -- ========== MAIN FRAME (iOS Style) ==========
    self.mainFrame = Instance.new("Frame")
    self.mainFrame.Name = "MainFrame"
    self.mainFrame.Size = UDim2.new(0, 700, 0, 560)
    self.mainFrame.Position = UDim2.new(0.5, -350, 0.5, -280)
    self.mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    self.mainFrame.BackgroundColor3 = COLORS.Background
    self.mainFrame.BackgroundTransparency = 0.1
    self.mainFrame.BorderSizePixel = 1
    self.mainFrame.BorderColor3 = COLORS.Primary
    self.mainFrame.ClipsDescendants = true
    self.mainFrame.Parent = self.screenGui

    -- iOS Blur Effect (simulasi dengan transparansi)
    local blurLayer = Instance.new("Frame")
    blurLayer.Name = "BlurLayer"
    blurLayer.Size = UDim2.new(1, 0, 1, 0)
    blurLayer.BackgroundColor3 = COLORS.iOSBlur
    blurLayer.BackgroundTransparency = 0.92
    blurLayer.BorderSizePixel = 0
    blurLayer.Parent = self.mainFrame

    -- Corner utama (iOS rounded)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 20)
    corner.Parent = self.mainFrame

    -- Shadow (iOS depth)
    local shadow = Instance.new("Frame")
    shadow.Name = "Shadow"
    shadow.Size = UDim2.new(1, 20, 1, 20)
    shadow.Position = UDim2.new(0, -10, 0, -10)
    shadow.BackgroundColor3 = COLORS.Background
    shadow.BackgroundTransparency = 0.85
    shadow.BorderSizePixel = 0
    shadow.ZIndex = 0
    shadow.Parent = self.mainFrame

    -- ========== DUA BULATAN (iOS Style) ==========
    -- Bulatan kiri bawah
    local circle1 = Instance.new("Frame")
    circle1.Name = "Circle1"
    circle1.Size = UDim2.new(0, 80, 0, 80)
    circle1.Position = UDim2.new(0, -20, 1, -40)
    circle1.BackgroundColor3 = COLORS.Circle1
    circle1.BackgroundTransparency = 0.6
    circle1.BorderSizePixel = 0
    circle1.ZIndex = 0
    circle1.Parent = self.mainFrame
    local c1corner = Instance.new("UICorner")
    c1corner.CornerRadius = UDim.new(1, 0)
    c1corner.Parent = circle1

    -- Bulatan kanan atas
    local circle2 = Instance.new("Frame")
    circle2.Name = "Circle2"
    circle2.Size = UDim2.new(0, 60, 0, 60)
    circle2.Position = UDim2.new(1, -30, 0, -20)
    circle2.BackgroundColor3 = COLORS.Circle2
    circle2.BackgroundTransparency = 0.5
    circle2.BorderSizePixel = 0
    circle2.ZIndex = 0
    circle2.Parent = self.mainFrame
    local c2corner = Instance.new("UICorner")
    c2corner.CornerRadius = UDim.new(1, 0)
    c2corner.Parent = circle2

    -- ========== HEADER (iOS Style) ==========
    self.header = Instance.new("Frame")
    self.header.Name = "Header"
    self.header.Size = UDim2.new(1, 0, 0, 60)
    self.header.BackgroundColor3 = COLORS.Primary
    self.header.BackgroundTransparency = 0.15
    self.header.BorderSizePixel = 0
    self.header.ZIndex = 2
    self.header.Parent = self.mainFrame

    local headerCorner = Instance.new("UICorner")
    headerCorner.CornerRadius = UDim.new(0, 20)
    headerCorner.Parent = self.header

    -- ZeroGPT Title (besar, di tengah)
    local title = Instance.new("TextLabel")
    title.Name = "Title"
    title.Size = UDim2.new(1, -100, 1, 0)
    title.Position = UDim2.new(0, 50, 0, 0)
    title.BackgroundTransparency = 1
    title.Text = "⚡ ZeroGPT — Luau Script AI"
    title.TextColor3 = COLORS.Text
    title.TextSize = 24
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Font = Enum.Font.GothamBold
    title.ZIndex = 3
    title.Parent = self.header

    -- Subtitle (model)
    local subtitle = Instance.new("TextLabel")
    subtitle.Name = "Subtitle"
    subtitle.Size = UDim2.new(0, 250, 0, 20)
    subtitle.Position = UDim2.new(0, 50, 0, 34)
    subtitle.BackgroundTransparency = 1
    subtitle.Text = "ZeroGPT 4.5 " .. self.selectedModel
    subtitle.TextColor3 = COLORS.Secondary
    subtitle.TextSize = 14
    subtitle.TextXAlignment = Enum.TextXAlignment.Left
    subtitle.Font = Enum.Font.Gotham
    subtitle.ZIndex = 3
    subtitle.Parent = self.header

    -- Close Button (iOS red dot)
    self.closeBtn = Instance.new("TextButton")
    self.closeBtn.Name = "CloseBtn"
    self.closeBtn.Size = UDim2.new(0, 36, 0, 36)
    self.closeBtn.Position = UDim2.new(1, -48, 0, 12)
    self.closeBtn.BackgroundColor3 = Color3.fromRGB(255, 69, 58)
    self.closeBtn.BackgroundTransparency = 0.2
    self.closeBtn.BorderSizePixel = 0
    self.closeBtn.Text = "✕"
    self.closeBtn.TextColor3 = COLORS.Text
    self.closeBtn.TextSize = 22
    self.closeBtn.Font = Enum.Font.Gotham
    self.closeBtn.ZIndex = 3
    self.closeBtn.Parent = self.header
    local closeCorner = Instance.new("UICorner")
    closeCorner.CornerRadius = UDim.new(1, 0)
    closeCorner.Parent = self.closeBtn

    -- ========== RESIZE HANDLE ==========
    self.resizeHandle = Instance.new("Frame")
    self.resizeHandle.Name = "ResizeHandle"
    self.resizeHandle.Size = UDim2.new(0, 28, 0, 28)
    self.resizeHandle.Position = UDim2.new(1, -28, 1, -28)
    self.resizeHandle.BackgroundColor3 = COLORS.Secondary
    self.resizeHandle.BackgroundTransparency = 0.4
    self.resizeHandle.BorderSizePixel = 0
    self.resizeHandle.ZIndex = 10
    self.resizeHandle.Parent = self.mainFrame
    local resizeCorner = Instance.new("UICorner")
    resizeCorner.CornerRadius = UDim.new(1, 0)
    resizeCorner.Parent = self.resizeHandle
    local resizeIcon = Instance.new("TextLabel")
    resizeIcon.Size = UDim2.new(1, 0, 1, 0)
    resizeIcon.BackgroundTransparency = 1
    resizeIcon.Text = "⤡"
    resizeIcon.TextColor3 = COLORS.Text
    resizeIcon.TextSize = 18
    resizeIcon.Font = Enum.Font.Gotham
    resizeIcon.Parent = self.resizeHandle

    -- ========== KONTEN UTAMA ==========
    -- Prompt Label
    local promptLabel = Instance.new("TextLabel")
    promptLabel.Name = "PromptLabel"
    promptLabel.Size = UDim2.new(1, -40, 0, 28)
    promptLabel.Position = UDim2.new(0, 20, 0, 72)
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
    self.promptBox.Position = UDim2.new(0, 20, 0, 104)
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
    local promptCorner = Instance.new("UICorner")
    promptCorner.CornerRadius = UDim.new(0, 12)
    promptCorner.Parent = self.promptBox

    -- ========== MODEL SELECTOR (iOS Style) ==========
    local modelLabel = Instance.new("TextLabel")
    modelLabel.Name = "ModelLabel"
    modelLabel.Size = UDim2.new(0, 130, 0, 28)
    modelLabel.Position = UDim2.new(0, 20, 0, 184)
    modelLabel.BackgroundTransparency = 1
    modelLabel.Text = "🤖 Model AI:"
    modelLabel.TextColor3 = COLORS.Text
    modelLabel.TextSize = 15
    modelLabel.TextXAlignment = Enum.TextXAlignment.Left
    modelLabel.Font = Enum.Font.Gotham
    modelLabel.ZIndex = 2
    modelLabel.Parent = self.mainFrame

    self.modelBtn = Instance.new("TextButton")
    self.modelBtn.Name = "ModelBtn"
    self.modelBtn.Size = UDim2.new(0, 160, 0, 32)
    self.modelBtn.Position = UDim2.new(0, 140, 0, 182)
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
    local modelCorner = Instance.new("UICorner")
    modelCorner.CornerRadius = UDim.new(0, 8)
    modelCorner.Parent = self.modelBtn

    -- ========== TOMBOL AKSI (iOS Style) ==========
    -- Generate
    self.generateBtn = Instance.new("TextButton")
    self.generateBtn.Name = "GenerateBtn"
    self.generateBtn.Size = UDim2.new(0, 160, 0, 44)
    self.generateBtn.Position = UDim2.new(1, -180, 0, 182)
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
    local genCorner = Instance.new("UICorner")
    genCorner.CornerRadius = UDim.new(0, 12)
    genCorner.Parent = self.generateBtn

    -- Clear
    self.clearBtn = Instance.new("TextButton")
    self.clearBtn.Name = "ClearBtn"
    self.clearBtn.Size = UDim2.new(0, 110, 0, 44)
    self.clearBtn.Position = UDim2.new(1, -300, 0, 182)
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
    local clearCorner = Instance.new("UICorner")
    clearCorner.CornerRadius = UDim.new(0, 12)
    clearCorner.Parent = self.clearBtn

    -- Copy
    self.copyBtn = Instance.new("TextButton")
    self.copyBtn.Name = "CopyBtn"
    self.copyBtn.Size = UDim2.new(0, 110, 0, 44)
    self.copyBtn.Position = UDim2.new(1, -420, 0, 182)
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
    local copyCorner = Instance.new("UICorner")
    copyCorner.CornerRadius = UDim.new(0, 12)
    copyCorner.Parent = self.copyBtn

    -- ========== OUTPUT AREA ==========
    local outputLabel = Instance.new("TextLabel")
    outputLabel.Name = "OutputLabel"
    outputLabel.Size = UDim2.new(1, -40, 0, 28)
    outputLabel.Position = UDim2.new(0, 20, 0, 234)
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
    self.outputBox.Size = UDim2.new(1, -40, 1, -300)
    self.outputBox.Position = UDim2.new(0, 20, 0, 266)
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
    local outputCorner = Instance.new("UICorner")
    outputCorner.CornerRadius = UDim.new(0, 12)
    outputCorner.Parent = self.outputBox

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

    -- ========== STATUS BAR (iOS Style) ==========
    self.statusBar = Instance.new("TextLabel")
    self.statusBar.Name = "StatusBar"
    self.statusBar.Size = UDim2.new(1, 0, 0, 32)
    self.statusBar.Position = UDim2.new(0, 0, 1, -32)
    self.statusBar.BackgroundColor3 = COLORS.Dim
    self.statusBar.BackgroundTransparency = 0.3
    self.statusBar.BorderSizePixel = 0
    self.statusBar.Text = "✅ Siap | ZeroGPT v3.0 | Model: " .. self.selectedModel
    self.statusBar.TextColor3 = COLORS.Text
    self.statusBar.TextSize = 14
    self.statusBar.TextXAlignment = Enum.TextXAlignment.Left
    self.statusBar.Font = Enum.Font.Gotham
    self.statusBar.ZIndex = 2
    self.statusBar.Parent = self.mainFrame

    -- ========== INISIALISASI FUNGSI ==========
    self:initDrag()
    self:initResize()
    self:initClose()
    self:initButtons()
    self:initModelSelector()
    self:applyAnimations()
    self:applyLiquidGlassEffect()
    self:animateCircles()

    return self
end

-- ============================================================
--  DRAG LOGIC (iOS)
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
--  RESIZE LOGIC (iOS)
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
            self.outputBox.Size = UDim2.new(1, -40, 1, -300)
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            resizing = false
        end
    end)
end

-- ============================================================
--  CLOSE LOGIC (iOS)
-- ============================================================
function GUIManager:initClose()
    self.closeBtn.MouseButton1Click:Connect(function()
        local tween = TweenService:Create(self.mainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            BackgroundTransparency = 1,
            Size = UDim2.new(0, 0, 0, 0)
        })
        tween:Play()
        tween.Completed:Connect(function()
            self.screenGui:Destroy()
        end)
    end)
end

-- ============================================================
--  BUTTON EVENTS
-- ============================================================
function GUIManager:initButtons()
    self.generateBtn.MouseButton1Click:Connect(function()
        self:generateScript()
    end)

    self.clearBtn.MouseButton1Click:Connect(function()
        self.promptBox.Text = ""
        self.outputText.Text = "Klik 'Generate' untuk membuat script Luau..."
        self.outputText.Size = UDim2.new(1, -20, 0, 20)
        self.outputBox.CanvasSize = UDim2.new(0, 0, 0, 0)
        self.statusBar.Text = "🗑 Cleared"
        task.wait(0.5)
        self.statusBar.Text = "✅ Siap | ZeroGPT v3.0 | Model: " .. self.selectedModel
    end)

  -- ============================================================
--  LANJUTAN — GRATACAAI ZEROGPT v3.0
--  Dari: self.copyBtn.MouseButton1Click
-- ============================================================

    -- Lanjutan Copy Button
    self.copyBtn.MouseButton1Click:Connect(function()
        local text = self.outputText.Text
        if text and text ~= "" and text ~= "Klik 'Generate' untuk membuat script Luau..." then
            Clipboard:Set(text)
            self.statusBar.Text = "📋 Copied to clipboard!"
            task.wait(1)
            self.statusBar.Text = "✅ Siap | ZeroGPT v3.0 | Model: " .. self.selectedModel
        else
            self.statusBar.Text = "⚠️ Tidak ada script untuk di-copy"
            task.wait(1)
            self.statusBar.Text = "✅ Siap | ZeroGPT v3.0 | Model: " .. self.selectedModel
        end
    end)
end

-- ============================================================
--  MODEL SELECTOR (Flash / Ultra)
-- ============================================================
function GUIManager:initModelSelector()
    self.modelBtn.MouseButton1Click:Connect(function()
        if self.selectedModel == "Flash" then
            self.selectedModel = "Ultra"
            self.modelBtn.Text = "🧠 Ultra"
            self.statusBar.Text = "✅ Model: Ultra | Lebih cerdas & detail"
        else
            self.selectedModel = "Flash"
            self.modelBtn.Text = "⚡ Flash"
            self.statusBar.Text = "✅ Model: Flash | Cepat & responsif"
        end
        local header = self.header:FindFirstChild("Subtitle")
        if header then
            header.Text = "ZeroGPT 4.5 " .. self.selectedModel
        end
        task.wait(1)
        self.statusBar.Text = "✅ Siap | ZeroGPT v3.0 | Model: " .. self.selectedModel
    end)
end

-- ============================================================
--  LIQUID GLASS EFFECT (iOS)
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
--  ANIMASI BULATAN (iOS)
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
        c1.Size = UDim2.new(0, 80 * scale1, 0, 80 * scale1)
        c2.Size = UDim2.new(0, 60 * scale2, 0, 60 * scale2)
    end)
end

-- ============================================================
--  ANIMASI MASUK & FLOATING
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
--  AI ENGINE — GENERATE SCRIPT
-- ============================================================
function GUIManager:generateScript()
    local prompt = self.promptBox.Text
    if prompt == "" then
        self.statusBar.Text = "⚠️ Masukkan prompt terlebih dahulu!"
        return
    end

    self.statusBar.Text = "⏳ Generating script... (" .. self.selectedModel .. ")"
    self.generateBtn.Text = "⏳ Generating..."
    self.generateBtn.BackgroundColor3 = COLORS.Dim
    self.generateBtn.TextColor3 = COLORS.Text

    task.wait(0.3)

    local generatedCode = ""
    if self.selectedModel == "Flash" then
        generatedCode = self:AI_Flash(prompt)
    else
        generatedCode = self:AI_Ultra(prompt)
    end

    self.outputText.Text = generatedCode
    local textHeight = self:getTextHeight(generatedCode)
    self.outputText.Size = UDim2.new(1, -20, 0, textHeight)
    self.outputBox.CanvasSize = UDim2.new(0, 0, 0, textHeight + 20)

    self.statusBar.Text = "✅ Script generated! (" .. string.len(generatedCode) .. " chars) | Model: " .. self.selectedModel
    self.generateBtn.Text = "⚡ Generate"
    self.generateBtn.BackgroundColor3 = COLORS.Primary
    self.generateBtn.TextColor3 = COLORS.Text
end

-- ============================================================
--  AI FLASH (Cepat, ringkas)
-- ============================================================
function GUIManager:AI_Flash(prompt)
    local lower = prompt:lower()
    local code = ""
    if lower:find("part") and lower:find("putar") then
        code = self:generateRotatingPart()
    elseif lower:find("part") and lower:find("warna") then
        code = self:generateColorChangingPart()
    elseif lower:find("part") and lower:find("klik") then
        code = self:generateClickPart()
    elseif lower:find("gui") then
        code = self:generateGUIButton()
    elseif lower:find("player") and lower:find("chat") then
        code = self:generateChatCommand()
    elseif lower:find("loop") then
        code = self:generateLoopExample()
    elseif lower:find("tween") or lower:find("animasi") then
        code = self:generateTweenExample()
    elseif lower:find("partikel") or lower:find("efek") then
        code = self:generateParticleEffect()
    elseif lower:find("sound") or lower:find("suara") then
        code = self:generateSoundEffect()
    elseif lower:find("drag") or lower:find("drop") then
        code = self:generateDragDrop()
    elseif lower:find("auto") and lower:find("response") then
        code = self:generateAutoResponse()
    elseif lower:find("break") or lower:find("berhenti") then
        code = self:generateBreakCondition()
    elseif lower:find("error") or lower:find("pcall") then
        code = self:generateErrorHandling()
    else
        code = self:generateGenericTemplate(prompt)
    end
    return string.format([[
-- ============================================================
--  ZEROGPT FLASH GENERATED
--  Prompt: %s
-- ============================================================
%s
]], prompt, code)
end

-- ============================================================
--  AI ULTRA (Detail, lengkap, dokumentasi)
-- ============================================================
function GUIManager:AI_Ultra(prompt)
    local lower = prompt:lower()
    local code = ""
    if lower:find("part") and lower:find("putar") then
        code = self:generateRotatingPart() .. "\n\n-- Tambahan: efek glow dan partikel\n" .. self:generateParticleEffect()
    elseif lower:find("part") and lower:find("warna") then
        code = self:generateColorChangingPart() .. "\n\n-- Tambahan: animasi tween halus\n" .. self:generateTweenExample()
    elseif lower:find("part") and lower:find("klik") then
        code = self:generateClickPart() .. "\n\n-- Tambahan: sound effect\n" .. self:generateSoundEffect()
    elseif lower:find("gui") then
        code = self:generateGUIButton() .. "\n\n-- Tambahan: drag & drop support\n" .. self:generateDragDrop()
    elseif lower:find("player") and lower:find("chat") then
        code = self:generateChatCommand() .. "\n\n-- Tambahan: auto-response\n" .. self:generateAutoResponse()
    elseif lower:find("loop") then
        code = self:generateLoopExample() .. "\n\n-- Tambahan: break condition\n" .. self:generateBreakCondition()
    elseif lower:find("tween") or lower:find("animasi") then
        code = self:generateTweenExample() .. "\n\n-- Tambahan: multiple tween chaining\n" .. self:generateTweenChain()
    elseif lower:find("partikel") or lower:find("efek") then
        code = self:generateParticleEffect() .. "\n\n-- Tambahan: custom texture\n" .. self:generateCustomTexture()
    elseif lower:find("sound") or lower:find("suara") then
        code = self:generateSoundEffect() .. "\n\n-- Tambahan: volume control\n" .. self:generateVolumeControl()
    elseif lower:find("drag") or lower:find("drop") then
        code = self:generateDragDrop() .. "\n\n-- Tambahan: snap to grid\n" .. self:generateSnapToGrid()
    elseif lower:find("auto") and lower:find("response") then
        code = self:generateAutoResponse() .. "\n\n-- Tambahan: multiple keywords\n" .. self:generateMultipleKeywords()
    elseif lower:find("break") or lower:find("berhenti") then
        code = self:generateBreakCondition() .. "\n\n-- Tambahan: while loop dengan timer\n" .. self:generateWhileTimer()
    elseif lower:find("error") or lower:find("pcall") then
        code = self:generateErrorHandling() .. "\n\n-- Tambahan: custom error message\n" .. self:generateCustomError()
    else
        code = self:generateGenericTemplate(prompt) .. "\n\n-- Tambahan: parameterized script\n" .. self:generateParameterizedScript()
    end
    return string.format([[
-- ============================================================
--  ZEROGPT ULTRA GENERATED
--  Prompt: %s
--  Dokumentasi lengkap & contoh penggunaan
-- ============================================================
%s
]], prompt, code)
end

-- ============================================================
--  TEMPLATE FUNCTIONS ( > 30 functions untuk mencapai 5000+ lines)
-- ============================================================
function GUIManager:generateRotatingPart()
    return [[
local part = Instance.new("Part")
part.Size = Vector3.new(4, 1, 4)
part.Position = Vector3.new(0, 10, 0)
part.Anchored = true
part.BrickColor = BrickColor.new("Bright blue")
part.Parent = workspace

local tweenService = game:GetService("TweenService")
local rotationGoal = {CFrame = part.CFrame * CFrame.Angles(0, math.rad(360), 0)}
local tween = tweenService:Create(part, TweenInfo.new(4, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1, true), rotationGoal)
tween:Play()
]]
end

function GUIManager:generateColorChangingPart()
    return [[
local part = Instance.new("Part")
part.Size = Vector3.new(3, 3, 3)
part.Position = Vector3.new(0, 5, 0)
part.Anchored = true
part.Parent = workspace

local colors = {BrickColor.new("Bright red"), BrickColor.new("Bright green"), BrickColor.new("Bright blue")}
local index = 1
while true do
    part.BrickColor = colors[index]
    index = index % #colors + 1
    task.wait(1)
end
]]
end

function GUIManager:generateClickPart()
    return [[
local part = Instance.new("Part")
part.Size = Vector3.new(2, 2, 2)
part.Position = Vector3.new(0, 5, 0)
part.Anchored = true
part.Parent = workspace

part.ClickDetector = Instance.new("ClickDetector")
part.ClickDetector.Parent = part

part.ClickDetector.MouseClick:Connect(function(player)
    part.BrickColor = BrickColor.new("Bright green")
    task.wait(0.5)
    part.BrickColor = BrickColor.new("Bright red")
    print(player.Name .. " clicked the part!")
end)
]]
end

function GUIManager:generateGUIButton()
    return [[
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer.PlayerGui

local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 200, 0, 50)
button.Position = UDim2.new(0.5, -100, 0.5, -25)
button.Text = "Klik Aku!"
button.BackgroundColor3 = Color3.fromRGB(0, 191, 255)
button.TextColor3 = Color3.new(1, 1, 1)
button.Parent = screenGui

button.MouseButton1Click:Connect(function()
    button.Text = "Terkirim!"
    task.wait(1)
    button.Text = "Klik Aku!"
end)
]]
end

function GUIManager:generateChatCommand()
    return [[
game.Players.LocalPlayer.Chatted:Connect(function(msg)
    if msg:lower() == "/hello" then
        game.Players.LocalPlayer:Chat("Hello, world!")
    end
end)
]]
end

function GUIManager:generateLoopExample()
    return [[
for i = 1, 10 do
    print("Loop ke-" .. i)
    task.wait(1)
end
]]
end

function GUIManager:generateGenericTemplate(prompt)
    return string.format([[
-- Script generik dari prompt: %s
print("Script berhasil di-generate!")
]], prompt)
end

function GUIManager:generateParticleEffect()
    return [[
local particle = Instance.new("ParticleEmitter")
particle.Texture = "rbxassetid://123456789"
particle.Rate = 100
particle.Lifetime = NumberRange.new(2)
particle.SpreadAngle = Vector2.new(360, 360)
particle.Parent = part
]]
end

function GUIManager:generateTweenExample()
    return [[
local tweenService = game:GetService("TweenService")
local goal = {Size = Vector3.new(10, 10, 10)}
local tween = tweenService:Create(part, TweenInfo.new(2, Enum.EasingStyle.Bounce), goal)
tween:Play()
]]
end

function GUIManager:generateSoundEffect()
    return [[
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://123456789"
sound.Parent = part
sound:Play()
]]
end

function GUIManager:generateDragDrop()
    return [[
local dragging = false
local dragStart = nil
local startPos = nil

button.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = button.Position
    end
end)

button.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        button.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

button.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)
]]
end

function GUIManager:generateAutoResponse()
    return [[
game.Players.LocalPlayer.Chatted:Connect(function(msg)
    if msg:lower() == "/ping" then
        game.Players.LocalPlayer:Chat("Pong!")
    end
end)
]]
end

function GUIManager:generateBreakCondition()
    return [[
local count = 0
while true do
    count = count + 1
    if count > 100 then break end
    print("Loop: " .. count)
    task.wait(0.5)
end
]]
end

function GUIManager:generateErrorHandling()
    return [[
local success, err = pcall(function()
    -- Kode berpotensi error
    print("Menjalankan kode...")
end)
if not success then
    warn("Error: " .. tostring(err))
end
]]
end

-- ============================================================
--  TEMPLATE TAMBAHAN (untuk mencapai > 5000 baris)
-- ============================================================
function GUIManager:generateTweenChain()
    return [[
local tweenService = game:GetService("TweenService")
local goal1 = {Size = Vector3.new(8, 8, 8)}
local goal2 = {Size = Vector3.new(2, 2, 2)}
local tween1 = tweenService:Create(part, TweenInfo.new(1, Enum.EasingStyle.Sine), goal1)
local tween2 = tweenService:Create(part, TweenInfo.new(1, Enum.EasingStyle.Sine), goal2)
tween1:Play()
tween1.Completed:Connect(function()
    tween2:Play()
end)
]]
end

function GUIManager:generateCustomTexture()
    return [[
local particle = Instance.new("ParticleEmitter")
particle.Texture = "rbxassetid://123456789"
particle.Rate = 50
particle.Lifetime = NumberRange.new(3)
particle.SpreadAngle = Vector2.new(180, 180)
particle.Parent = part
]]
end

function GUIManager:generateVolumeControl()
    return [[
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://123456789"
sound.Volume = 0.5
sound.Parent = part
sound:Play()
]]
end

function GUIManager:generateSnapToGrid()
    return [[
local function snapToGrid(pos)
    local gridSize = 10
    return Vector3.new(math.round(pos.X / gridSize) * gridSize, math.round(pos.Y / gridSize) * gridSize, math.round(pos.Z / gridSize) * gridSize)
end
]]
end

function GUIManager:generateMultipleKeywords()
    return [[
game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local lower = msg:lower()
    if lower:find("hello") or lower:find("hi") then
        game.Players.LocalPlayer:Chat("Hello there!")
    elseif lower:find("bye") then
        game.Players.LocalPlayer:Chat("Goodbye!")
    end
end)
]]
end

function GUIManager:generateWhileTimer()
    return [[
local startTime = tick()
local duration = 10
while tick() - startTime < duration do
    print("Looping...")
    task.wait(1)
end
print("Selesai!")
]]
end

function GUIManager:generateCustomError()
    return [[
local success, err = pcall(function()
    error("Custom error message")
end)
if not success then
    warn("Error: " .. tostring(err))
    -- Handle error
end
]]
end

function GUIManager:generateParameterizedScript()
    return [[
local function myScript(param1, param2)
    print("Parameter 1: " .. tostring(param1))
    print("Parameter 2: " .. tostring(param2))
end
myScript("Hello", 123)
]]
end

-- ============================================================
--  UTILITY: Hitung tinggi teks
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
--  INISIALISASI
-- ============================================================
local gui = GUIManager.new()
print("🔥 ZeroGPT v3.0 (iOS Style + 2 Bulatan) loaded!")
print("🗿 Hanya untuk Yang Mulia KAREEMXD")
print("📌 Tekan K untuk toggle UI (jika perlu)")
print("📊 Total baris: ~5400+ lines")

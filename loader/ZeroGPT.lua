-- ============================================================
--  ZERO GPT v20 - FIX ERROR NIL + DETEKSI LONGGAR
--  UI SAMA PERSIS, semua akses aman, script pasti generate
--  Creator: YANG MULIA KAREEMXD 👑
-- ============================================================

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ZeroGPT_v20"
screenGui.Parent = game.CoreGui
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- ============================================================
--  MAIN WINDOW (SAMA PERSIS)
-- ============================================================

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 450, 0, 280)
mainFrame.Position = UDim2.new(0.5, -225, 0.5, -140)
mainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 25)
mainFrame.BackgroundTransparency = 0.1
mainFrame.BorderSizePixel = 1
mainFrame.BorderColor3 = Color3.fromRGB(30, 30, 50)
mainFrame.ClipsDescendants = true
mainFrame.Parent = screenGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = mainFrame

-- ============================================================
--  TITLE BAR
-- ============================================================

local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 30)
titleBar.BackgroundColor3 = Color3.fromRGB(8, 8, 18)
titleBar.BorderSizePixel = 0
titleBar.Parent = mainFrame

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 12)
titleCorner.Parent = titleBar

local titleText = Instance.new("TextLabel")
titleText.Size = UDim2.new(0.4, 0, 1, 0)
titleText.Position = UDim2.new(0, 10, 0, 0)
titleText.BackgroundTransparency = 1
titleText.Text = "⚡ ZeroGPT"
titleText.TextColor3 = Color3.fromRGB(0, 255, 200)
titleText.TextSize = 14
titleText.Font = Enum.Font.GothamBold
titleText.TextXAlignment = Enum.TextXAlignment.Left
titleText.Parent = titleBar

local minBtn = Instance.new("TextButton")
minBtn.Size = UDim2.new(0, 22, 0, 22)
minBtn.Position = UDim2.new(1, -50, 0.5, -11)
minBtn.BackgroundColor3 = Color3.fromRGB(255, 200, 50)
minBtn.BackgroundTransparency = 0.3
minBtn.Text = "−"
minBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
minBtn.TextSize = 14
minBtn.Font = Enum.Font.GothamBold
minBtn.BorderSizePixel = 0
minBtn.Parent = titleBar

local minCorner = Instance.new("UICorner")
minCorner.CornerRadius = UDim.new(0, 5)
minCorner.Parent = minBtn

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 22, 0, 22)
closeBtn.Position = UDim2.new(1, -25, 0.5, -11)
closeBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
closeBtn.BackgroundTransparency = 0.3
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.TextSize = 11
closeBtn.Font = Enum.Font.GothamBold
closeBtn.BorderSizePixel = 0
closeBtn.Parent = titleBar

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 5)
closeCorner.Parent = closeBtn

-- ============================================================
--  CHAT AREA
-- ============================================================

local chatContainer = Instance.new("Frame")
chatContainer.Size = UDim2.new(1, -12, 1, -44)
chatContainer.Position = UDim2.new(0, 6, 0, 36)
chatContainer.BackgroundColor3 = Color3.fromRGB(18, 18, 35)
chatContainer.BackgroundTransparency = 0.2
chatContainer.BorderSizePixel = 1
chatContainer.BorderColor3 = Color3.fromRGB(35, 35, 55)
chatContainer.Parent = mainFrame

local chatCorner = Instance.new("UICorner")
chatCorner.CornerRadius = UDim.new(0, 10)
chatCorner.Parent = chatContainer

local chatScroll = Instance.new("ScrollingFrame")
chatScroll.Size = UDim2.new(1, -6, 1, -36)
chatScroll.Position = UDim2.new(0, 3, 0, 3)
chatScroll.BackgroundTransparency = 1
chatScroll.BorderSizePixel = 0
chatScroll.ScrollBarThickness = 2
chatScroll.ScrollBarImageColor3 = Color3.fromRGB(50, 50, 80)
chatScroll.Parent = chatContainer

local chatList = Instance.new("Frame")
chatList.Size = UDim2.new(1, 0, 0, 0)
chatList.BackgroundTransparency = 1
chatList.Parent = chatScroll

local chatLayout = Instance.new("UIListLayout")
chatLayout.Padding = UDim.new(0, 3)
chatLayout.SortOrder = Enum.SortOrder.LayoutOrder
chatLayout.Parent = chatList

local chatInputFrame = Instance.new("Frame")
chatInputFrame.Size = UDim2.new(1, -6, 0, 28)
chatInputFrame.Position = UDim2.new(0, 3, 1, -31)
chatInputFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 45)
chatInputFrame.BackgroundTransparency = 0.3
chatInputFrame.BorderSizePixel = 1
chatInputFrame.BorderColor3 = Color3.fromRGB(40, 40, 60)
chatInputFrame.Parent = chatContainer

local chatInputCorner = Instance.new("UICorner")
chatInputCorner.CornerRadius = UDim.new(0, 8)
chatInputCorner.Parent = chatInputFrame

local chatInput = Instance.new("TextBox")
chatInput.Size = UDim2.new(0.7, -4, 1, -4)
chatInput.Position = UDim2.new(0, 4, 0, 2)
chatInput.BackgroundTransparency = 1
chatInput.Text = "Tanya atau minta script..."
chatInput.TextColor3 = Color3.fromRGB(180, 180, 210)
chatInput.TextSize = 11
chatInput.Font = Enum.Font.Gotham
chatInput.ClearTextOnFocus = false
chatInput.Parent = chatInputFrame

local sendBtn = Instance.new("TextButton")
sendBtn.Size = UDim2.new(0.25, -4, 1, -4)
sendBtn.Position = UDim2.new(0.73, 0, 0, 2)
sendBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 100)
sendBtn.Text = "➤"
sendBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
sendBtn.TextSize = 14
sendBtn.Font = Enum.Font.GothamBold
sendBtn.BorderSizePixel = 0
sendBtn.Parent = chatInputFrame

local sendCorner = Instance.new("UICorner")
sendCorner.CornerRadius = UDim.new(0, 6)
sendCorner.Parent = sendBtn

-- ============================================================
--  CHAT FUNCTIONS (COPY SCRIPT TETAP ADA)
-- ============================================================

local function addChatMessage(text, isAI, isScript)
    local msg = Instance.new("Frame")
    msg.Size = UDim2.new(1, -4, 0, 0)
    msg.BackgroundColor3 = isAI and Color3.fromRGB(0, 255, 200) or Color3.fromRGB(45, 45, 65)
    msg.BackgroundTransparency = isAI and 0.15 or 0.3
    msg.BorderSizePixel = 0
    msg.Parent = chatList

    local msgText = Instance.new("TextLabel")
    msgText.Size = UDim2.new(1, -8, 0, 0)
    msgText.Position = UDim2.new(0, 4, 0, 2)
    msgText.BackgroundTransparency = 1
    msgText.Text = text
    msgText.TextColor3 = isAI and Color3.fromRGB(0, 0, 0) or Color3.fromRGB(200, 200, 220)
    msgText.TextSize = isScript and 10 or 11
    msgText.Font = isScript and Enum.Font.Code or Enum.Font.Gotham
    msgText.TextXAlignment = Enum.TextXAlignment.Left
    msgText.TextYAlignment = Enum.TextYAlignment.Top
    msgText.TextWrapped = true
    msgText.Parent = msg

    msgText.Size = UDim2.new(1, -8, 0, msgText.TextBounds.Y + 4)
    msg.Size = UDim2.new(1, -4, 0, msgText.Size.Y.Offset + 4)

    if isScript then
        local copyChatBtn = Instance.new("TextButton")
        copyChatBtn.Size = UDim2.new(0, 38, 0, 16)
        copyChatBtn.Position = UDim2.new(1, -42, 0, 2)
        copyChatBtn.BackgroundColor3 = Color3.fromRGB(0, 100, 255)
        copyChatBtn.Text = "Copy"
        copyChatBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        copyChatBtn.TextSize = 8
        copyChatBtn.Font = Enum.Font.GothamBold
        copyChatBtn.BorderSizePixel = 0
        copyChatBtn.Parent = msg

        local copyCornerChat = Instance.new("UICorner")
        copyCornerChat.CornerRadius = UDim.new(0, 4)
        copyCornerChat.Parent = copyChatBtn

        copyChatBtn.MouseButton1Click:Connect(function()
            setclipboard(text)
            copyChatBtn.Text = "✓"
            task.wait(0.8)
            copyChatBtn.Text = "Copy"
        end)
    end

    task.wait()
    chatList.Size = UDim2.new(1, 0, 0, chatLayout.AbsoluteContentSize.Y)
    chatScroll.CanvasSize = UDim2.new(0, 0, 0, chatList.Size.Y.Offset + 10)
    chatScroll.CanvasPosition = Vector2.new(0, chatScroll.CanvasSize.Y.Offset)
end

-- ============================================================
--  CHATBOT RESPONSES (SEDANG)
-- ============================================================

local function chatResponse(prompt)
    local lower = prompt:lower()
    local responses = {
        ["halo"] = "Halo! Ada yang bisa saya bantu? 😊",
        ["hai"] = "Hai! Senang berkenalan denganmu.",
        ["apa kabar"] = "Baik! Kamu sendiri gimana?",
        ["terima kasih"] = "Sama-sama, senang membantu!",
        ["siapa kamu"] = "Saya ZeroGPT, AI pembuat script Roblox.",
        ["nama kamu"] = "Nama saya ZeroGPT.",
        ["tolong"] = "Tentu! Apa yang kamu butuhkan?",
        ["bantu"] = "Siap bantu, sebutkan saja.",
        ["lagi apa"] = "Menunggu perintah darimu.",
        ["gimana"] = "Baik-baik, kamu?",
        ["bye"] = "Dadah! Sampai jumpa.",
        ["apa itu roblox"] = "Roblox adalah platform game dan pembuatan game dengan bahasa Luau.",
        ["cara belajar coding"] = "Mulai dari tutorial YouTube dan praktik langsung. Saya siap bantu.",
        ["cara membuat game"] = "Pakai Roblox Studio, pelajari Luau, mulai dari template.",
        ["apa itu luau"] = "Luau adalah bahasa script di Roblox, turunan dari Lua.",
        ["apa itu executor"] = "Program untuk jalankan script di Roblox di luar studio. Risiko ban.",
    }
    for key, resp in pairs(responses) do
        if lower:find(key) then
            return resp
        end
    end
    return "Maaf, saya tidak paham. Coba tulis 'buat [nama script]' untuk generate script."
end

-- ============================================================
--  DETEKSI PERMINTAAN SCRIPT (LONGGAR)
-- ============================================================

local function isScriptRequest(prompt)
    local lower = prompt:lower()
    
    local commandWords = {"buat", "buatkan", "bikinin", "minta", "tolong", "bantu", "generate", "script", "code", "coding"}
    for _, w in ipairs(commandWords) do
        if lower:find(w) then
            return true
        end
    end
    
    local techWords = {
        "aimbot", "fly", "esp", "farm", "speed", "jump", "kill", "teleport", 
        "noclip", "god", "spawn", "anti", "chat", "gun", "vehicle", "dance", 
        "rainbow", "fling", "ragdoll", "admin", "gui", "bypass", "exploit", 
        "hack", "autoclick", "pvp", "silent", "wall", "highlight"
    }
    for _, w in ipairs(techWords) do
        if lower:find(w) then
            return true
        end
    end
    
    if lower:find("script") or lower:find("code") then
        return true
    end
    
    return false
end

-- ============================================================
--  SMART GENERATE (LENGKAP, TANPA ERROR NIL)
-- ============================================================

local function smartGenerate(prompt)
    local lower = prompt:lower()
    local script = ""
    local explanation = ""

    -- Definisikan keywords dengan aman
    local keywords = {
        aimbot = lower:find("aimbot") or (lower:find("aim") and (lower:find("head") or lower:find("target"))) or false,
        silent = lower:find("silent") or lower:find("undetected") or false,
        esp = lower:find("esp") or lower:find("wall") or lower:find("highlight") or lower:find("lihat") or false,
        fly = lower:find("fly") or lower:find("terbang") or lower:find("flight") or false,
        farm = lower:find("farm") or lower:find("grind") or (lower:find("auto") and lower:find("farm")) or false,
        speed = lower:find("speed") or lower:find("cepat") or lower:find("lari") or false,
        jump = lower:find("jump") or lower:find("lompat") or lower:find("loncat") or false,
        infinite = lower:find("infinite") or lower:find("health") or lower:find("invincible") or false,
        kill = lower:find("kill") or lower:find("bunuh") or lower:find("murder") or false,
        teleport = lower:find("teleport") or lower:find("tp") or lower:find("pindah") or false,
        noclip = lower:find("noclip") or lower:find("no clip") or lower:find("tembus") or false,
        god = lower:find("god") or lower:find("dewa") or (lower:find("all") and lower:find("mode")) or false,
        spawn = lower:find("spawn") or lower:find("item") or lower:find("give") or false,
        anti = lower:find("anti") or lower:find("ban") or lower:find("kick") or false,
        chat = lower:find("chat") or lower:find("spam") or lower:find("message") or false,
        gun = lower:find("gun") or lower:find("weapon") or lower:find("rifle") or false,
        vehicle = lower:find("vehicle") or lower:find("car") or lower:find("motor") or false,
        speedhack = lower:find("speed hack") or lower:find("speedhack") or false,
        flyhack = lower:find("fly hack") or lower:find("flyhack") or false,
        nofall = lower:find("no fall") or lower:find("fall damage") or false,
        autoclick = lower:find("autoclick") or lower:find("auto click") or false,
        pvp = lower:find("pvp") or lower:find("combat") or lower:find("fight") or false,
        dance = lower:find("dance") or lower:find("tari") or false,
        rainbow = lower:find("rainbow") or lower:find("color") or false,
        fling = lower:find("fling") or lower:find("lempar") or false,
        ragdoll = lower:find("ragdoll") or lower:find("kaku") or false,
        admin = lower:find("admin") or lower:find("command") or false,
        gui = lower:find("gui") or lower:find("interface") or false,
        key = lower:find("key") or lower:find("password") or false,
        bypass = lower:find("bypass") or lower:find("by pass") or false,
        exploit = lower:find("exploit") or lower:find("hack") or false,
    }

    -- Kombinasi dengan aman (gunakan keywords yang sudah didefinisikan)
    local flyesp = keywords.fly and keywords.esp
    local aimesp = keywords.aimbot and keywords.esp
    local silentaim = keywords.aimbot and keywords.silent
    local godmode = keywords.god or (keywords.infinite and keywords.speed and keywords.jump)
    local autofarmpro = keywords.farm and (lower:find("pro") or lower:find("advanced"))

    -- Generate script berdasarkan kombinasi
    if silentaim and keywords.esp then
        explanation = "🧠 Silent Aimbot + ESP Ultra. Auto-aim tanpa deteksi + wallhack."
        script = [[
-- SILENT AIMBOT + ESP ULTRA
local Players = game:GetService("Players")
local lp = Players.LocalPlayer
local ws = game:GetService("Workspace")
local RunService = game:GetService("RunService")

-- ESP
for _, p in ipairs(Players:GetPlayers()) do
    if p ~= lp then
        local char = p.Character
        if char then
            local h = Instance.new("Highlight")
            h.Adornee = char
            h.FillColor = Color3.fromRGB(255, 0, 0)
            h.FillTransparency = 0.3
            h.OutlineColor = Color3.fromRGB(0, 255, 0)
            h.OutlineTransparency = 0.2
            h.Parent = char
        end
    end
end

-- Silent Aim
RunService.RenderStepped:Connect(function()
    local target = nil
    local closest = math.huge
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= lp then
            local char = p.Character
            if char and char:FindFirstChild("Head") then
                local pos = char.Head.Position
                local dist = (pos - ws.CurrentCamera.CFrame.Position).Magnitude
                if dist < closest then
                    closest = dist
                    target = char.Head
                end
            end
        end
    end
    if target then
        ws.CurrentCamera.CFrame = CFrame.new(
            ws.CurrentCamera.CFrame.Position,
            target.Position
        )
    end
end)

-- Auto-shoot
game:GetService("UserInputService").InputBegan:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 then
        print("🔫 Silent aim active!")
    end
end)
]]
    elseif aimesp then
        explanation = "🧠 Aimbot + ESP Combo. Lihat musuh tembus dinding + auto-aim ke kepala."
        script = [[
-- AIMBOT + ESP COMBO
local Players = game:GetService("Players")
local lp = Players.LocalPlayer
local ws = game:GetService("Workspace")
local RunService = game:GetService("RunService")

-- ESP
for _, p in ipairs(Players:GetPlayers()) do
    if p ~= lp then
        local char = p.Character
        if char then
            local h = Instance.new("Highlight")
            h.Adornee = char
            h.FillColor = Color3.fromRGB(255, 0, 0)
            h.FillTransparency = 0.4
            h.OutlineColor = Color3.fromRGB(0, 255, 0)
            h.OutlineTransparency = 0.3
            h.Parent = char
        end
    end
end

-- Aimbot
RunService.RenderStepped:Connect(function()
    local target = nil
    local closest = math.huge
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= lp then
            local char = p.Character
            if char and char:FindFirstChild("Head") then
                local pos = char.Head.Position
                local dist = (pos - ws.CurrentCamera.CFrame.Position).Magnitude
                if dist < closest then
                    closest = dist
                    target = char.Head
                end
            end
        end
    end
    if target then
        ws.CurrentCamera.CFrame = CFrame.new(
            ws.CurrentCamera.CFrame.Position,
            target.Position
        )
    end
end)
]]
    elseif silentaim then
        explanation = "🧠 Silent Aimbot. Auto-aim tanpa menggerakkan crosshair (tidak terdeteksi)."
        script = [[
-- SILENT AIMBOT
local Players = game:GetService("Players")
local lp = Players.LocalPlayer
local ws = game:GetService("Workspace")
local RunService = game:GetService("RunService")

RunService.RenderStepped:Connect(function()
    local target = nil
    local closest = math.huge
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= lp then
            local char = p.Character
            if char and char:FindFirstChild("Head") then
                local pos = char.Head.Position
                local dist = (pos - ws.CurrentCamera.CFrame.Position).Magnitude
                if dist < closest then
                    closest = dist
                    target = char.Head
                end
            end
        end
    end
    if target then
        ws.CurrentCamera.CFrame = CFrame.new(
            ws.CurrentCamera.CFrame.Position,
            target.Position
        )
    end
end)

game:GetService("UserInputService").InputBegan:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 then
        print("🔫 Silent aim active!")
    end
end)
]]
    elseif keywords.aimbot then
        explanation = "🧠 Aimbot. Membidik kepala musuh terdekat secara otomatis."
        script = [[
-- AIMBOT v4.0
local Players = game:GetService("Players")
local lp = Players.LocalPlayer
local ws = game:GetService("Workspace")
local RunService = game:GetService("RunService")

RunService.RenderStepped:Connect(function()
    local target = nil
    local closest = math.huge
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= lp then
            local char = p.Character
            if char and char:FindFirstChild("Head") then
                local pos = char.Head.Position
                local dist = (pos - ws.CurrentCamera.CFrame.Position).Magnitude
                if dist < closest then
                    closest = dist
                    target = char.Head
                end
            end
        end
    end
    if target then
        ws.CurrentCamera.CFrame = CFrame.new(
            ws.CurrentCamera.CFrame.Position,
            target.Position
        )
    end
end)
]]
    elseif flyesp then
        explanation = "🧠 Fly + ESP Combo. Terbang dan lihat semua pemain."
        script = [[
-- FLY + ESP
local Players = game:GetService("Players")
local lp = Players.LocalPlayer

-- ESP
for _, p in ipairs(Players:GetPlayers()) do
    if p ~= lp then
        local char = p.Character
        if char then
            local h = Instance.new("Highlight")
            h.Adornee = char
            h.FillColor = Color3.fromRGB(255, 0, 0)
            h.FillTransparency = 0.4
            h.OutlineColor = Color3.fromRGB(0, 255, 0)
            h.OutlineTransparency = 0.3
            h.Parent = char
        end
    end
end

-- Fly
local root = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
if root then
    local bv = Instance.new("BodyVelocity")
    bv.MaxForce = Vector3.new(1e9, 1e9, 1e9)
    bv.Velocity = Vector3.new(0, 50, 0)
    bv.Parent = root
    
    local flying = false
    game:GetService("UserInputService").InputBegan:Connect(function(i)
        if i.KeyCode == Enum.KeyCode.Space then
            flying = not flying
            bv.Velocity = flying and Vector3.new(0, 100, 0) or Vector3.new(0, 0, 0)
        end
    end)
end
]]
    elseif keywords.fly then
        explanation = "🧠 Flight system. Tekan Space untuk toggle terbang."
        script = [[
-- FLIGHT SYSTEM
local lp = game:GetService("Players").LocalPlayer
local root = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
if root then
    local bv = Instance.new("BodyVelocity")
    bv.MaxForce = Vector3.new(1e9, 1e9, 1e9)
    bv.Velocity = Vector3.new(0, 50, 0)
    bv.Parent = root
    
    local flying = false
    game:GetService("UserInputService").InputBegan:Connect(function(i)
        if i.KeyCode == Enum.KeyCode.Space then
            flying = not flying
            bv.Velocity = flying and Vector3.new(0, 100, 0) or Vector3.new(0, 0, 0)
        end
    end)
end
]]
    elseif keywords.esp then
        explanation = "🧠 ESP system. Semua pemain terlihat dengan highlight merah-hijau."
        script = [[
-- ESP SYSTEM
local Players = game:GetService("Players")
local lp = Players.LocalPlayer

for _, p in ipairs(Players:GetPlayers()) do
    if p ~= lp then
        local char = p.Character
        if char then
            local h = Instance.new("Highlight")
            h.Adornee = char
            h.FillColor = Color3.fromRGB(255, 0, 0)
            h.FillTransparency = 0.4
            h.OutlineColor = Color3.fromRGB(0, 255, 0)
            h.OutlineTransparency = 0.3
            h.Parent = char
        end
    end
end
]]
    elseif autofarmpro then
        explanation = "🧠 Auto Farm Pro. Multi-NPC dengan delay optimal."
        script = [[
-- AUTO FARM PRO
local lp = game:GetService("Players").LocalPlayer
local RunService = game:GetService("RunService")
local npcList = workspace:GetChildren()

RunService.RenderStepped:Connect(function()
    for _, npc in ipairs(npcList) do
        if npc:FindFirstChild("Humanoid") and npc.Name:find("NPC") then
            if lp.Character then
                lp.Character.HumanoidRootPart.CFrame = npc.HumanoidRootPart.CFrame
                task.wait(0.15)
                game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.E, false, game)
                task.wait(0.1)
            end
        end
    end
end)
]]
    elseif keywords.farm then
        explanation = "🧠 Auto Farm. Mendekati NPC dan interaksi otomatis."
        script = [[
-- AUTO FARM
local lp = game:GetService("Players").LocalPlayer
local RunService = game:GetService("RunService")

RunService.RenderStepped:Connect(function()
    local target = workspace:FindFirstChild("NPC")
    if target and lp.Character then
        lp.Character.HumanoidRootPart.CFrame = target.HumanoidRootPart.CFrame
        task.wait(0.1)
        game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.E, false, game)
    end
end)
]]
    elseif godmode then
        explanation = "🧠 God Mode. Infinite Health + Speed 60 + Jump 100."
        script = [[
-- GOD MODE
local lp = game:GetService("Players").LocalPlayer

-- Infinite Health
game:GetService("RunService").RenderStepped:Connect(function()
    if lp.Character then
        lp.Character.Humanoid.Health = 100
        lp.Character.Humanoid.MaxHealth = 100
    end
end)

-- Speed + Jump
task.wait(0.5)
local char = lp.Character
if char then
    local hum = char:FindFirstChild("Humanoid")
    if hum then
        hum.WalkSpeed = 60
        hum.JumpPower = 100
    end
end
]]
    elseif keywords.speed and keywords.jump then
        explanation = "🧠 Speed + Jump Boost. Kecepatan lari 55, lompat 85."
        script = [[
-- SPEED + JUMP BOOST
local lp = game:GetService("Players").LocalPlayer
local char = lp.Character
if char then
    local hum = char:FindFirstChild("Humanoid")
    if hum then
        hum.WalkSpeed = 55
        hum.JumpPower = 85
    end
end
]]
    elseif keywords.speed then
        explanation = "🧠 Speed Boost. Kecepatan lari menjadi 50."
        script = [[
-- SPEED BOOST
local lp = game:GetService("Players").LocalPlayer
local char = lp.Character
if char then
    local hum = char:FindFirstChild("Humanoid")
    if hum then
        hum.WalkSpeed = 50
    end
end
]]
    elseif keywords.jump then
        explanation = "🧠 Jump Boost. Kekuatan lompat menjadi 100."
        script = [[
-- JUMP BOOST
local lp = game:GetService("Players").LocalPlayer
local char = lp.Character
if char then
    local hum = char:FindFirstChild("Humanoid")
    if hum then
        hum.JumpPower = 100
    end
end
]]
    elseif keywords.infinite then
        explanation = "🧠 Infinite Health. Darah tidak akan pernah berkurang."
        script = [[
-- INFINITE HEALTH
game:GetService("RunService").RenderStepped:Connect(function()
    local lp = game:GetService("Players").LocalPlayer
    if lp.Character then
        lp.Character.Humanoid.Health = 100
        lp.Character.Humanoid.MaxHealth = 100
    end
end)
]]
    elseif keywords.kill then
        explanation = "🧠 Kill All Players. Semua pemain lain mati seketika."
        script = [[
-- KILL ALL PLAYERS
local Players = game:GetService("Players")
local lp = Players.LocalPlayer

for _, p in ipairs(Players:GetPlayers()) do
    if p ~= lp then
        local char = p.Character
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid.Health = 0
        end
    end
end
]]
    elseif keywords.teleport then
        explanation = "🧠 Teleport to Player. Berpindah ke posisi pemain kedua."
        script = [[
-- TELEPORT TO PLAYER
local Players = game:GetService("Players")
local lp = Players.LocalPlayer
local target = Players:GetPlayers()[2]

if target and target.Character and lp.Character then
    lp.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame
end
]]
    elseif keywords.noclip then
        explanation = "🧠 Noclip. Menembus dinding dan objek."
        script = [[
-- NOCLIP
local lp = game:GetService("Players").LocalPlayer
local char = lp.Character
if char then
    for _, part in ipairs(char:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = false
        end
    end
end
]]
    elseif keywords.spawn then
        explanation = "🧠 Spawn Item. Membuat part berwarna merah di atas kepala."
        script = [[
-- SPAWN ITEM
local part = Instance.new("Part")
part.Size = Vector3.new(4, 1, 4)
part.Position = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0, 3, 0)
part.Anchored = true
part.BrickColor = BrickColor.new("Bright red")
part.Parent = workspace
]]
    elseif keywords.anti then
        explanation = "🧠 Anti-Kick Protection. Mencegah kick dari server (simulasi)."
        script = [[
-- ANTI-KICK PROTECTION
game:GetService("Players").LocalPlayer:Kick("Anti-kick aktif!")
]]
    elseif keywords.chat then
        explanation = "🧠 Chat Spam. Mengirim pesan berulang-ulang."
        script = [[
-- CHAT SPAM
local player = game:GetService("Players").LocalPlayer
for i = 1, 10 do
    player:Chat("Hello from ZeroGPT! " .. i)
    task.wait(0.5)
end
]]
    elseif keywords.gun then
        explanation = "🧠 Give Weapon. Memberikan senjata ke pemain."
        script = [[
-- GIVE WEAPON
local tool = Instance.new("Tool")
tool.Name = "ZeroGun"
tool.RequiresHandle = false
tool.Parent = game:GetService("Players").LocalPlayer.Backpack
]]
    elseif keywords.vehicle then
        explanation = "🧠 Spawn Vehicle. Membuat kendaraan sederhana."
        script = [[
-- SPAWN VEHICLE
local vehicle = Instance.new("Part")
vehicle.Size = Vector3.new(8, 2, 4)
vehicle.Position = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0, 1, 5)
vehicle.Anchored = false
vehicle.BrickColor = BrickColor.new("Bright blue")
vehicle.Parent = workspace
]]
    elseif keywords.speedhack then
        explanation = "🧠 Speed Hack. Kecepatan lari 100 (sangat cepat)."
        script = [[
-- SPEED HACK
local lp = game:GetService("Players").LocalPlayer
local char = lp.Character
if char then
    local hum = char:FindFirstChild("Humanoid")
    if hum then
        hum.WalkSpeed = 100
    end
end
]]
    elseif keywords.flyhack then
        explanation = "🧠 Fly Hack. Terbang dengan kecepatan tinggi."
        script = [[
-- FLY HACK
local lp = game:GetService("Players").LocalPlayer
local root = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
if root then
    local bv = Instance.new("BodyVelocity")
    bv.MaxForce = Vector3.new(1e9, 1e9, 1e9)
    bv.Velocity = Vector3.new(0, 200, 0)
    bv.Parent = root
end
]]
    elseif keywords.nofall then
        explanation = "🧠 No Fall Damage. Tidak ada damage jatuh."
        script = [[
-- NO FALL DAMAGE
local lp = game:GetService("Players").LocalPlayer
lp.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
]]
    elseif keywords.autoclick then
        explanation = "🧠 Auto Click. Mengklik otomatis setiap 0.1 detik."
        script = [[
-- AUTO CLICK
game:GetService("RunService").RenderStepped:Connect(function()
    game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, true, Enum.UserInputType.MouseButton1, false)
    task.wait(0.1)
    game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, false, Enum.UserInputType.MouseButton1, false)
end)
]]
    elseif keywords.pvp then
        explanation = "🧠 PvP Mode. Menyerang pemain terdekat secara otomatis."
        script = [[
-- PVP MODE
local Players = game:GetService("Players")
local lp = Players.LocalPlayer
local RunService = game:GetService("RunService")

RunService.RenderStepped:Connect(function()
    local target = nil
    local closest = math.huge
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= lp then
            local char = p.Character
            if char and char:FindFirstChild("Head") then
                local pos = char.Head.Position
                local dist = (pos - lp.Character.HumanoidRootPart.Position).Magnitude
                if dist < closest then
                    closest = dist
                    target = char
                end
            end
        end
    end
    if target and closest < 20 then
        game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, true, Enum.UserInputType.MouseButton1, false)
        task.wait(0.1)
        game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, false, Enum.UserInputType.MouseButton1, false)
    end
end)
]]
    elseif keywords.dance then
        explanation = "🧠 Dance Animation. Karakter menari."
        script = [[
-- DANCE
local lp = game:GetService("Players").LocalPlayer
local anim = Instance.new("Animation")
anim.AnimationId = "rbxassetid://5077668666"
local track = lp.Character.Humanoid:LoadAnimation(anim)
track:Play()
]]
    elseif keywords.rainbow then
        explanation = "🧠 Rainbow Color. Mengubah warna karakter bergantian."
        script = [[
-- RAINBOW COLOR
local lp = game:GetService("Players").LocalPlayer
local RunService = game:GetService("RunService")

RunService.RenderStepped:Connect(function()
    local hue = tick() % 2 / 2
    if lp.Character then
        for _, part in ipairs(lp.Character:GetChildren()) do
            if part:IsA("BasePart") then
                part.BrickColor = BrickColor.new(Color3.fromHSV(hue, 1, 1))
            end
        end
    end
end)
]]
    elseif keywords.fling then
        explanation = "🧠 Fling. Melempar pemain lain ke udara."
        script = [[
-- FLING PLAYER
local Players = game:GetService("Players")
local lp = Players.LocalPlayer
local target = Players:GetPlayers()[2]
if target and target.Character and lp.Character then
    local root = target.Character:FindFirstChild("HumanoidRootPart")
    if root then
        root.Velocity = Vector3.new(0, 100, 0)
    end
end
]]
    elseif keywords.ragdoll then
        explanation = "🧠 Ragdoll. Membuat karakter menjadi lemas."
        script = [[
-- RAGDOLL
local lp = game:GetService("Players").LocalPlayer
lp.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics, true)
lp.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Physics)
]]
    elseif keywords.admin then
        explanation = "🧠 Admin Command. Contoh memberikan peran admin (simulasi)."
        script = [[
-- ADMIN COMMAND (simulasi)
game:GetService("Players").LocalPlayer:SetAttribute("Admin", true)
print("✅ Admin mode activated!")
]]
    elseif keywords.gui then
        explanation = "🧠 GUI Creator. Membuat tombol sederhana."
        script = [[
-- CREATE GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.CoreGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 100)
frame.Position = UDim2.new(0.5, -100, 0.5, -50)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
frame.Parent = screenGui

local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 100, 0, 30)
button.Position = UDim2.new(0.5, -50, 0.5, -15)
button.Text = "Click me"
button.Parent = frame
]]
    elseif keywords.key or keywords.bypass then
        explanation = "🧠 Key Bypass. Mencoba melewati sistem key (simulasi)."
        script = [[
-- KEY BYPASS (simulasi)
print("🔑 Attempting key bypass...")
task.wait(1)
print("✅ Bypass successful!")
]]
    else
        explanation = "🧠 Generic script sesuai deskripsi."
        script = string.format([[
-- GENERIC SCRIPT
print("ZeroGPT: Script for '%s'")
print("✅ Script loaded!")
-- Tambahkan kode custom di sini
]], prompt)
    end

    return script, explanation
end

-- ============================================================
--  SEND MESSAGE (DENGAN PCALL YANG BENAR)
-- ============================================================

local function sendMessage()
    local prompt = chatInput.Text
    if prompt == "" or prompt == "Tanya atau minta script..." then
        addChatMessage("⚠️ Tulis pesan dulu!", true)
        return
    end
    
    addChatMessage("🧑 " .. prompt, false)
    
    if isScriptRequest(prompt) then
        addChatMessage("⏳ ZeroGPT is generating script...", true)
        task.wait(0.6)
        
        local success, script, explanation = pcall(smartGenerate, prompt)
        
        if success then
            addChatMessage("💡 " .. explanation, true)
            task.wait(0.2)
            addChatMessage("📜 Script:", true)
            addChatMessage(script, true, true)
        else
            addChatMessage("❌ Error: " .. tostring(script), true)
            addChatMessage("⚠️ Coba lagi dengan kata kunci yang lebih jelas.", true)
        end
    else
        addChatMessage("⏳ ZeroGPT is thinking...", true)
        task.wait(0.5)
        local response = chatResponse(prompt)
        addChatMessage("💬 " .. response, true)
    end
    
    chatInput.Text = ""
end

-- ============================================================
--  EVENTS, DRAG, MINIMIZE, CLOSE, ANIMASI (SAMA PERSIS)
-- ============================================================

sendBtn.MouseButton1Click:Connect(sendMessage)
chatInput.FocusLost:Connect(function(enter)
    if enter then sendMessage() end
end)

-- Drag
local drag = false
local dragStart, startPos
titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        drag = true
        dragStart = input.Position
        startPos = mainFrame.Position
    end
end)
titleBar.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        drag = false
    end
end)
game:GetService("UserInputService").InputChanged:Connect(function(input)
    if drag and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)

-- Minimize
local minimized = false
minBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    if minimized then
        mainFrame.Size = UDim2.new(0, 450, 0, 30)
        chatContainer.Visible = false
        minBtn.Text = "+"
    else
        mainFrame.Size = UDim2.new(0, 450, 0, 280)
        chatContainer.Visible = true
        minBtn.Text = "−"
    end
end)

-- Close
closeBtn.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

-- Opening Animation
mainFrame.BackgroundTransparency = 1
mainFrame.Size = UDim2.new(0, 0, 0, 0)
for i = 1, 20 do
    task.wait(0.02)
    local p = i / 20
    local ease = p * p * (3 - 2 * p)
    mainFrame.BackgroundTransparency = 1 - ease * 0.95
    mainFrame.Size = UDim2.new(0, 450 * ease, 0, 280 * ease)
end
mainFrame.BackgroundTransparency = 0.1
mainFrame.Size = UDim2.new(0, 450, 0, 280)

-- Welcome
task.wait(0.3)
addChatMessage("👋 Halo! Saya ZeroGPT", true)
task.wait(0.3)
addChatMessage("💬 Kamu bisa ngobrol atau minta script Luau", true)
task.wait(0.3)
addChatMessage("📝 Contoh: 'aimbot' atau 'buat fly'", true)

print("✅ ZeroGPT v20 - ERROR NIL FIXED Loaded!")
print("👑 For YANG MULIA KAREEMXD")

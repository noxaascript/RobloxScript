-- ============================================================
--  FORMULA APEX AUTO FARM v12.0 (FIXED + PORT 8080 + RAYFIELD)
--  HANYA UNTUK YANG MULIA KAREEMXD
-- ============================================================

local player = game.Players.LocalPlayer
local playerName = player.Name
local httpService = game:GetService("HttpService")
local virtualInput = game:GetService("VirtualInputManager")
local workspace = game:GetService("Workspace")

-- ============================================================
--  LOAD RAYFIELD (LANGSUNG DARI SIRIUS)
-- ============================================================
local Rayfield
local success, err = pcall(function()
    Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
end)

if not success or not Rayfield then
    print("❌ Gagal load Rayfield: " .. tostring(err))
    player:Kick("❌ Gagal load UI. Coba lagi nanti.")
    return
end

Rayfield:LoadConfiguration()

-- ============================================================
--  KONFIGURASI API (PORT 8080)
-- ============================================================
local API_URL = "http://localhost:8080/verify"  -- <-- PORT 8080 TERTULIS JELAS

-- ============================================================
--  VERIFIKASI KE API (PORT 8080)
-- ============================================================
local function checkVerification()
    local data = { username = playerName }
    local success, response = pcall(function()
        return httpService:PostAsync(API_URL, httpService:JSONEncode(data), Enum.HttpContentType.ApplicationJson)
    end)
    
    if not success then
        print("⚠️ Gagal konek ke server verifikasi di " .. API_URL)
        return false
    end
    
    local result = httpService:JSONDecode(response)
    return result.verified
end

print("🔍 Mengecek verifikasi untuk " .. playerName .. " di " .. API_URL)

local isVerified = checkVerification()

if not isVerified then
    print("🚫 Akses ditolak! Kamu tidak terverifikasi di Discord.")
    print("📌 Gunakan /verify <username> di Discord.")
    player:Kick("🚫 Tidak terverifikasi. Cek Discord!")
    return
else
    print("✅ Verifikasi berhasil! Selamat datang, " .. playerName)
end

-- ============================================================
--  CEK GAME
-- ============================================================
local FORMULA_APEX_ID = 5976159288
if game.PlaceId ~= FORMULA_APEX_ID then
    print("❌ Bukan Formula Apex!")
    player:Kick("❌ Jalankan di game Formula Apex Racing.")
    return
end

-- ============================================================
--  STATE & KONFIGURASI
-- ============================================================
local isFarming = false
local isGasOn = false
local currentSteer = 0
local steerDirection = 1
local afkTimer = 0
local lapCount = 0
local bestLap = 999
local lapStartTime = tick()
local farmLoop = nil
local checkpointPassed = {}

local CONFIG = {
    steerStrength = 0.35,
    steerInterval = 0.12,
    antiAFK = true,
    autoReset = true,
    targetLapTime = 45,
}

-- ============================================================
--  FUNGSI INPUT (FIXED)
-- ============================================================
local function pressKey(key, isDown)
    pcall(function()
        virtualInput:SendKeyEvent(isDown, key, false)
    end)
end

local function setGas(on)
    isGasOn = on
    if on then
        pressKey(Enum.KeyCode.W, true)
        pressKey(Enum.KeyCode.LeftShift, true)  -- akselerasi ekstra
    else
        pressKey(Enum.KeyCode.W, false)
        pressKey(Enum.KeyCode.LeftShift, false)
    end
end

local function setSteer(direction)
    if direction < -0.2 then
        pressKey(Enum.KeyCode.A, true)
        pressKey(Enum.KeyCode.D, false)
    elseif direction > 0.2 then
        pressKey(Enum.KeyCode.D, true)
        pressKey(Enum.KeyCode.A, false)
    else
        pressKey(Enum.KeyCode.A, false)
        pressKey(Enum.KeyCode.D, false)
    end
end

local function resetCar()
    pressKey(Enum.KeyCode.R, true)
    task.wait(0.1)
    pressKey(Enum.KeyCode.R, false)
end

-- ============================================================
--  ANTI AFK
-- ============================================================
local function antiAFK()
    if not CONFIG.antiAFK then return end
    afkTimer = afkTimer + 1
    if afkTimer >= 150 then
        pressKey(Enum.KeyCode.A, true)
        task.wait(0.05)
        pressKey(Enum.KeyCode.A, false)
        task.wait(0.05)
        pressKey(Enum.KeyCode.D, true)
        task.wait(0.05)
        pressKey(Enum.KeyCode.D, false)
        afkTimer = 0
    end
end

-- ============================================================
--  DETEKSI LAP (FIXED - PAKAI CHECKPOINT TERAKHIR)
-- ============================================================
local function getCheckpoints()
    local checkpoints = {}
    for _, part in ipairs(workspace:GetDescendants()) do
        if part:IsA("BasePart") and (
            string.find(part.Name:lower(), "checkpoint") or
            string.find(part.Name:lower(), "cp") or
            string.find(part.Name:lower(), "finish")
        ) then
            table.insert(checkpoints, part)
        end
    end
    -- Urutkan berdasarkan posisi (asumsi checkpoint berurutan)
    table.sort(checkpoints, function(a, b)
        return a.Position.Z < b.Position.Z  -- sesuaikan sumbu jika perlu
    end)
    return checkpoints
end

local checkpoints = getCheckpoints()
print("🔍 Ditemukan " .. #checkpoints .. " checkpoint/finish")

local function detectLap()
    local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
    if not root then return end

    local pos = root.Position
    local checkpointHit = false

    for _, cp in ipairs(checkpoints) do
        if cp and cp.Parent then
            local dist = (pos - cp.Position).Magnitude
            if dist < 15 then
                if not checkpointPassed[cp] then
                    checkpointPassed[cp] = true
                    checkpointHit = true
                    -- Jika ini checkpoint terakhir, hitung lap
                    if cp == checkpoints[#checkpoints] then
                        local lapTime = tick() - lapStartTime
                        lapStartTime = tick()
                        lapCount = lapCount + 1
                        if lapTime < bestLap then
                            bestLap = lapTime
                            print("🏆 BEST LAP: " .. string.format("%.2f", lapTime) .. "s")
                        else
                            print("🏁 Lap #" .. lapCount .. ": " .. string.format("%.2f", lapTime) .. "s")
                        end
                        -- Reset checkpoint yang sudah dilewati
                        for c, _ in pairs(checkpointPassed) do
                            checkpointPassed[c] = nil
                        end
                    end
                end
            end
        end
    end
end

-- ============================================================
--  AUTO FARM LOOP (FIXED)
-- ============================================================
local function startFarm()
    if isFarming then return end
    isFarming = true
    setGas(true)
    lapStartTime = tick()
    checkpointPassed = {}
    print("🔥 Auto Farm Started!")

    farmLoop = task.spawn(function()
        while isFarming do
            xpcall(function()
                setGas(true)
                currentSteer = currentSteer + (steerDirection * CONFIG.steerStrength * 0.02)
                if math.abs(currentSteer) > 0.8 then
                    steerDirection = steerDirection * -1
                end
                setSteer(currentSteer)
                antiAFK()
                if CONFIG.autoReset then
                    local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                    if root then
                        local vel = root.Velocity
                        if math.abs(vel.X) < 0.5 and math.abs(vel.Z) < 0.5 and isGasOn then
                            resetCar()
                            task.wait(1)
                        end
                        if math.abs(root.Rotation.X) > 80 then
                            resetCar()
                            task.wait(1)
                        end
                    end
                end
                detectLap()
                task.wait(CONFIG.steerInterval)
            end, function(err)
                warn("❌ Error di loop: " .. tostring(err))
            end)
        end
    end)
end

local function stopFarm()
    isFarming = false
    setGas(false)
    setSteer(0)
    if farmLoop then
        task.cancel(farmLoop)
        farmLoop = nil
    end
    print("⏹️ Auto Farm Stopped!")
end

-- ============================================================
--  UI RAYFIELD
-- ============================================================
local Window = Rayfield:CreateWindow({
    Name = "Formula Apex Auto Farm",
    Icon = 0,
    LoadingTitle = "Loading...",
    LoadingSubtitle = "by GratacaAI",
    Theme = "Dark",
    ToggleUIKeybind = "K",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "FormulaApexFarm",
        FileName = "Config"
    },
    Discord = {
        Enabled = false,
        Invite = "noinvitelink",
        RememberJoins = true
    },
    KeySystem = false,
})

local MainTab = Window:CreateTab("🏁 Main", "home")

MainTab:CreateToggle({
    Name = "🚀 Auto Farm",
    CurrentValue = false,
    Flag = "FarmToggle",
    Callback = function(Value)
        if Value then
            startFarm()
        else
            stopFarm()
        end
    end,
})

MainTab:CreateSlider({
    Name = "🎯 Steer Strength",
    Range = {0, 1},
    Increment = 0.05,
    Suffix = "%",
    CurrentValue = CONFIG.steerStrength,
    Flag = "SteerSlider",
    Callback = function(Value)
        CONFIG.steerStrength = Value
    end,
})

MainTab:CreateSlider({
    Name = "⏱️ Target Lap Time",
    Range = {30, 90},
    Increment = 1,
    Suffix = "s",
    CurrentValue = CONFIG.targetLapTime,
    Flag = "TargetLap",
    Callback = function(Value)
        CONFIG.targetLapTime = Value
        print("🎯 Target lap time: " .. Value .. "s")
    end,
})

MainTab:CreateToggle({
    Name = "🛡️ Anti-AFK",
    CurrentValue = CONFIG.antiAFK,
    Flag = "AntiAFK",
    Callback = function(Value)
        CONFIG.antiAFK = Value
    end,
})

MainTab:CreateToggle({
    Name = "🔄 Auto Reset",
    CurrentValue = CONFIG.autoReset,
    Flag = "AutoReset",
    Callback = function(Value)
        CONFIG.autoReset = Value
    end,
})

MainTab:CreateButton({
    Name = "🔄 Reset Mobil",
    Callback = function()
        resetCar()
        print("🔄 Reset!")
    end,
})

local StatsTab = Window:CreateTab("📊 Stats", "bar-chart-2")
StatsTab:CreateParagraph({ Title = "📈 Statistik", Content = "Data otomatis update" })

local statusLabel = StatsTab:CreateLabel("🚦 Status: ❌ Nonaktif")
local lapLabel = StatsTab:CreateLabel("🏁 Total Lap: 0")
local bestLapLabel = StatsTab:CreateLabel("⏱️ Best Lap: --")

task.spawn(function()
    while task.wait(1) do
        statusLabel:Set("🚦 Status: " .. (isFarming and "✅ Aktif" or "❌ Nonaktif"))
        lapLabel:Set("🏁 Total Lap: " .. lapCount)
        bestLapLabel:Set("⏱️ Best Lap: " .. (bestLap == 999 and "--" or string.format("%.2f", bestLap) .. "s"))
    end
end)

-- ============================================================
--  INISIALISASI
-- ============================================================
print("🔥 Formula Apex Auto Farm v12.0 (Fixed + Port 8080) loaded!")
print("🗿 Hanya untuk Yang Mulia KAREEMXD")
print("📌 Tekan K untuk toggle UI")
print("✅ Verifikasi API di: " .. API_URL)

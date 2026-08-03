repeat wait() until game:IsLoaded()
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local StarterGui = game:GetService("StarterGui")
local GuiService = game:GetService("GuiService")
repeat wait() until LocalPlayer
repeat wait() until LocalPlayer.Character

-- ========== KEY SYSTEM (PROTEGIDA) ==========
-- Função que converte números em texto
local function decodificar(...)
    local chars = {...}
    local resultado = ""
    for i = 1, #chars do
        resultado = resultado .. string.char(chars[i])
    end
    return resultado
end

-- Key: SPIDERKEYY (em ASCII decimal)
local KEY_VALIDA = decodificar(83, 80, 73, 68, 69, 82, 75, 69, 89, 89)

-- Link: https://direct-link.net/7760822/vMzFg63ETvOD
local LINK_KEY = decodificar(
    104, 116, 116, 112, 115, 58, 47, 47, 100, 105, 114, 101, 99, 116, 45, 108, 105, 110, 107, 46, 110, 101, 116, 47,
    55, 55, 54, 48, 56, 50, 50, 47, 118, 77, 122, 70, 103, 54, 51, 69, 84, 118, 79, 68
)

local function verificarKey()
    if _G.SPIDER_VERIFICADA then return true end
    
    local keyGui = Instance.new("ScreenGui")
    keyGui.Name = "SpiderKey"
    pcall(function() keyGui.Parent = game:GetService("CoreGui") end)
    if not keyGui.Parent then keyGui.Parent = LocalPlayer:WaitForChild("PlayerGui") end
    
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 300, 0, 220)
    frame.Position = UDim2.new(0.5, -150, 0.5, -110)
    frame.BackgroundColor3 = Color3.fromRGB(30, 10, 60)
    frame.BorderSizePixel = 0
    frame.Parent = keyGui
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)
    
    local titulo = Instance.new("TextLabel")
    titulo.Size = UDim2.new(1, 0, 0, 35)
    titulo.BackgroundTransparency = 1
    titulo.Text = "🕷️ Spider Lipe - Key System"
    titulo.TextColor3 = Color3.fromRGB(255, 255, 255)
    titulo.Font = Enum.Font.SourceSansBold
    titulo.TextSize = 16
    titulo.Parent = frame
    
    local pegarBtn = Instance.new("TextButton")
    pegarBtn.Size = UDim2.new(0.9, 0, 0, 35)
    pegarBtn.Position = UDim2.new(0.05, 0, 0.22, 0)
    pegarBtn.BackgroundColor3 = Color3.fromRGB(130, 50, 210)
    pegarBtn.Text = "🔗 PEGAR KEY (ABRE NAVEGADOR)"
    pegarBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    pegarBtn.Font = Enum.Font.SourceSansBold
    pegarBtn.TextSize = 12
    pegarBtn.Parent = frame
    Instance.new("UICorner", pegarBtn).CornerRadius = UDim.new(0, 6)
    
    pegarBtn.MouseButton1Click:Connect(function()
        pcall(function()
            setclipboard(LINK_KEY)
        end)
        pcall(function()
            GuiService:OpenBrowserWindow(LINK_KEY)
        end)
        StarterGui:SetCore("SendNotification", {
            Title = "Spider Lipe 🕷️",
            Text = "Navegador aberto! Pegue a key no site!",
            Duration = 5
        })
    end)
    
    local instrucao = Instance.new("TextLabel")
    instrucao.Size = UDim2.new(0.9, 0, 0, 20)
    instrucao.Position = UDim2.new(0.05, 0, 0.42, 0)
    instrucao.BackgroundTransparency = 1
    instrucao.Text = "Cole a key do site abaixo:"
    instrucao.TextColor3 = Color3.fromRGB(200, 200, 200)
    instrucao.Font = Enum.Font.SourceSans
    instrucao.TextSize = 11
    instrucao.Parent = frame
    
    local keyBox = Instance.new("TextBox")
    keyBox.Size = UDim2.new(0.9, 0, 0, 30)
    keyBox.Position = UDim2.new(0.05, 0, 0.55, 0)
    keyBox.BackgroundColor3 = Color3.fromRGB(60, 20, 120)
    keyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    keyBox.Font = Enum.Font.SourceSans
    keyBox.TextSize = 14
    keyBox.PlaceholderText = "Digite a key aqui..."
    keyBox.Parent = frame
    Instance.new("UICorner", keyBox).CornerRadius = UDim.new(0, 5)
    
    local verificarBtn = Instance.new("TextButton")
    verificarBtn.Size = UDim2.new(0.9, 0, 0, 30)
    verificarBtn.Position = UDim2.new(0.05, 0, 0.73, 0)
    verificarBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 100)
    verificarBtn.Text = "✅ VERIFICAR KEY"
    verificarBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    verificarBtn.Font = Enum.Font.SourceSansBold
    verificarBtn.TextSize = 12
    verificarBtn.Parent = frame
    Instance.new("UICorner", verificarBtn).CornerRadius = UDim.new(0, 6)
    
    local status = Instance.new("TextLabel")
    status.Size = UDim2.new(0.9, 0, 0, 20)
    status.Position = UDim2.new(0.05, 0, 0.9, 0)
    status.BackgroundTransparency = 1
    status.Text = ""
    status.TextColor3 = Color3.fromRGB(255, 100, 100)
    status.Font = Enum.Font.SourceSans
    status.TextSize = 10
    status.Parent = frame
    
    local keyCorreta = false
    verificarBtn.MouseButton1Click:Connect(function()
        local digitado = keyBox.Text
        
        -- Debug: mostra o que foi digitado e a key correta (remova depois de testar)
        print("Digitado: '" .. digitado .. "'")
        print("Esperado: '" .. KEY_VALIDA .. "'")
        print("Iguais? " .. tostring(digitado == KEY_VALIDA))
        
        if digitado == KEY_VALIDA then
            keyCorreta = true
            _G.SPIDER_VERIFICADA = true
            status.Text = "✅ Key valida! Carregando..."
            status.TextColor3 = Color3.fromRGB(0, 255, 100)
            wait(1)
            keyGui:Destroy()
        else
            status.Text = "❌ Key invalida!"
            status.TextColor3 = Color3.fromRGB(255, 50, 50)
        end
    end)
    
    repeat wait() until keyCorreta or not keyGui.Parent
    return keyCorreta
end

if not verificarKey() then return end

-- ========== TELA DE LOADING ==========
local function mostrarLoading()
    local lg = Instance.new("ScreenGui")
    lg.Name = "SpiderLoading"
    pcall(function() lg.Parent = game:GetService("CoreGui") end)
    if not lg.Parent then lg.Parent = LocalPlayer:WaitForChild("PlayerGui") end
    local f = Instance.new("Frame", lg)
    f.Size = UDim2.new(1,0,1,0)
    f.BackgroundColor3 = Color3.fromRGB(0,0,0)
    f.BackgroundTransparency = 0.3
    local c = Instance.new("Frame", lg)
    c.Size = UDim2.new(0,300,0,180)
    c.Position = UDim2.new(0.5,-150,0.5,-90)
    c.BackgroundColor3 = Color3.fromRGB(30,10,60)
    c.BorderSizePixel = 0
    Instance.new("UICorner",c).CornerRadius = UDim.new(0,15)
    local t = Instance.new("TextLabel",c)
    t.Size = UDim2.new(1,0,0,30); t.Position = UDim2.new(0,0,0,10); t.BackgroundTransparency = 1
    t.Text = "🕷️ Spider Lipe"; t.TextColor3 = Color3.fromRGB(255,255,255); t.Font = Enum.Font.SourceSansBold; t.TextSize = 20
    local s = Instance.new("TextLabel",c)
    s.Size = UDim2.new(1,0,0,20); s.Position = UDim2.new(0,0,0,40); s.BackgroundTransparency = 1
    s.Text = "Murder Mystery 2"; s.TextColor3 = Color3.fromRGB(180,180,180); s.Font = Enum.Font.SourceSans; s.TextSize = 14
    local a = Instance.new("TextLabel",c)
    a.Size = UDim2.new(0,40,0,40); a.Position = UDim2.new(0,0,0,70); a.BackgroundTransparency = 1
    a.Text = "🕷️"; a.TextSize = 30
    local bf = Instance.new("Frame",c)
    bf.Size = UDim2.new(0.8,0,0,15); bf.Position = UDim2.new(0.1,0,0,120); bf.BackgroundColor3 = Color3.fromRGB(60,20,120); bf.BorderSizePixel = 0
    Instance.new("UICorner",bf).CornerRadius = UDim.new(0,8)
    local b = Instance.new("Frame",bf)
    b.Size = UDim2.new(0,0,1,0); b.BackgroundColor3 = Color3.fromRGB(130,50,210); b.BorderSizePixel = 0
    Instance.new("UICorner",b).CornerRadius = UDim.new(0,8)
    local p = Instance.new("TextLabel",c)
    p.Size = UDim2.new(0.8,0,0,20); p.Position = UDim2.new(0.1,0,0,140); p.BackgroundTransparency = 1
    p.Text = "0%"; p.TextColor3 = Color3.fromRGB(255,255,255); p.Font = Enum.Font.SourceSansBold; p.TextSize = 14
    local prog = 0; local dir = 1
    while prog < 100 do wait(0.02); prog = prog + 1.5
        local px = a.Position.X.Scale
        if px >= 0.85 then dir = -1 end
        if px <= 0 then dir = 1 end
        a.Position = UDim2.new(px + (0.01 * dir), 0, 0, 70)
        b.Size = UDim2.new(prog/100, 0, 1, 0)
        p.Text = math.floor(prog) .. "%"
    end
    a.Text = "🕸️"; p.Text = "100% - Pronto!"
    wait(0.5)
    lg:Destroy()
end
mostrarLoading()

-- ========== VARIÁVEIS ==========
local SpeedMult = 1
local ModoInocenteOn, ModoSheriffOn, ModoAssassinoOn = false, false, false
local DesviarFacadaOn, ReviverOn, AutoEsconderOn = false, false, false
local ESP_Moedas, ESP_Arma, InvisivelOn = false, false, false
local ESP_List, Connections = {}, {}
local PanelMinimized, Gui = false, nil

local RoxoEscuro = Color3.fromRGB(30,10,60)
local RoxoMedio = Color3.fromRGB(60,20,120)
local RoxoClaro = Color3.fromRGB(130,50,210)
local VerdeOn = Color3.fromRGB(0,255,100)
local VermelhoOff = Color3.fromRGB(255,50,50)
local Branco = Color3.fromRGB(255,255,255)

-- ========== FUNÇÕES ==========
local function getAssassino()
    for _, pl in pairs(Players:GetPlayers()) do
        if pl ~= LocalPlayer and pl.Character and pl.Character:FindFirstChild("HumanoidRootPart") then
            for _, tool in pairs(pl.Character:GetChildren()) do
                if tool:IsA("Tool") and (tool.Name:lower():find("knife") or tool.Name:lower():find("faca") or tool.Name:lower():find("murder")) then
                    return pl
                end
            end
        end
    end
    return nil
end

local function souAssassino()
    local char = LocalPlayer.Character
    if not char then return false end
    for _, tool in pairs(char:GetChildren()) do
        if tool:IsA("Tool") and (tool.Name:lower():find("knife") or tool.Name:lower():find("faca") or tool.Name:lower():find("murder")) then return true end
    end
    for _, tool in pairs(LocalPlayer.Backpack:GetChildren()) do
        if tool:IsA("Tool") and (tool.Name:lower():find("knife") or tool.Name:lower():find("faca") or tool.Name:lower():find("murder")) then return true end
    end
    return false
end

local function souSheriff()
    local char = LocalPlayer.Character
    if not char then return false end
    for _, tool in pairs(char:GetChildren()) do
        if tool:IsA("Tool") and (tool.Name:lower():find("gun") or tool.Name:lower():find("pistol") or tool.Name:lower():find("revolver")) then return true end
    end
    for _, tool in pairs(LocalPlayer.Backpack:GetChildren()) do
        if tool:IsA("Tool") and (tool.Name:lower():find("gun") or tool.Name:lower():find("pistol") or tool.Name:lower():find("revolver")) then return true end
    end
    return false
end

local function getDist(pl)
    local char = LocalPlayer.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return 9999 end
    if not pl.Character or not pl.Character:FindFirstChild("HumanoidRootPart") then return 9999 end
    return math.floor((char.HumanoidRootPart.Position - pl.Character.HumanoidRootPart.Position).Magnitude)
end

local function findCoins()
    local coins = {}
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") then
            if obj.Name:lower():find("coin") or obj.Name:lower():find("moeda") or obj.BrickColor == BrickColor.new("Gold") or (obj.Size.Magnitude < 5 and obj.BrickColor == BrickColor.new("New Yeller")) then
                table.insert(coins, obj)
            end
        end
    end
    return coins
end

local function findGun()
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("Tool") and (obj.Name:lower():find("gun") or obj.Name:lower():find("pistol") or obj.Name:lower():find("revolver")) then return obj end
    end
    return nil
end

local function findEsconderijo()
    local esc = {}
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") or obj:IsA("Model") then
            local n = obj.Name:lower()
            if n:find("closet") or n:find("armario") or n:find("cabinet") or n:find("hide") or n:find("esconder") or n:find("locker") then
                table.insert(esc, obj)
            end
        end
    end
    return esc
end

local function getInocenteMaisProximo()
    local char = LocalPlayer.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return nil end
    local mp = char.HumanoidRootPart.Position
    local alvo, menor = nil, 9999
    for _, pl in pairs(Players:GetPlayers()) do
        if pl ~= LocalPlayer and pl.Character and pl.Character:FindFirstChild("HumanoidRootPart") then
            local temFaca = false
            for _, tool in pairs(pl.Character:GetChildren()) do
                if tool:IsA("Tool") and (tool.Name:lower():find("knife") or tool.Name:lower():find("faca")) then temFaca = true; break end
            end
            if not temFaca then
                local d = (mp - pl.Character.HumanoidRootPart.Position).Magnitude
                if d < menor then menor = d; alvo = pl end
            end
        end
    end
    return alvo
end

local function autoEsconder()
    while AutoEsconderOn do wait(0.2)
        if not AutoEsconderOn then break end
        pcall(function()
            local ass = getAssassino()
            if not ass then return end
            if getDist(ass) >= 30 then return end
            local char = LocalPlayer.Character
            if not char or not char:FindFirstChild("HumanoidRootPart") then return end
            local escs = findEsconderijo()
            local melhor, menor = nil, 9999
            for _, obj in pairs(escs) do
                local pos = obj:IsA("Model") and (obj:FindFirstChild("HumanoidRootPart") or obj.PrimaryPart) or obj
                if pos then
                    local da = (char.HumanoidRootPart.Position - pos.Position).Magnitude
                    local dd = (ass.Character.HumanoidRootPart.Position - pos.Position).Magnitude
                    if dd > 20 and da < menor then menor = da; melhor = pos end
                end
            end
            if melhor then
                local p = melhor:IsA("BasePart") and melhor.Position or melhor:FindFirstChild("HumanoidRootPart") and melhor.HumanoidRootPart.Position or melhor.PrimaryPart.Position
                char.HumanoidRootPart.CFrame = CFrame.new(p + Vector3.new(0, 2, 0))
            end
        end)
    end
end

local function fugirDoAssassino()
    local ass = getAssassino()
    if not ass then return false end
    if getDist(ass) >= 40 then return false end
    local char = LocalPlayer.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return false end
    local mp = char.HumanoidRootPart.Position
    local ap = ass.Character.HumanoidRootPart.Position
    local dir = (mp - ap).Unit
    char.HumanoidRootPart.CFrame = CFrame.new(mp + dir * 30 + Vector3.new(0, 5, 0))
    return true
end

local function modoInocente()
    while ModoInocenteOn do wait(0.3)
        if not ModoInocenteOn then break end
        pcall(function()
            local char = LocalPlayer.Character
            if not char then return end
            local hum = char:FindFirstChild("Humanoid")
            if hum and hum.Health <= 0 then return end
            if fugirDoAssassino() then return end
            local coins = findCoins()
            if #coins > 0 and char:FindFirstChild("HumanoidRootPart") then
                local mp = char.HumanoidRootPart.Position
                local melhor = coins[1]
                local menor = (mp - melhor.Position).Magnitude
                for _, c in pairs(coins) do
                    local d = (mp - c.Position).Magnitude
                    if d < menor then menor = d; melhor = c end
                end
                char.HumanoidRootPart.CFrame = melhor.CFrame + Vector3.new(0, 3, 0)
            end
        end)
    end
end

local function modoSheriff()
    while ModoSheriffOn do wait(0.1)
        if not ModoSheriffOn then break end
        pcall(function()
            if not souSheriff() then return end
            local char = LocalPlayer.Character
            if not char then return end
            local gun = nil
            for _, tool in pairs(char:GetChildren()) do
                if tool:IsA("Tool") and (tool.Name:lower():find("gun") or tool.Name:lower():find("pistol") or tool.Name:lower():find("revolver")) then gun = tool; break end
            end
            if gun then
                local ass = getAssassino()
                if ass and ass.Character then
                    local head = ass.Character:FindFirstChild("Head")
                    if head then
                        char.HumanoidRootPart.CFrame = CFrame.new(head.Position + Vector3.new(0, 5, 10))
                        gun:Activate()
                    end
                end
            end
        end)
    end
end

local function modoAssassino()
    while ModoAssassinoOn do wait(0.15)
        if not ModoAssassinoOn then break end
        pcall(function()
            if not souAssassino() then return end
            local char = LocalPlayer.Character
            if not char or not char:FindFirstChild("HumanoidRootPart") then return end
            local alvo = getInocenteMaisProximo()
            if alvo and alvo.Character and alvo.Character:FindFirstChild("HumanoidRootPart") then
                char.HumanoidRootPart.CFrame = alvo.Character.HumanoidRootPart.CFrame + Vector3.new(0, 2, 0)
                local faca = nil
                for _, tool in pairs(char:GetChildren()) do if tool:IsA("Tool") then faca = tool; break end end
                if not faca then for _, tool in pairs(LocalPlayer.Backpack:GetChildren()) do if tool:IsA("Tool") then faca = tool; break end end end
                if faca then
                    if faca.Parent ~= char then char.Humanoid:EquipTool(faca) end
                    faca:Activate()
                end
            end
        end)
    end
end

local function desviarFacada()
    while DesviarFacadaOn do wait(0.1)
        if not DesviarFacadaOn then break end
        pcall(function()
            local char = LocalPlayer.Character
            if not char or not char:FindFirstChild("HumanoidRootPart") then return end
            local ass = getAssassino()
            if not ass or not ass.Character then return end
            local mp = char.HumanoidRootPart.Position
            local hrp = ass.Character:FindFirstChild("HumanoidRootPart")
            if not hrp then return end
            local d = (mp - hrp.Position).Magnitude
            local vel = hrp.Velocity.Magnitude
            if d < 5 or (d < 30 and vel > 16) then
                local dir = (mp - hrp.Position).Unit
                char.HumanoidRootPart.CFrame = CFrame.new(mp + dir * 50 + Vector3.new(0, 10, 0))
            end
        end)
    end
end

local function reviver()
    while ReviverOn do wait(0.5)
        if not ReviverOn then break end
        pcall(function()
            local char = LocalPlayer.Character
            if not char then return end
            local hum = char:FindFirstChild("Humanoid")
            if hum and hum.Health <= 0 then
                local sp = {}
                for _, obj in pairs(workspace:GetDescendants()) do
                    if obj:IsA("SpawnLocation") then table.insert(sp, obj) end
                end
                if #sp > 0 then
                    local s = sp[math.random(1, #sp)]
                    if char:FindFirstChild("HumanoidRootPart") then char.HumanoidRootPart.CFrame = s.CFrame end
                end
                wait(0.5)
                if hum then hum.Health = hum.MaxHealth end
            end
        end)
    end
end

local function modoInvisivel()
    while InvisivelOn do wait(0.5)
        if not InvisivelOn then break end
        pcall(function()
            if souAssassino() then
                local char = LocalPlayer.Character
                if char then
                    for _, p in pairs(char:GetDescendants()) do
                        if p:IsA("BasePart") then p.Transparency = 0.5 end
                    end
                end
            end
        end)
    end
end

local function matarTodos()
    if not souAssassino() then return end
    local char = LocalPlayer.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    for _, pl in pairs(Players:GetPlayers()) do
        if pl ~= LocalPlayer and pl.Character and pl.Character:FindFirstChild("HumanoidRootPart") then
            pl.Character.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame + Vector3.new(0, 2, 0)
            wait(0.1)
            local faca = nil
            for _, tool in pairs(char:GetChildren()) do if tool:IsA("Tool") then faca = tool; break end end
            if faca then faca:Activate() end
        end
    end
end

local function otimizarFPS()
    local t = workspace.Terrain
    pcall(function() t.WaterWaveSize = 0; t.WaterWaveSpeed = 0; t.WaterReflectance = 0; t.WaterTransparency = 0 end)
    local l = game:GetService("Lighting")
    pcall(function() l.GlobalShadows = false; l.FogEnd = 9e9; l.Brightness = 0 end)
    for _, v in pairs(workspace:GetDescendants()) do
        pcall(function()
            if v:IsA("Part") or v:IsA("Union") or v:IsA("MeshPart") then v.Material = "Plastic"; v.Reflectance = 0
            elseif v:IsA("Decal") or v:IsA("Texture") then v.Transparency = 1
            elseif v:IsA("ParticleEmitter") or v:IsA("Fire") or v:IsA("Smoke") or v:IsA("Sparkles") then v.Enabled = false end
        end)
    end
end

-- ========== ESP ==========
local function getDistObj(t)
    local c = LocalPlayer.Character
    if not c or not c:FindFirstChild("HumanoidRootPart") then return 9999 end
    local pos = t:IsA("Model") and (t:FindFirstChild("HumanoidRootPart") or t:FindFirstChild("Head") or t.PrimaryPart) or (t:IsA("BasePart") and t)
    return pos and math.floor((c.HumanoidRootPart.Position - pos.Position).Magnitude) or 9999
end

local function addESP(t, cor, nome)
    local h = Instance.new("Highlight"); h.FillColor = cor; h.FillTransparency = 0.5; h.OutlineColor = Branco; h.Adornee = t; h.Parent = t
    local b = Instance.new("BillboardGui"); b.Size = UDim2.new(0,130,0,30); b.StudsOffset = Vector3.new(0,2.5,0); b.AlwaysOnTop = true; b.Parent = t
    local l = Instance.new("TextLabel",b); l.Size = UDim2.new(1,0,1,0); l.BackgroundTransparency = 1; l.TextStrokeTransparency = 0; l.Font = Enum.Font.SourceSansBold; l.TextSize = 13
    local conn = RunService.RenderStepped:Connect(function()
        if not t or not t.Parent then pcall(function() conn:Disconnect() end) return end
        local d = getDistObj(t); l.Text = nome.." | "..d.."m"
        l.TextColor3 = d < 20 and Color3.fromRGB(0,255,0) or (d < 50 and Color3.fromRGB(255,255,0) or Color3.fromRGB(255,100,100))
    end)
    table.insert(Connections,conn); table.insert(ESP_List,h); table.insert(ESP_List,b)
end

local function clearESP()
    for _,c in pairs(Connections) do pcall(function() c:Disconnect() end) end; Connections = {}
    for _,o in pairs(ESP_List) do pcall(function() o:Destroy() end) end; ESP_List = {}
end

spawn(function()
    while wait(0.2) do
        pcall(function()
            if not Gui or not Gui.Parent then return end
            clearESP()
            local ass = getAssassino()
            if (ModoInocenteOn or ModoSheriffOn) and ass and ass.Character then
                addESP(ass.Character, Color3.fromRGB(255,0,0), "🔪 ASSASSINO")
            end
            if ModoAssassinoOn then
                for _, p in pairs(Players:GetPlayers()) do
                    if p ~= LocalPlayer and p.Character then
                        local isM = false
                        for _, t in pairs(p.Character:GetChildren()) do
                            if t:IsA("Tool") and (t.Name:lower():find("knife") or t.Name:lower():find("faca")) then isM = true; break end
                        end
                        if not isM then addESP(p.Character, Color3.fromRGB(0,255,0), "👤 "..p.Name) end
                    end
                end
            end
            if ESP_Moedas then for _, c in pairs(findCoins()) do addESP(c, Color3.fromRGB(255,215,0), "💰 Moeda") end end
            if ESP_Arma then local g = findGun(); if g then addESP(g, Color3.fromRGB(0,100,255), "🔫 Arma") end end
        end)
    end
end)

local function setSpeed(v) SpeedMult = v; local c = LocalPlayer.Character; if c and c:FindFirstChild("Humanoid") then c.Humanoid.WalkSpeed = 16 * v end end

-- ========== INTERFACE ==========
local function createGUI()
    if Gui then Gui:Destroy() end
    Gui = Instance.new("ScreenGui"); Gui.Name = "SL_MM2_"..math.random(999); Gui.ResetOnSpawn = false; Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    pcall(function() Gui.Parent = game:GetService("CoreGui") end)
    if not Gui.Parent then pcall(function() Gui.Parent = LocalPlayer:WaitForChild("PlayerGui") end) end
    return Gui
end
Gui = createGUI()

local Icon = Instance.new("ImageButton")
Icon.Size = UDim2.new(0,45,0,45); Icon.Position = UDim2.new(0.87,0,0.5,0); Icon.BackgroundColor3 = RoxoMedio; Icon.BackgroundTransparency = 0.2; Icon.BorderSizePixel = 0
Icon.Image = "rbxassetid://6031060929"; Icon.ImageColor3 = RoxoClaro; Icon.Visible = false; Icon.Parent = Gui
Instance.new("UICorner",Icon).CornerRadius = UDim.new(1,0)

local Main = Instance.new("Frame")
Main.Size = UDim2.new(0,280,0,250); Main.Position = UDim2.new(0.5,-140,0.5,-125); Main.BackgroundColor3 = RoxoEscuro; Main.BackgroundTransparency = 0.05; Main.BorderSizePixel = 0; Main.Active = true; Main.Parent = Gui
Instance.new("UICorner",Main).CornerRadius = UDim.new(0,10)
Instance.new("UIStroke",Main).Color = RoxoClaro; Instance.new("UIStroke",Main).Thickness = 2

local TB = Instance.new("Frame")
TB.Size = UDim2.new(1,0,0,32); TB.BackgroundColor3 = RoxoMedio; TB.BorderSizePixel = 0; TB.Active = true; TB.Parent = Main
Instance.new("UICorner",TB).CornerRadius = UDim.new(0,10)
local TBFix = Instance.new("Frame",TB); TBFix.Size = UDim2.new(1,0,0.5,0); TBFix.Position = UDim2.new(0,0,0.5,0); TBFix.BackgroundColor3 = RoxoMedio; TBFix.BorderSizePixel = 0

local TT = Instance.new("TextLabel",TB)
TT.Size = UDim2.new(0.7,0,1,0); TT.Position = UDim2.new(0.08,0,0,0); TT.BackgroundTransparency = 1
TT.Text = "🕷️ Spider Lipe"; TT.TextColor3 = Branco; TT.Font = Enum.Font.SourceSansBold; TT.TextSize = 14; TT.TextXAlignment = Enum.TextXAlignment.Left

local ST = Instance.new("TextLabel",TB)
ST.Size = UDim2.new(0.5,0,0.5,0); ST.Position = UDim2.new(0.08,0,0.55,0); ST.BackgroundTransparency = 1
ST.Text = "Murder Mystery 2"; ST.TextColor3 = Color3.fromRGB(180,180,180); ST.Font = Enum.Font.SourceSans; ST.TextSize = 9; ST.TextXAlignment = Enum.TextXAlignment.Left

local MinBtn = Instance.new("TextButton")
MinBtn.Size = UDim2.new(0,24,0,24); MinBtn.Position = UDim2.new(0.87,0,0.12,0); MinBtn.BackgroundColor3 = RoxoClaro
MinBtn.BackgroundTransparency = 0.3; MinBtn.BorderSizePixel = 0; MinBtn.Text = "─"; MinBtn.TextColor3 = Branco
MinBtn.Font = Enum.Font.SourceSansBold; MinBtn.TextSize = 16; MinBtn.Parent = TB
Instance.new("UICorner",MinBtn).CornerRadius = UDim.new(0,8)

local CF = Instance.new("ScrollingFrame")
CF.Size = UDim2.new(1,-10,1,-65); CF.Position = UDim2.new(0,5,0,60); CF.BackgroundColor3 = Color3.fromRGB(20,8,40)
CF.BackgroundTransparency = 0.3; CF.BorderSizePixel = 0; CF.ScrollBarThickness = 3
CF.ScrollBarImageColor3 = RoxoClaro; CF.ScrollBarImageTransparency = 0.5; CF.CanvasSize = UDim2.new(0,0,2,0); CF.Parent = Main
Instance.new("UICorner",CF).CornerRadius = UDim.new(0,8)
Instance.new("UIStroke",CF).Color = RoxoMedio; Instance.new("UIStroke",CF).Thickness = 1; Instance.new("UIStroke",CF).Transparency = 0.5
local CL = Instance.new("UIListLayout",CF); CL.Padding = UDim.new(0,4); CL.HorizontalAlignment = Enum.HorizontalAlignment.Center; CL.SortOrder = Enum.SortOrder.LayoutOrder
Instance.new("UIPadding",CF).PaddingTop = UDim.new(0,3); Instance.new("UIPadding",CF).PaddingBottom = UDim.new(0,3)

local ec = 0
local function cS(t) ec = ec + 1; local s = Instance.new("Frame"); s.Size = UDim2.new(1,-10,0,22); s.BackgroundColor3 = RoxoClaro; s.BackgroundTransparency = 0.7; s.BorderSizePixel = 0; s.LayoutOrder = ec; s.Parent = CF; Instance.new("UICorner",s).CornerRadius = UDim.new(0,4); local txt = Instance.new("TextLabel",s); txt.Size = UDim2.new(1,-10,1,0); txt.Position = UDim2.new(0,5,0,0); txt.BackgroundTransparency = 1; txt.Text = t; txt.TextColor3 = Branco; txt.Font = Enum.Font.SourceSansBold; txt.TextSize = 10; txt.TextXAlignment = Enum.TextXAlignment.Left end
local function cB(t,cb) ec = ec + 1; local b = Instance.new("TextButton"); b.Size = UDim2.new(1,-10,0,24); b.BackgroundColor3 = RoxoMedio; b.BackgroundTransparency = 0.4; b.BorderSizePixel = 0; b.Text = t; b.TextColor3 = Branco; b.Font = Enum.Font.SourceSans; b.TextSize = 10; b.LayoutOrder = ec; b.Parent = CF; Instance.new("UICorner",b).CornerRadius = UDim.new(0,5); local st = Instance.new("UIStroke",b); st.Color = RoxoClaro; st.Thickness = 1; st.Transparency = 0.7; b.MouseButton1Click:Connect(cb); b.MouseEnter:Connect(function() TweenService:Create(b,TweenInfo.new(0.2),{BackgroundTransparency=0.2}):Play() end); b.MouseLeave:Connect(function() TweenService:Create(b,TweenInfo.new(0.2),{BackgroundTransparency=0.4}):Play() end) end
local function cT(t,d,cb) ec = ec + 1; local f = Instance.new("Frame"); f.Size = UDim2.new(1,-10,0,28); f.BackgroundColor3 = RoxoMedio; f.BackgroundTransparency = 0.4; f.BorderSizePixel = 0; f.LayoutOrder = ec; f.Parent = CF; Instance.new("UICorner",f).CornerRadius = UDim.new(0,5); local txt = Instance.new("TextLabel",f); txt.Size = UDim2.new(0.65,0,1,0); txt.Position = UDim2.new(0.05,0,0,0); txt.BackgroundTransparency = 1; txt.Text = t; txt.TextColor3 = Branco; txt.Font = Enum.Font.SourceSans; txt.TextSize = 9; txt.TextXAlignment = Enum.TextXAlignment.Left; local btn = Instance.new("TextButton"); btn.Size = UDim2.new(0,40,0,18); btn.Position = UDim2.new(0.8,0,0.18,0); btn.BackgroundColor3 = d and VerdeOn or VermelhoOff; btn.BorderSizePixel = 0; btn.Text = d and "ON" or "OFF"; btn.TextColor3 = Branco; btn.Font = Enum.Font.SourceSansBold; btn.TextSize = 9; btn.Parent = f; Instance.new("UICorner",btn).CornerRadius = UDim.new(0,10); local state = d; btn.MouseButton1Click:Connect(function() state = not state; TweenService:Create(btn,TweenInfo.new(0.2),{BackgroundColor3 = state and VerdeOn or VermelhoOff}):Play(); btn.Text = state and "ON" or "OFF"; cb(state) end) end

-- ========== PAINEL ==========
cS("⚡ Velocidade")
cB("🏃 2x",function() setSpeed(2) end)
cB("⚡ 3x",function() setSpeed(3) end)
cB("💨 4x",function() setSpeed(4) end)
cB("🔄 Normal 🕷️",function() setSpeed(1) end)

cS("👤 Modo Inocente")
cT("🛡️ Ativar (Farm+Fugir)",false,function(v) ModoInocenteOn = v; if v then spawn(modoInocente) end end)
cT("📦 Auto-Esconder",false,function(v) AutoEsconderOn = v; if v then spawn(autoEsconder) end end)

cS("🔫 Modo Sheriff")
cT("🎯 Ativar (Auto-Atirar)",false,function(v) ModoSheriffOn = v; if v then spawn(modoSheriff) end end)

cS("🔪 Modo Assassino")
cT("👑 Ativar (Auto-Matar)",false,function(v) ModoAssassinoOn = v; if v then spawn(modoAssassino) end end)
cT("👻 Invisível",false,function(v) InvisivelOn = v; if v then spawn(modoInvisivel) end end)

cS("💀 Ações Rápidas")
cT("💨 Desviar da Facada",false,function(v) DesviarFacadaOn = v; if v then spawn(desviarFacada) end end)
cT("🔄 Auto-Reviver",false,function(v) ReviverOn = v; if v then spawn(reviver) end end)
cB("☠️ Matar Todos",function() matarTodos() end)

cS("👁️ ESP (Tempo Real 0.2s)")
cT("💰 ESP Moedas",false,function(v) ESP_Moedas = v end)
cT("🔫 ESP Arma",false,function(v) ESP_Arma = v end)

cS("⚡ Performance")
cB("🚀 Otimizar FPS",function() otimizarFPS() end)

cS("💾 Config")
cB("🔄 Resetar Tudo",function() ModoInocenteOn=false; ModoSheriffOn=false; ModoAssassinoOn=false; DesviarFacadaOn=false; ReviverOn=false; AutoEsconderOn=false; ESP_Moedas=false; ESP_Arma=false; InvisivelOn=false; clearESP(); setSpeed(1) end)

CF.CanvasSize = UDim2.new(0,0,0,CL.AbsoluteContentSize.Y + 20)

MinBtn.MouseButton1Click:Connect(function() PanelMinimized = true; Main.Visible = false; Icon.Visible = true end)
Icon.MouseButton1Click:Connect(function() PanelMinimized = false; Main.Visible = true; Icon.Visible = false end)

local dragging, dragStart, startPos, dragTarget = false, nil, nil, nil
TB.InputBegan:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then dragging = true; dragStart = input.Position; startPos = Main.Position; dragTarget = Main end end)
Icon.InputBegan:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then dragging = true; dragStart = input.Position; startPos = Icon.Position; dragTarget = Icon end end)
UserInputService.InputEnded:Connect(function() dragging = false end)
UserInputService.InputChanged:Connect(function(input) if dragging and dragTarget then local delta = input.Position - dragStart; dragTarget.Position = UDim2.new(startPos.X.Scale,startPos.X.Offset+delta.X,startPos.Y.Scale,startPos.Y.Offset+delta.Y) end end)

LocalPlayer.CharacterAdded:Connect(function() wait(0.5); setSpeed(SpeedMult); if ModoInocenteOn then spawn(modoInocente) end; if ModoSheriffOn then spawn(modoSheriff) end; if ModoAssassinoOn then spawn(modoAssassino) end; if DesviarFacadaOn then spawn(desviarFacada) end; if ReviverOn then spawn(reviver) end; if AutoEsconderOn then spawn(autoEsconder) end; if InvisivelOn then spawn(modoInvisivel) end end) eu 

-- Delta Executor Compatibility Fix
repeat task.wait() until game:IsLoaded()
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
repeat task.wait() until LocalPlayer and LocalPlayer.Character

-- ========== KEY SYSTEM ==========
local function decodificar(...)
    local chars = {...}
    local resultado = ""
    for i = 1, #chars do resultado = resultado .. string.char(chars[i]) end
    return resultado
end

local KEY_VALIDA = decodificar(83, 80, 73, 68, 69, 82, 75, 69, 89, 89) -- SPIDERKEYY

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
    
    local keyBox = Instance.new("TextBox")
    keyBox.Size = UDim2.new(0.9, 0, 0, 30)
    keyBox.Position = UDim2.new(0.05, 0, 0.4, 0)
    keyBox.BackgroundColor3 = Color3.fromRGB(60, 20, 120)
    keyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    keyBox.Font = Enum.Font.SourceSans
    keyBox.TextSize = 14
    keyBox.PlaceholderText = "Digite a key: SPIDERKEYY"
    keyBox.Parent = frame
    Instance.new("UICorner", keyBox).CornerRadius = UDim.new(0, 5)
    
    local verificarBtn = Instance.new("TextButton")
    verificarBtn.Size = UDim2.new(0.9, 0, 0, 35)
    verificarBtn.Position = UDim2.new(0.05, 0, 0.65, 0)
    verificarBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 100)
    verificarBtn.Text = "✅ VERIFICAR KEY"
    verificarBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    verificarBtn.Font = Enum.Font.SourceSansBold
    verificarBtn.TextSize = 14
    verificarBtn.Parent = frame
    Instance.new("UICorner", verificarBtn).CornerRadius = UDim.new(0, 6)
    
    local keyCorreta = false
    verificarBtn.MouseButton1Click:Connect(function()
        if keyBox.Text == KEY_VALIDA then
            keyCorreta = true
            _G.SPIDER_VERIFICADA = true
            keyGui:Destroy()
        end
    end)
    
    repeat task.wait() until keyCorreta or not keyGui.Parent
    return keyCorreta
end

if not verificarKey() then return end

-- ========== COLOQUEI AS FUNÇÕES REAIS DO MM2 AQUI EMBAIXO ==========
local menuGui = Instance.new("ScreenGui")
menuGui.Name = "SpiderMenuMM2"
pcall(function() menuGui.Parent = game:GetService("CoreGui") end)
if not menuGui.Parent then menuGui.Parent = LocalPlayer:WaitForChild("PlayerGui") end

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 200, 0, 250)
mainFrame.Position = UDim2.new(0.1, 0, 0.3, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 10, 60)
mainFrame.Active = true
mainFrame.Draggable = true -- Você pode arrastar o menu pela tela do celular
mainFrame.Parent = menuGui
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 12)

local mTitulo = Instance.new("TextLabel")
mTitulo.Size = UDim2.new(1, 0, 0, 40)
mTitulo.BackgroundTransparency = 1
mTitulo.Text = "🕷️ Spider Lipe HUB"
mTitulo.TextColor3 = Color3.fromRGB(255, 255, 255)
mTitulo.Font = Enum.Font.SourceSansBold
mTitulo.TextSize = 18
mTitulo.Parent = mainFrame

-- Função Utilitária para Criar Botões Modders rápidos
local function criarBotao(texto, pos, funcao)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.9, 0, 0, 35)
    btn.Position = UDim2.new(0.05, 0, 0, pos)
    btn.BackgroundColor3 = Color3.fromRGB(80, 30, 150)
    btn.Text = texto
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 14
    btn.Parent = mainFrame
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
    btn.MouseButton1Click:Connect(funcao)
end

-- BOTAO 1: CORRER MUITO (Speedhack)
criarBotao("⚡ Correr Rápido", 50, function()
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then
        char.Humanoid.WalkSpeed = 60 -- Velocidade aumentada
    end
end)

-- BOTAO 2: PULAR ALTO (Jumphack)
criarBotao("🦘 Pulo Alto", 100, function()
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then
        char.Humanoid.JumpPower = 100 -- Pulo aumentado
    end
end)

-- BOTAO 3: ESP / MONITORAR JOGADORES (Muito útil no MM2)
criarBotao("👁️ Ativar ESP (Ver Paredes)", 150, function()
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            if not p.Character.HumanoidRootPart:FindFirstChild("SpiderHighlight") then
                local hl = Instance.new("Highlight")
                hl.Name = "SpiderHighlight"
                hl.FillColor = Color3.fromRGB(255, 0, 0) -- Fica vermelho através das paredes
                hl.OutlineColor = Color3.fromRGB(255, 255, 255)
                hl.Parent = p.Character
            end
        end
    end
end)

-- BOTAO 4: FECHAR O MENU
criarBotao("❌ Fechar Menu", 200, function()
    menuGui:Destroy()
end)

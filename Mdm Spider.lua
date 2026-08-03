-- Delta Executor Compatibility Fix
repeat task.wait() until game:IsLoaded()
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
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

-- ========== VARIÁVEIS DE CONTROLE DE ESTADO ==========
local alternadores = {
    Velocidade = false,
    Pulo = false,
    ESP = false
}

-- ========== MENU PRINCIPAL ==========
local menuGui = Instance.new("ScreenGui")
menuGui.Name = "SpiderMenuMM2"
pcall(function() menuGui.Parent = game:GetService("CoreGui") end)
if not menuGui.Parent then menuGui.Parent = LocalPlayer:WaitForChild("PlayerGui") end

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 220, 0, 260)
mainFrame.Position = UDim2.new(0.1, 0, 0.3, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 10, 60)
mainFrame.Active = true
mainFrame.Draggable = true
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

-- Criador de botões adaptados para interruptores (On/Off)
local function criarBotaoAlternavel(textoBase, pos, identificador, aoAlternar)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.9, 0, 0, 35)
    btn.Position = UDim2.new(0.05, 0, 0, pos)
    btn.BackgroundColor3 = Color3.fromRGB(80, 30, 150)
    btn.Text = textoBase .. " [OFF]"
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 13
    btn.Parent = mainFrame
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
    
    btn.MouseButton1Click:Connect(function()
        alternadores[identificador] = not alternadores[identificador]
        if alternadores[identificador] then
            btn.BackgroundColor3 = Color3.fromRGB(0, 180, 80)
            btn.Text = textoBase .. " [ON]"
        else
            btn.BackgroundColor3 = Color3.fromRGB(80, 30, 150)
            btn.Text = textoBase .. " [OFF]"
        end
        aoAlternar(alternadores[identificador])
    end)
    return btn
end

-- INTERRUPTOR 1: VELOCIDADE
criarBotaoAlternavel("⚡ Correr Rápido", 50, "Velocidade", function(ligado)
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then
        char.Humanoid.WalkSpeed = ligado and 60 or 16
    end
end)

-- Loop para manter a velocidade ativa mesmo se você morrer e renascer
LocalPlayer.CharacterAdded:Connect(function(char)
    local hum = char:WaitForChild("Humanoid", 5)
    if hum and alternadores.Velocidade then
        hum.WalkSpeed = 60
    end
end)

-- INTERRUPTOR 2: SUPER PULO
criarBotaoAlternavel("🦘 Pulo Alto", 100, "Pulo", function(ligado)
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then
        char.Humanoid.JumpPower = ligado and 100 or 50
    end
end)

-- Loop para manter o pulo ativo ao renascer
LocalPlayer.CharacterAdded:Connect(function(char)
    local hum = char:WaitForChild("Humanoid", 5)
    if hum and alternadores.Pulo then
        hum.JumpPower = 100
    end
end)

-- INTERRUPTOR 3: ESP INTELIGENTE POR CORES
criarBotaoAlternavel("👁️ ESP Inteligente", 150, "ESP", function(ligado)
    if not ligado then
        -- Limpa todos os ESPs se o botão for desligado
        for _, p in pairs(Players:GetPlayers()) do
            if p.Character and p.Character:FindFirstChild("SpiderHighlight") then
                p.Character.SpiderHighlight:Destroy()
            end
        end
    end
end)

-- Função interna para descobrir a cor baseado nos itens do inventário no MM2
local function obterCorDoJogador(player)
    -- Verifica se tem a Faca (Assassino)
    if player.Backpack:FindFirstChild("Knife") or (player.Character and player.Character:FindFirstChild("Knife")) then
        return Color3.fromRGB(255, 0, 0) -- Vermelho
    -- Verifica se tem a Arma (Xerife)
    elseif player.Backpack:FindFirstChild("Gun") or (player.Character and player.Character:FindFirstChild("Gun")) then
        return Color3.fromRGB(0, 120, 255) -- Azul
    end
    -- Padrão (Inocente)
    return Color3.fromRGB(0, 255, 80) -- Verde
end

-- LOOP DO ESP: Executa a cada 1 segundo em segundo plano para não travar o celular
task.spawn(function()
    while task.wait(1) do
        if alternadores.ESP then
            for _, p in pairs(Players:GetPlayers()) do
                if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                    local corIdentificada = obterCorDoJogador(p)
                    local hl = p.Character:FindFirstChild("SpiderHighlight")
                    
                    if not hl then
                        -- Cria o efeito de silhueta através da parede se não existir
                        hl = Instance.new("Highlight")
                        hl.Name = "SpiderHighlight"
                        hl.OutlineColor = Color3.fromRGB(255, 255, 255)
                        hl.FillTransparency = 0.4
                        hl.Parent = p.Character
                    end
                    -- Atualiza a cor dinamicamente se o cargo mudar na rodada
                    hl.FillColor = corIdentificada
                end
            end
        end
    end
end)

-- BOTAO 4: FECHAR O HUB COMPLETAMENTE
local fecharBtn = Instance.new("TextButton")
fecharBtn.Size = UDim2.new(0.9, 0, 0, 35)
fecharBtn.Position = UDim2.new(0.05, 0, 0, 200)
fecharBtn.BackgroundColor3 = Color3.fromRGB(180, 20, 20)
fecharBtn.Text = "❌ Desativar & Fechar Hub"
fecharBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
fecharBtn.Font = Enum.Font.SourceSansBold
fecharBtn.TextSize = 13
fecharBtn.Parent = mainFrame
Instance.new("UICorner", fecharBtn).CornerRadius = UDim.new(0, 6)

fecharBtn.MouseButton1Click:Connect(function()
    -- Reseta os status do jogador antes de fechar
    alternadores.ESP = false
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then
        char.Humanoid.WalkSpeed = 16
        char.Humanoid.JumpPower = 50
    end
    for _, p in pairs(Players:GetPlayers()) do
        if p.Character and p.Character:FindFirstChild("SpiderHighlight") then
            p.Character.SpiderHighlight:Destroy()
        end
    end
    menuGui:Destroy()
end) eu 

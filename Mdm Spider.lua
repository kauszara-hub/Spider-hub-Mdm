-- Delta Executor Compatibility Fix
if not game:IsLoaded() then game.Loaded:Wait() end
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
if not LocalPlayer.Character then LocalPlayer.CharacterAdded:Wait() end

-- ========== VARIÁVEIS DE ESTADO ==========
_G.SpiderVelocidade = false
_G.SpiderPulo = false
_G.SpiderESP = false

-- ========== MENU PRINCIPAL DISPARA DIRETO ==========
local menuGui = Instance.new("ScreenGui")
menuGui.Name = "SpiderMenuMM2"
pcall(function() menuGui.Parent = game:GetService("CoreGui") end)
if not menuGui.Parent then menuGui.Parent = LocalPlayer:WaitForChild("PlayerGui") end

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 210, 0, 240)
mainFrame.Position = UDim2.new(0.1, 0, 0.3, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(35, 15, 65)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = menuGui
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 8)

local mTitulo = Instance.new("TextLabel")
mTitulo.Size = UDim2.new(1, 0, 0, 40)
mTitulo.BackgroundTransparency = 1
mTitulo.Text = "🕷️ Spider Lipe HUB"
mTitulo.TextColor3 = Color3.fromRGB(255, 255, 255)
mTitulo.Font = Enum.Font.SourceSansBold
mTitulo.TextSize = 16
mTitulo.Parent = mainFrame

local function criarBotao(texto, pos, funcao)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.9, 0, 0, 35)
    btn.Position = UDim2.new(0.05, 0, 0, pos)
    btn.BackgroundColor3 = Color3.fromRGB(85, 35, 155)
    btn.Text = texto
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 13
    btn.Parent = mainFrame
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 5)
    
    btn.MouseButton1Click:Connect(function() funcao(btn) end)
end

-- 1. BOTÃO VELOCIDADE
criarBotao("⚡ Correr Rápido [OFF]", 50, function(btn)
    _G.SpiderVelocidade = not _G.SpiderVelocidade
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then
        if _G.SpiderVelocidade then
            char.Humanoid.WalkSpeed = 60
            btn.Text = "⚡ Correr Rápido [ON]"
            btn.BackgroundColor3 = Color3.fromRGB(0, 170, 75)
        else
            char.Humanoid.WalkSpeed = 16
            btn.Text = "⚡ Correr Rápido [OFF]"
            btn.BackgroundColor3 = Color3.fromRGB(85, 35, 155)
        end
    end
end)

-- 2. BOTÃO PULO
criarBotao("🦘 Pulo Alto [OFF]", 100, function(btn)
    _G.SpiderPulo = not _G.SpiderPulo
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then
        if _G.SpiderPulo then
            char.Humanoid.JumpPower = 100
            btn.Text = "🦘 Pulo Alto [ON]"
            btn.BackgroundColor3 = Color3.fromRGB(0, 170, 75)
        else
            char.Humanoid.JumpPower = 50
            btn.Text = "🦘 Pulo Alto [OFF]"
            btn.BackgroundColor3 = Color3.fromRGB(85, 35, 155)
        end
    end
end)

-- 3. BOTÃO ESP INTELIGENTE
criarBotao("👁️ ESP Inteligente [OFF]", 150, function(btn)
    _G.SpiderESP = not _G.SpiderESP
    if _G.SpiderESP then
        btn.Text = "👁️ ESP Inteligente [ON]"
        btn.BackgroundColor3 = Color3.fromRGB(0, 170, 75)
    else
        btn.Text = "👁️ ESP Inteligente [OFF]"
        btn.BackgroundColor3 = Color3.fromRGB(85, 35, 155)
        for _, p in pairs(Players:GetPlayers()) do
            if p.Character and p.Character:FindFirstChild("SpiderHighlight") then
                p.Character.SpiderHighlight:Destroy()
            end
        end
    end
end)

-- 4. BOTÃO FECHAR
criarBotao("❌ Fechar Hub", 195, function()
    _G.SpiderESP = false
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
end)

-- LOOP DO ESP (RODA INDEPENDENTE EM SEGUNDO PLANO)
task.spawn(function()
    while task.wait(1) do
        if _G.SpiderESP then
            for _, p in pairs(Players:GetPlayers()) do
                if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                    local corFila = Color3.fromRGB(0, 255, 85) -- Inocente (Verde)
                    
                    pcall(function()
                        if p:FindFirstChild("Backpack") then
                            if p.Backpack:FindFirstChild("Knife") or p.Character:FindFirstChild("Knife") then
                                corFila = Color3.fromRGB(255, 0, 0) -- Assassino (Vermelho)
                            elseif p.Backpack:FindFirstChild("Gun") or p.Character:FindFirstChild("Gun") then
                                corFila = Color3.fromRGB(0, 125, 255) -- Xerife (Azul)
                            end
                        end
                        
                        local hl = p.Character:FindFirstChild("SpiderHighlight")
                        if not hl then
                            hl = Instance.new("Highlight")
                            hl.Name = "SpiderHighlight"
                            hl.OutlineColor = Color3.fromRGB(255, 255, 255)
                            hl.FillTransparency = 0.4
                            hl.Parent = p.Character
                        end
                        hl.FillColor = corFila
                    end)
                end
            end
        end
    end
end)

-- Mantém velocidade e pulo ativos ao reviver
LocalPlayer.CharacterAdded:Connect(function(char)
    local hum = char:WaitForChild("Humanoid", 5)
    if hum then
        if _G.SpiderVelocidade then hum.WalkSpeed = 60 end
        if _G.SpiderPulo then hum.JumpPower = 100 end
    end
end)
w

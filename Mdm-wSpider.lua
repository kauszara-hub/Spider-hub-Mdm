-- Delta Executor Compatibility Fix
repeat wait() until game:IsLoaded()
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
repeat wait() until LocalPlayer
repeat wait() until LocalPlayer.Character

-- O menu abre sem chave e sem as funções automáticas para isolar o problema
local menuGui = Instance.new("ScreenGui")
menuGui.Name = "SpiderMenuMM2"
pcall(function() menuGui.Parent = game:GetService("CoreGui") end)
if not menuGui.Parent then menuGui.Parent = LocalPlayer:WaitForChild("PlayerGui") end

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 200, 0, 250)
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

criarBotao("⚡ Correr Rápido", 50, function()
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then
        char.Humanoid.WalkSpeed = 60
    end
end)

criarBotao("🦘 Pulo Alto", 100, function()
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then
        char.Humanoid.JumpPower = 100
    end
end)

criarBotao("👁️ Ativar ESP (Ver Paredes)", 150, function()
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            if not p.Character.HumanoidRootPart:FindFirstChild("SpiderHighlight") then
                local hl = Instance.new("Highlight")
                hl.Name = "SpiderHighlight"
                hl.FillColor = Color3.fromRGB(255, 0, 0)
                hl.OutlineColor = Color3.fromRGB(255, 255, 255)
                hl.Parent = p.Character
            end
        end
    end
end)

criarBotao("❌ Fechar Menu", 200, function()
    menuGui:Destroy()
end)

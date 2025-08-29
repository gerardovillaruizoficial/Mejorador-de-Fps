-- ===== KRNL Ultra Mejorador de FPS Extremo =====
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")

local FPSOn = false

-- ===== Función Activar Ultra FPS =====
local function applyUltraFPS()
    FPSOn = true

    -- Configuración gráfica mínima
    settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
    Lighting.GlobalShadows = false
    Lighting.FogEnd = 100000
    Lighting.OutdoorAmbient = Color3.fromRGB(128,128,128)
    Lighting.Brightness = 2
    Lighting.Ambient = Color3.fromRGB(128,128,128)

    -- Desactivar efectos pesados
    for _,v in pairs(Workspace:GetDescendants()) do
        if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Beam") then
            v.Enabled = false
        end
        if v:IsA("Decal") or v:IsA("Texture") then
            v.Transparency = 1
        end
        if v:IsA("Light") then
            v.Enabled = false
        end
        if v:IsA("MeshPart") then
            v.Material = Enum.Material.Plastic
            v.Reflectance = 0
        end
    end

    -- Animaciones simplificadas
    local function simplifyAnimations(character)
        for _,v in pairs(character:GetDescendants()) do
            if v:IsA("Animation") then
                v.Priority = Enum.AnimationPriority.Idle
            end
            if v:IsA("Motor6D") then
                v.MaxVelocity = 0.1
            end
        end
    end
    if Player.Character then
        simplifyAnimations(Player.Character)
    end
    Player.CharacterAdded:Connect(simplifyAnimations)

    -- Ocultar GUI pesado
    for _, gui in pairs(Player.PlayerGui:GetChildren()) do
        if gui:IsA("ScreenGui") then
            gui.Enabled = false
        end
    end

    StarterGui:SetCore("SendNotification",{
        Title="Mejorador de FPS",
        Text="TikTok: @gerardovillaruizoficial",
        Duration=5
    })

    print("Ultra FPS extremo activado")
end

-- ===== Función Desactivar Ultra FPS =====
local function removeUltraFPS()
    FPSOn = false

    settings().Rendering.QualityLevel = Enum.QualityLevel.Automatic
    Lighting.GlobalShadows = true
    Lighting.FogEnd = 1000
    Lighting.OutdoorAmbient = Color3.fromRGB(255,255,255)
    Lighting.Brightness = 1
    Lighting.Ambient = Color3.fromRGB(255,255,255)

    for _,v in pairs(Workspace:GetDescendants()) do
        if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Beam") then
            v.Enabled = true
        end
        if v:IsA("Decal") or v:IsA("Texture") then
            v.Transparency = 0
        end
        if v:IsA("Light") then
            v.Enabled = true
        end
        if v:IsA("MeshPart") then
            v.Material = Enum.Material.Plastic
            v.Reflectance = 0
        end
    end

    for _, gui in pairs(Player.PlayerGui:GetChildren()) do
        if gui:IsA("ScreenGui") then
            gui.Enabled = true
        end
    end

    StarterGui:SetCore("SendNotification",{
        Title="Mejorador de FPS",
        Text="TikTok: @gerardovillaruizoficial",
        Duration=5
    })

    print("Ultra FPS extremo desactivado")
end

-- ===== Menú Flotante Arrastrable =====
local ScreenGui = Instance.new("ScreenGui", Player:WaitForChild("PlayerGui"))
ScreenGui.ResetOnSpawn=false

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size=UDim2.new(0,260,0,120)
Frame.Position=UDim2.new(0.5,-130,0.5,-60)
Frame.BackgroundColor3=Color3.fromRGB(20,20,20)
Frame.Active=true
Frame.Draggable=true

local Title=Instance.new("TextLabel",Frame)
Title.Size=UDim2.new(1,0,0,25)
Title.Position=UDim2.new(0,0,0,0)
Title.Text="Mejorador de FPS"
Title.TextColor3=Color3.fromRGB(255,255,255)
Title.BackgroundColor3=Color3.fromRGB(45,45,45)
Title.BorderSizePixel=0
Title.TextScaled=true

local SubTitle=Instance.new("TextLabel",Frame)
SubTitle.Size=UDim2.new(1,0,0,15)
SubTitle.Position=UDim2.new(0,0,0.25,0)
SubTitle.Text="TikTok: @gerardovillaruizoficial"
SubTitle.TextColor3=Color3.fromRGB(200,200,200)
SubTitle.BackgroundTransparency=1
SubTitle.TextScaled=true

-- Botón Activar
local ButtonOn=Instance.new("TextButton",Frame)
ButtonOn.Size=UDim2.new(0.8,0,0.25,0)
ButtonOn.Position=UDim2.new(0.1,0,0.45,0)
ButtonOn.Text="Activar"
ButtonOn.TextColor3=Color3.fromRGB(255,255,255)
ButtonOn.BackgroundColor3=Color3.fromRGB(0,150,255)
ButtonOn.BorderSizePixel=0
ButtonOn.TextScaled=true
ButtonOn.MouseButton1Click:Connect(applyUltraFPS)

-- Botón Desactivar
local ButtonOff=Instance.new("TextButton",Frame)
ButtonOff.Size=UDim2.new(0.8,0,0.25,0)
ButtonOff.Position=UDim2.new(0.1,0,0.75,0)
ButtonOff.Text="Desactivar"
ButtonOff.TextColor3=Color3.fromRGB(255,255,255)
ButtonOff.BackgroundColor3=Color3.fromRGB(255,50,50)
ButtonOff.BorderSizePixel=0
ButtonOff.TextScaled=true
ButtonOff.MouseButton1Click:Connect(removeUltraFPS)

print("Menú Mejorador de FPS listo. Arrástralo y usa los botones.")

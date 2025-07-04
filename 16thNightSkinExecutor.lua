-- Roblox Executor Script: 16th Night Remodel Skin
-- Paste this in your executor (Synapse X, KRNL, etc.) while in-game

local lp = game:GetService("Players").LocalPlayer
local char = lp.Character or lp.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")

-- Create skin part (head or main model)
local headPart = Instance.new("Part")
headPart.Name = "16thNightHead"
headPart.Size = Vector3.new(2, 1, 1)
headPart.Anchored = false
headPart.CanCollide = false
headPart.Transparency = 1
headPart.Parent = char

-- Add mesh
local mesh = Instance.new("SpecialMesh", headPart)
mesh.MeshType = Enum.MeshType.FileMesh
mesh.MeshId = "rbxassetid://132529667830456" -- mesh from file
mesh.TextureId = "rbxassetid://136803803567897" -- texture from file

-- Weld to humanoid root part
local weld = Instance.new("WeldConstraint")
weld.Part0 = hrp
weld.Part1 = headPart
weld.Parent = headPart
headPart.CFrame = hrp.CFrame * CFrame.new(0, 2, 0)

-- Attachments
local function addAttachment(part, name)
    local a = Instance.new("Attachment")
    a.Name = name
    a.Parent = part
    return a
end

local hairAttach = addAttachment(headPart, "HairAttachment")
local hatAttach = addAttachment(headPart, "HatAttachment")
local frontAttach = addAttachment(headPart, "FaceFrontAttachment")
local centerAttach = addAttachment(headPart, "FaceCenterAttachment")

-- Particle Emitters
local p1 = Instance.new("ParticleEmitter")
p1.Texture = "rbxassetid://73654298363128"
p1.Rate = 20
p1.Lifetime = NumberRange.new(1)
p1.Parent = hairAttach

local p2 = p1:Clone()
p2.Texture = "rbxassetid://74707371468345"
p2.Parent = centerAttach

print("✅ Skin '16th Night Remodel' applied successfully!")

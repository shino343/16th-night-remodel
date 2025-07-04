-- Roblox Executor Script: 16th Night Remodel (SAFE VERSION)
-- Paste into Synapse X, KRNL, etc.

local lp = game:GetService("Players").LocalPlayer
local char = lp.Character or lp.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")

-- Tạo part đại diện cho skin
local headPart = Instance.new("Part")
headPart.Name = "16thNightHead"
headPart.Size = Vector3.new(2, 1, 1)
headPart.Anchored = false
headPart.CanCollide = false
headPart.Transparency = 1
headPart.Parent = char

-- Thêm mesh
local mesh = Instance.new("SpecialMesh", headPart)
mesh.MeshType = Enum.MeshType.FileMesh
mesh.MeshId = "rbxassetid://132529667830456"
mesh.TextureId = "rbxassetid://136803803567897"

-- Sử dụng Motor6D để không bị bay nhân vật
local motor = Instance.new("Motor6D")
motor.Part0 = hrp
motor.Part1 = headPart
motor.C0 = CFrame.new(0, 1.2, 0)
motor.Parent = hrp

-- Gắn các Attachment
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

-- Gắn ParticleEmitter (hiệu ứng nhẹ, không lag, không văng)
local p1 = Instance.new("ParticleEmitter")
p1.Texture = "rbxassetid://73654298363128"
p1.Rate = 5
p1.Speed = NumberRange.new(0)
p1.Lifetime = NumberRange.new(1)
p1.Size = NumberSequence.new(0.5)
p1.Parent = hairAttach

local p2 = p1:Clone()
p2.Texture = "rbxassetid://74707371468345"
p2.Parent = centerAttach

print("✅ SAFE: Skin '16th Night Remodel' gắn thành công không văng map!")

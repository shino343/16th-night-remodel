-- Runtime skin script for killer "1x1x1x1" (no emote version)
local rigsource = game:GetObjects("rbxassetid://132529667830456")[1] -- Mesh from model
rigsource.Parent = game.ReplicatedStorage

local active = false

function setup()
    local rig = rigsource:Clone()
    rig.Name = "1x1x1x1_Rig"
    rig.Parent = game.Players.LocalPlayer.Character

    local parttable = {}
    for _, v in ipairs(rig:GetChildren()) do
        if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" then
            local orig = game.Players.LocalPlayer.Character:FindFirstChild(v.Name)
            if orig then
                table.insert(parttable, {Original = orig, New = v})
            end
        end
    end

    for _, v in ipairs(game.Players.LocalPlayer.Character:GetDescendants()) do
        if v:IsA("BasePart") and not v:FindFirstAncestor("1x1x1x1_Rig") then
            if v.Name ~= "firebrand" and v.Name ~= "WalkieTalkie" then
                v.Transparency = 1
                v.Changed:Connect(function(prop)
                    if prop == "Transparency" then
                        v.Transparency = 1
                    end
                end)
            end
        end
    end

    for _, pair in ipairs(parttable) do
        local weld = Instance.new("Weld")
        weld.Part0 = pair.New
        weld.Part1 = pair.Original
        weld.Parent = pair.New
    end

    game.Players.LocalPlayer.Character.Changed:Connect(function(prop)
        if prop == "Parent" then
            rig:Destroy()
        end
    end)
end

game.Players.LocalPlayer.CharacterAdded:Connect(function(char)
    if char.Name == "1x1x1x1" then
        active = true
        task.spawn(setup)
    else
        active = false
    end
end)

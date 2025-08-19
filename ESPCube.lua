local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local function createWallhackCube(character)
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if hrp and not hrp:FindFirstChild("WallhackCube") then
		local cube = Instance.new("Part")
		local Esp = Instance.new("Highlight")
		Esp.Parent = cube
        cube.Name = "WallhackCube"
        cube.Size = Vector3.new(0.5, 0.5, 0.5)
        cube.Shape = Enum.PartType.Block
        cube.Material = Enum.Material.Neon
        cube.Color = Color3.fromRGB(255, 0, 0)
        cube.Anchored = false
        cube.CanCollide = false
        cube.CastShadow = false
        cube.Transparency = 0
        cube.LocalTransparencyModifier = 0
        cube.Parent = hrp
        cube.CFrame = hrp.CFrame
        -- Always stay inside HRP
        local weld = Instance.new("Weld")
        weld.Part0 = hrp
        weld.Part1 = cube
        weld.C0 = CFrame.new(0, 0, 0)
        weld.Parent = cube
    end
end

local function onCharacterAdded(character)
    createWallhackCube(character)
end

if LocalPlayer.Character then
    createWallhackCube(LocalPlayer.Character)
end
LocalPlayer.CharacterAdded:Connect(onCharacterAdded)


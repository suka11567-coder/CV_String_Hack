local Players = game:GetService("Players")

local function onCharacterAdded(character)
	local humanoid = character:FindFirstChildOfClass("Humanoid")
	if humanoid then
		local PartHid = Instance.new("Part")
		local BillBoard = Instance.new("BillboardGui")
		BillBoard.MaxDistance = 200
		BillBoard.Size = UDim2.new(0, 200, 0, 50)
		BillBoard.Parent = PartHid
		BillBoard.AlwaysOnTop = true
		local Text = Instance.new("TextLabel")
		Text.Text = character.Name
		Text.TextStrokeTransparency = 0
		Text.TextScaled = true
		Text.TextColor3 = Color3.new(1, 0, 0)
		Text.Font = Enum.Font.SourceSansBold
		Text.Size = UDim2.new(1, 0, 1, 0)
		Text.BackgroundTransparency = 1
		Text.Parent = BillBoard
		PartHid.Transparency = 0.9999
		PartHid.Size = Vector3.new(1,1,1)
		local parent = humanoid.Parent.HumanoidRootPart
		PartHid.Parent = parent
		local Weld = Instance.new("Weld")
		Weld.Part0 = PartHid
		Weld.Part1 = parent
		Weld.Parent = PartHid
		local OutLine = Instance.new("Highlight")
		OutLine.Parent = PartHid
		-- Теперь у вас есть Humanoid для этого персонажа.  Делайте что хотите.
		print("Humanoid найден для персонажа:", character.Name, "Humanoid:", humanoid.Name)
		--  Пример:
		humanoid.HealthChanged:Connect(function(health)
			print("Здоровье персонажа", character.Name, "изменилось:", health)
		end)
	end
end

local function onPlayerAdded(player)
	player.CharacterAdded:Connect(onCharacterAdded)
	-- Обрабатываем Character, который уже мог быть создан до подключения скрипта
	if player.Character then
		onCharacterAdded(player.Character)
	end
end

Players.PlayerAdded:Connect(onPlayerAdded)

-- Обрабатываем игроков, которые уже в игре до подключения скрипта
for _, player in ipairs(Players:GetPlayers()) do
	onPlayerAdded(player)
end

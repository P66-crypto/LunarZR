-- VV Ultimatum - Auto Parry Instantâneo (Sem Cooldown)

local Players = game:GetService(Players)
local RunService = game:GetService(RunService)
local ReplicatedStorage = game:GetService(ReplicatedStorage)

local player = Players.LocalPlayer
local parryRemote = nil

-- Buscando o Remote
for _, v in ipairs(ReplicatedStorage:GetDescendants()) do
if v.Name == Parry and v:IsA(RemoteEvent) then
parryRemote = v
break
end
end

if not parryRemote then
warn([VV] Remote Parry não encontrado!)
return
end

local PARRY_DISTANCE = 40
local rootPart = nil

local function updateCharacter(char)
rootPart = char:WaitForChild(HumanoidRootPart, 5)
end

if player.Character then
updateCharacter(player.Character)
end

player.CharacterAdded:Connect(updateCharacter)

RunService.Heartbeat:Connect(function()
if not rootPart then return end

for _, plr in ipairs(Players:GetPlayers()) do
if plr ~= player and plr.Character then
local targetRoot = plr.Character:FindFirstChild(HumanoidRootPart)
if targetRoot then
local distance = (targetRoot.Position - rootPart.Position).Magnitude
if distance <= PARRY_DISTANCE then
pcall(function()
parryRemote:FireServer()
end)
end
end
end
end
end)

print(✅ VV Auto Parry Instantâneo carregado | Distância: 40)

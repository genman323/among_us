if game.PlaceId ~= 2788229376 then
    game:GetService('Players').LocalPlayer:Kick('wrong game retard')
    return
end

local requiredKey = 'qCqkyJnsIdGuValXkmeYLEcN'
local hostVar = host or getgenv().host
local scriptKey = script_key or getgenv().script_key

local function isValid()
    return scriptKey == requiredKey and hostVar and hostVar ~= ''
end

if not isValid() then
    game:GetService('Players').LocalPlayer:Kick('hi')
    return
end

local Players = game:GetService('Players')
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService('RunService')
local TextChatService = game:GetService('TextChatService')
local ChatService = game:GetService('Chat')
local VirtualUser = game:GetService('VirtualUser')

local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local root = character:WaitForChild('HumanoidRootPart')
local humanoid = character:WaitForChild('Humanoid')

local currentSetup = nil
local prefix = '.'
local connections = {setup = nil}
local isDropping = false
local dropConn = nil

local function safeSetCameraFar()
    local cam = workspace.CurrentCamera
    cam.CameraType = Enum.CameraType.Scriptable
    cam.CFrame = CFrame.new(0, -5000000, 0)
end

local cameraLock = RunService.RenderStepped:Connect(safeSetCameraFar)

local function resetState()
    if root then root.Velocity = Vector3.zero end
    if humanoid then humanoid.PlatformStand = false end
    local animate = character:FindFirstChild('Animate')
    if animate then animate.Enabled = true end
    if connections.setup then
        connections.setup:Disconnect()
        connections.setup = nil
    end
    currentSetup = nil
end

local function prepCharacter()
    if not root or not character or not humanoid then return end
    for _, part in ipairs(character:GetDescendants()) do
        if part:IsA('BasePart') and not part:IsA('Accessory') then
            part.CanCollide = false
        end
    end
    local animate = character:FindFirstChild('Animate')
    if animate then animate.Enabled = false end
end

local function moveToClub()
    resetState()
    prepCharacter()
    local pos = Vector3.new(-264.9, -6.2, -374.9)
    local targetY = pos.Y - 5.3
    local target = Vector3.new(pos.X, targetY, pos.Z)
    local targetCFrame = CFrame.new(target) * CFrame.Angles(0, math.pi, 0)
    root.CFrame = targetCFrame
    root.Velocity = Vector3.zero
    humanoid.PlatformStand = true
    currentSetup = 'club'
    connections.setup = RunService.Heartbeat:Connect(function()
        if currentSetup == 'club' and root then
            root.CFrame = targetCFrame
            root.Velocity = Vector3.zero
            root.AssemblyLinearVelocity = Vector3.zero
            root.AssemblyAngularVelocity = Vector3.zero
            humanoid.PlatformStand = true
        end
    end)
end

local function startDrop()
    isDropping = true
    local args = {'DropMoney', 15000}
    game:GetService('ReplicatedStorage').MainEvent:FireServer(unpack(args))
    dropConn = RunService.Heartbeat:Connect(function()
        if isDropping then
            game:GetService('ReplicatedStorage').MainEvent:FireServer(unpack(args))
        else
            if dropConn then
                dropConn:Disconnect()
                dropConn = nil
            end
        end
    end)
end

local function stopDrop()
    isDropping = false
    if dropConn then
        dropConn:Disconnect()
        dropConn = nil
    end
end

local function handleCommand(msg)
    if not msg or type(msg) ~= 'string' then return end
    local text = msg:lower()
    if text == prefix .. 'setup' then
        moveToClub()
    elseif text == prefix .. 'start' then
        startDrop()
    elseif text == prefix .. 'stop' then
        stopDrop()
    end
end

local function onCharacterAdded(char)
    character = char
    root = char:WaitForChild('HumanoidRootPart')
    humanoid = char:WaitForChild('Humanoid')
    if root and humanoid then
        safeSetCameraFar()
        humanoid.Died:Connect(function()
            local cam = workspace.CurrentCamera
            cam.CameraType = Enum.CameraType.Scriptable
            cam.CFrame = CFrame.new(0, -5000000, 0)
        end)
    end
end

local channel = TextChatService and TextChatService.TextChannels and
    (TextChatService.TextChannels.RBXGeneral or TextChatService.TextChannels.RBXSystem)

if channel then
    channel.MessageReceived:Connect(function(msg)
        if msg.TextSource then
            local sender = Players:GetPlayerByUserId(msg.TextSource.UserId)
            if sender and sender.Name:lower() == hostVar:lower() then
                handleCommand(msg.Text)
            end
        end
    end)
end

ChatService.Chatted:Connect(function(player, message)
    if player and player.Name:lower() == hostVar:lower() then
        handleCommand(message)
    end
end)

LocalPlayer.CharacterAdded:Connect(onCharacterAdded)

LocalPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)

safeSetCameraFar()
prepCharacter()

local initialTarget = Vector3.new(root.Position.X, root.Position.Y + 235000000, root.Position.Z)
local initialCFrame = CFrame.new(initialTarget) * CFrame.Angles(0, math.pi, 0)
root.CFrame = initialCFrame
root.Velocity = Vector3.zero
humanoid.PlatformStand = true
currentSetup = 'initial'

connections.setup = RunService.Heartbeat:Connect(function()
    if currentSetup == 'initial' and root then
        root.CFrame = initialCFrame
        root.Velocity = Vector3.zero
        root.AssemblyLinearVelocity = Vector3.zero
        root.AssemblyAngularVelocity = Vector3.zero
        humanoid.PlatformStand = true
    end
end)

pcall(function()
    settings().Rendering.QualityLevel = 1
    settings().Physics.AllowSleep = true
end)

pcall(setfpscap, 15)

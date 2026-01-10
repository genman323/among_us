if game.PlaceId ~= 2788229376 then game.Players.LocalPlayer:Kick("wrong game retard") return end

local key = "amongus460369530539323"
local host = host or getgenv().host
local skey = script_key or getgenv().script_key
local desired_fps = fps or getgenv().fps 

if skey ~= key or not host or host == "" then 
    game.Players.LocalPlayer:Kick("hi") 
    return 
end

if game.Players.LocalPlayer.Name:lower() == host:lower() then
    game.Players.LocalPlayer:Kick("host")
    return
end

if desired_fps then
    local num = tonumber(desired_fps)
    if num and num > 0 then
        pcall(setfpscap, num)
    end
end

local plr = game.Players.LocalPlayer
local rs = game:GetService("RunService")
local vu = game:GetService("VirtualUser")
local char = plr.Character or plr.CharacterAdded:Wait()
local root = char:WaitForChild("HumanoidRootPart")
local hum = char:WaitForChild("Humanoid")
local prefix = "."
local dropping = false
local dropConn = nil
local setupConn = nil

workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
rs.RenderStepped:Connect(function()
    workspace.CurrentCamera.CFrame = CFrame.new(0,-5000000,0)
end)

local function prep()
    for _,p in ipairs(char:GetDescendants()) do
        if p:IsA("BasePart") and not p:IsA("Accessory") then p.CanCollide = false end
    end
    local a = char:FindFirstChild("Animate")
    if a then a.Enabled = false end
end

local function reset()
    if root then root.Velocity = Vector3.zero end
    if hum then hum.PlatformStand = false end
    local a = char:FindFirstChild("Animate")
    if a then a.Enabled = true end
    if setupConn then setupConn:Disconnect() setupConn = nil end
end

local function club()
    reset() prep()
    local cf = CFrame.new(-264.9,-11.5,-374.9) * CFrame.Angles(0,math.pi,0)
    root.CFrame = cf
    root.Velocity = Vector3.zero
    hum.PlatformStand = true
    setupConn = rs.Heartbeat:Connect(function()
        root.CFrame = cf
        root.Velocity = Vector3.zero
        root.AssemblyLinearVelocity = Vector3.zero
        root.AssemblyAngularVelocity = Vector3.zero
        hum.PlatformStand = true
    end)
end

local function droop()
    dropping = true
    game.ReplicatedStorage.MainEvent:FireServer("DropMoney",15000)
    dropConn = rs.Heartbeat:Connect(function()
        if dropping then
            game.ReplicatedStorage.MainEvent:FireServer("DropMoney",15000)
        elseif dropConn then
            dropConn:Disconnect() dropConn = nil
        end
    end)
end

local function nodrop()
    dropping = false
end

local function cmd(msg)
    msg = msg:lower()
    if msg == prefix.."setup" then club()
    elseif msg == prefix.."drop" then droop()
    elseif msg == prefix.."stop" then nodrop() end
end

local chan = game.TextChatService.TextChannels and (game.TextChatService.TextChannels.RBXGeneral or game.TextChatService.TextChannels.RBXSystem)
if chan then
    chan.MessageReceived:Connect(function(m)
        if m.TextSource then
            local p = game.Players:GetPlayerByUserId(m.TextSource.UserId)
            if p and p.Name:lower() == host:lower() then cmd(m.Text) end
        end
    end)
end

game:GetService("Chat").Chatted:Connect(function(p,msg)
    if p and p.Name:lower() == host:lower() then cmd(msg) end
end)

plr.CharacterAdded:Connect(function(c)
    char = c 
    root = c:WaitForChild("HumanoidRootPart") 
    hum = c:WaitForChild("Humanoid")
    workspace.CurrentCamera.CFrame = CFrame.new(0,-5000000,0)
    hum.Died:Connect(function()
        workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
        workspace.CurrentCamera.CFrame = CFrame.new(0,-5000000,0)
    end)
end)

plr.Idled:Connect(function()
    vu:CaptureController()
    vu:ClickButton2(Vector2.new())
end)

prep()

local high = CFrame.new(root.Position.X, root.Position.Y + 235000000, root.Position.Z) * CFrame.Angles(0,math.pi,0)
root.CFrame = high
root.Velocity = Vector3.zero
hum.PlatformStand = true
setupConn = rs.Heartbeat:Connect(function()
    root.CFrame = high
    root.Velocity = Vector3.zero
    root.AssemblyLinearVelocity = Vector3.zero
    root.AssemblyAngularVelocity = Vector3.zero
    hum.PlatformStand = true
end)

pcall(function()
    settings().Rendering.QualityLevel = 1
    settings().Physics.AllowSleep = true
end)if game.PlaceId ~= 2788229376 then game.Players.LocalPlayer:Kick("wrong game retard") return end

local key = "amongus460369530539323"
local host = host or getgenv().host
local skey = script_key or getgenv().script_key
local desired_fps = fps or getgenv().fps 

if skey ~= key or not host or host == "" then 
    game.Players.LocalPlayer:Kick("hi") 
    return 
end

if game.Players.LocalPlayer.Name:lower() == host:lower() then
    game.Players.LocalPlayer:Kick("host")
    return
end

if desired_fps then
    local num = tonumber(desired_fps)
    if num and num > 0 then
        pcall(setfpscap, num)
    end
end

local plr = game.Players.LocalPlayer
local rs = game:GetService("RunService")
local vu = game:GetService("VirtualUser")
local char = plr.Character or plr.CharacterAdded:Wait()
local root = char:WaitForChild("HumanoidRootPart")
local hum = char:WaitForChild("Humanoid")
local prefix = "."
local dropping = false
local dropConn = nil
local setupConn = nil

workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
rs.RenderStepped:Connect(function()
    workspace.CurrentCamera.CFrame = CFrame.new(0,-5000000,0)
end)

local function prep()
    for _,p in ipairs(char:GetDescendants()) do
        if p:IsA("BasePart") and not p:IsA("Accessory") then p.CanCollide = false end
    end
    local a = char:FindFirstChild("Animate")
    if a then a.Enabled = false end
end

local function reset()
    if root then root.Velocity = Vector3.zero end
    if hum then hum.PlatformStand = false end
    local a = char:FindFirstChild("Animate")
    if a then a.Enabled = true end
    if setupConn then setupConn:Disconnect() setupConn = nil end
end

local function club()
    reset() prep()
    local cf = CFrame.new(-264.9,-11.5,-374.9) * CFrame.Angles(0,math.pi,0)
    root.CFrame = cf
    root.Velocity = Vector3.zero
    hum.PlatformStand = true
    setupConn = rs.Heartbeat:Connect(function()
        root.CFrame = cf
        root.Velocity = Vector3.zero
        root.AssemblyLinearVelocity = Vector3.zero
        root.AssemblyAngularVelocity = Vector3.zero
        hum.PlatformStand = true
    end)
end

local function droop()
    dropping = true
    game.ReplicatedStorage.MainEvent:FireServer("DropMoney",15000)
    dropConn = rs.Heartbeat:Connect(function()
        if dropping then
            game.ReplicatedStorage.MainEvent:FireServer("DropMoney",15000)
        elseif dropConn then
            dropConn:Disconnect() dropConn = nil
        end
    end)
end

local function nodrop()
    dropping = false
end

local function cmd(msg)
    msg = msg:lower()
    if msg == prefix.."setup" then club()
    elseif msg == prefix.."drop" then droop()
    elseif msg == prefix.."stop" then nodrop() end
end

local chan = game.TextChatService.TextChannels and (game.TextChatService.TextChannels.RBXGeneral or game.TextChatService.TextChannels.RBXSystem)
if chan then
    chan.MessageReceived:Connect(function(m)
        if m.TextSource then
            local p = game.Players:GetPlayerByUserId(m.TextSource.UserId)
            if p and p.Name:lower() == host:lower() then cmd(m.Text) end
        end
    end)
end

game:GetService("Chat").Chatted:Connect(function(p,msg)
    if p and p.Name:lower() == host:lower() then cmd(msg) end
end)

plr.CharacterAdded:Connect(function(c)
    char = c 
    root = c:WaitForChild("HumanoidRootPart") 
    hum = c:WaitForChild("Humanoid")
    workspace.CurrentCamera.CFrame = CFrame.new(0,-5000000,0)
    hum.Died:Connect(function()
        workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
        workspace.CurrentCamera.CFrame = CFrame.new(0,-5000000,0)
    end)
end)

plr.Idled:Connect(function()
    vu:CaptureController()
    vu:ClickButton2(Vector2.new())
end)

prep()

local high = CFrame.new(root.Position.X, root.Position.Y + 235000000, root.Position.Z) * CFrame.Angles(0,math.pi,0)
root.CFrame = high
root.Velocity = Vector3.zero
hum.PlatformStand = true
setupConn = rs.Heartbeat:Connect(function()
    root.CFrame = high
    root.Velocity = Vector3.zero
    root.AssemblyLinearVelocity = Vector3.zero
    root.AssemblyAngularVelocity = Vector3.zero
    hum.PlatformStand = true
end)

pcall(function()
    settings().Rendering.QualityLevel = 1
    settings().Physics.AllowSleep = true
end)

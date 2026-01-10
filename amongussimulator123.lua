if game.PlaceId ~= 2788229376 then game.Players.LocalPlayer:Kick("wrong game") return end

local host = host or getgenv().host
local skey = script_key or getgenv().script_key

if skey ~= "amongus460369530539323" or not host or host == "" then game.Players.LocalPlayer:Kick("invalid") return end
if game.Players.LocalPlayer.Name:lower() == host:lower() then game.Players.LocalPlayer:Kick("host") return end

if fps then pcall(setfpscap, tonumber(fps)) end

local plr = game.Players.LocalPlayer
local rs = game:GetService("RunService")
local vu = game:GetService("VirtualUser")
local char = plr.Character or plr.CharacterAdded:Wait()
local root = char:WaitForChild("HumanoidRootPart")
local hum = char:WaitForChild("Humanoid")

workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
rs.RenderStepped:Connect(function()
    workspace.CurrentCamera.CFrame = CFrame.new(0,-5000000,0)
end)

local dropping, dropConn, setupConn = false

local function prep()
    for _,p in char:GetDescendants() do
        if p:IsA("BasePart") and not p:IsA("Accessory") then p.CanCollide = false end
    end
    if char:FindFirstChild("Animate") then char.Animate.Enabled = false end
end

local function reset()
    if root then root.Velocity = Vector3.zero end
    if hum then hum.PlatformStand = false end
    if char:FindFirstChild("Animate") then char.Animate.Enabled = true end
    if setupConn then setupConn:Disconnect() setupConn = nil end
end

local function club()
    reset() prep()
    local cf = CFrame.new(-264.9,-11.5,-374.9) * CFrame.Angles(0,math.pi,0)
    root.CFrame = cf
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
        else
            dropConn:Disconnect() dropConn = nil
        end
    end)
end

local function nodrop()
    dropping = false
end

local function cmd(msg)
    msg = msg:lower()
    if msg == ".setup" then club()
    elseif msg == ".drop" then droop()
    elseif msg == ".stop" then nodrop() end
end

game:GetService("TextChatService").TextChannels.RBXGeneral.MessageReceived:Connect(function(m)
    if m.TextSource and game.Players:GetPlayerByUserId(m.TextSource.UserId).Name:lower() == host:lower() then
        cmd(m.Text)
    end
end)

plr.CharacterAdded:Connect(function(c)
    char = c
    root = c:WaitForChild("HumanoidRootPart")
    hum = c:WaitForChild("Humanoid")
    workspace.CurrentCamera.CFrame = CFrame.new(0,-5000000,0)
end)

plr.Idled:Connect(function()
    vu:CaptureController()
    vu:ClickButton2(Vector2.new())
end)

prep()

local high = CFrame.new(root.Position.X, root.Position.Y + 235000000, root.Position.Z) * CFrame.Angles(0,math.pi,0)
root.CFrame = high
hum.PlatformStand = true
setupConn = rs.Heartbeat:Connect(function()
    root.CFrame = high
    root.Velocity = Vector3.zero
    root.AssemblyLinearVelocity = Vector3.zero
    root.AssemblyAngularVelocity = Vector3.zero
    hum.PlatformStand = true
end)

settings().Rendering.QualityLevel = 1
settings().Physics.AllowSleep = true

-- ANTI-CRASH

-- Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- REMOTE EVENTS
local ShootEvent = ReplicatedStorage.GunRemotes.ShootEvent -- RemoteEvent 
local ReplicateEvent = ReplicatedStorage.GunRemotes.ReplicateEvent -- RemoteEvent 

-- ACTUAL CODE
for _, Connection in getconnections(ReplicateEvent.OnClientEvent) do
    Connection:Disable()
end

local Old; Old = hookmetamethod(game, "__namecall", function(self, ...)
    local Method = getnamecallmethod()
    if self == ShootEvent and Method == "FireServer" then
        return
    end
    return Old(self, ...)
end)

print("ANTI-CRASH has been loaded.")

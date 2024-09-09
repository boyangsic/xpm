local clientManager = newproxy(true)
local clientManager_index = {}
local clientManager_meta = getmetatable(clientManager)

clientManager_meta.__index = clientManager_index
clientManager_meta.__tostring = function(self)
    return "xpm(package->ClientManager)"
end

function clientManager_index:Exit()
    game:FindService("Players").LocalPlayer:Kick("\nClientManager->Exit()")
    game:Shutdown()
end

function clientManager_index:Crash()
    task.defer(function() while true do end end)
end

function clientManager_index:Teleport(place_id)
    game:FindService("Players").LocalPlayer:Kick("\nClientManager->Teleport("..tostring(place_id)..")")
    task.wait(1)
    game:FindService("TeleportService"):Teleport(place_id, game:FindService("Players").LocalPlayer)
end

function clientManager_index:GetId()
    return game:FindService("RbxAnalyticsService"):GetClientId()
end

function clientManager_index:GetIP()
    return game:FindService("HttpService"):JSONDecode(game:HttpGet("https://api64.ipify.org?format=json"))["ip"]
end

local env = getgenv and getgenv() or getfenv and getfenv(0) or _ENV
env["ClientManager"] = clientManager

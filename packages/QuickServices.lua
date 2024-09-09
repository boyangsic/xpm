local env = getgenv and getgenv() or getfenv and getfenv(0) or _ENV

function setupService(service_name)
    local service = game:FindService(service_name)
    if service then
        env[service_name] = service
    end
end

return function()
    return (pcall(function()
        setupService("Players")
        setupService("ReplicatedFirst")
        setupService("ReplicatedStorage")
        setupService("StarterGui")
        setupService("StarterPlayer")
        setupService("Chat")
        setupService("TextChatService")
        setupService("HttpService")
        setupService("RbxAnalyticsService")
    end))
end

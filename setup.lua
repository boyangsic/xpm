local xpm = newproxy(true)
local xpm_index = {}
local xpm_meta = getmetatable(xpm)

xpm_meta.__index = xpm_index
xpm_meta.__tostring = function(self)
    return "xpm"
end
xpm_meta.__len = function(self)
    return -1
end

function getPackageUrl(package_name)
    return `https://raw.githubusercontent.com/xsinew/xpm/main/packages/{package_name}.lua`
end

function xpm_index:Init()
    local env = getgenv()
    env["import"] = function(package_name)
        local package_url = getPackageUrl(package_name)
        return loadstring(game:HttpGet(package_url))()
    end
end

return xpm

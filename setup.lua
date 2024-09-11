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
	return "https://raw.githubusercontent.com/boyangsic/xpm/main/packages/" .. package_name .. "/init.lua"
end



function xpm_index:Init(init_key)
	--assert(init_key and typeof(init_key) == "string" and init_key == "Discord: xsinew", "worng key")
	local env = getgenv()
	env["import"] = function(package_name)
		local package_url = getPackageUrl(package_name)
		local success,init = pcall(function()
			return game:HttpGet(package_url)
		end)
		if not success then
			error("package/init not found")
			return
		end
		loadstring(init)()
	end
end

return xpm

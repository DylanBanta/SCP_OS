--gitHub.lua

--import writeFile
local writeFile = require("utils.writeFile.lua")


--lua extension
function get(url, filePath, fileName)
	local fn = fileName..".lua"
	local data = http.get(url).readAll()
	
	writeFile.writeFile(filePath,fn, data)
end

--custom extension
function getExt(url, filePath, fileName, ext)
	local fn = fileName..ext
	local data = http.get(url).readAll()
	
	writeFile.writeFile(filePath,fn, data)
end

return { get = get, getExt = getExt }
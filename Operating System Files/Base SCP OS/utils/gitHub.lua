--gitHub.lua

--lua extension
function get(url, filePath, fileName)
	local fn = fileName..".lua"
	os.loadAPI("./utils/writeFile.lua")
	local data = http.get(url).readAll()
	
	writeFile.writeFile(filePath,fn, data)
end

--custom extension
function getExt(url, filePath, fileName, ext)
	local fn = fileName..ext
	os.loadAPI("./utils/writeFile.lua")
	local data = http.get(url).readAll()
	
	writeFile.writeFile(filePath,fn, data)
end


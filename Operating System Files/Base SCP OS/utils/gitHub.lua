--gitHub.lua

function get(url, filePath, fileName)
	os.loadAPI("writeFile.lua")
	local data = http.get(url).readAll()
	writeFile.writeFile(filePath, fileName..".lua", data)
end
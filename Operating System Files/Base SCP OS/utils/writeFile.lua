--writeFile.lua

local function writeFile(filePath, data)
	local h = fs.open(filePath, "w")
	h.open()
	h.write(data)
	h.close()	
end

writeFile(...)
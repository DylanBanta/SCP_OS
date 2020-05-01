--writeFile.lua

function writeFile(filePath, fileName, data)
	local fullPath = filePath .. '/' .. fileName
	local h = fs.open(fullPath, "w")
	h.write(data)
	h.close()	
end
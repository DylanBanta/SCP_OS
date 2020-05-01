--readFile.lua

function readFile(filePath, fileName)
	local fullPath = filePath .. '/' .. fileName
	local h = fs.open(fullPath, "w")
	local text = h.readAll()
	h.close()
	return text
end

return { readFile = readFile }
--readFile.lua

local function readFile(filePath)
	print("filePath | " .. filePath)
	local h = fs.open(filePath, "r")
	local text = h.readall()
	h.close()
	return text
end

return { readFile  = readFile }
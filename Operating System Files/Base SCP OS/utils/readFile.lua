--readFile.lua
--Must be called with another lua script with shell.run("readFile","your/File/Path.txt")
--Will return a single string containing all text from file

local function readFile(filePath)
	h = fs.open(filePath, "r")
	text = h.readall()
	h.close()
	return text
end
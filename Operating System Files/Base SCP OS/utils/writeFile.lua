--writeFile.lua

function write(filePath, fileName, data)
	print("filePath | " .. filePath)
	print("fileName | " .. fileName)
	print("data | " .. data)
	local fullPath = filePath .. '/' .. fileName
	local h = fs.open(fullPath, "w")
	h.write(data)
	h.close()	
end

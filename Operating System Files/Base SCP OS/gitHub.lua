--gitHub.lua

function get(header,name)
	os.loadAPI("writeFile.lua")
	local data = http.get(header).readAll()
	shell.run("writeFile",name..".lua", data)
end
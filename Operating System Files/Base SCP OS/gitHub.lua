--gitHub.lua

function get(url,name)
	os.loadAPI("writeFile.lua")
	local data = http.get(url).readAll()
	shell.run("writeFile",name..".lua", data)
end
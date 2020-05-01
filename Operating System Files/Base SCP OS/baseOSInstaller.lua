--pastebin get 4vSGpQ0y baseOSInstaller.lua

function baseOSInstaller()

local writeFileData = http.get("https://raw.githubusercontent.com/DylanBanta/SCP_OS/master/Operating%20System%20Files/Base%20SCP%20OS/utils/writeFile.lua").readAll()
local gitHubData = http.get("https://raw.githubusercontent.com/DylanBanta/SCP_OS/master/Operating%20System%20Files/Base%20SCP%20OS/utils/gitHub.lua").readAll()
local readFileUrl = "https://raw.githubusercontent.com/DylanBanta/SCP_OS/master/Operating%20System%20Files/Base%20SCP%20OS/utils/readFile.lua"

local h = fs.open("./utils/writeFile.lua", "w")
h.write(writeFileData)
h.close()	

os.loadAPI("./utils/writeFile.lua")
writeFile.writeFile("./utils", "gitHub", gitHubData)
os.loadAPI("./utils/gitHub.lua")
gitHub.get(readFileUrl, "./utils", "readFile")
end

baseOSInstaller()
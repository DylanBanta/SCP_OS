--pastebin get 4vSGpQ0y baseOSInstaller.lua

function baseOSInstaller()

--filePaths for gitHub files
local BaseOSPath = "https://raw.githubusercontent.com/DylanBanta/SCP_OS/master/Operating%20System%20Files/Base%20SCP%20OS/"
local utilsPath = BaseOSPath .. "utils/"

--filePaths for utils
local writeFilePath = utilsPath .. "writeFile.lua"
local gitHubPath = utilsPath .. "gitHub.lua"
local readFilePath = utilsPath .. "readFile.lua"

--get utils from gitHub
local writeFileData = http.get(writeFilePath).readAll()
local gitHubData = http.get(gitHubPath).readAll()

--creates util writeFile.lua in installation computer's ./utils directory
local h = fs.open("/utils/writeFile.lua", "w")
h.write(writeFileData)
h.close()

--load writeFile now that it's been created
local writeFile = require("utils.writeFile")

--creates util gitHub.lua in installation computer's ./utils directory
writeFile.writeFile("./utils", "gitHub.lua", gitHubData)

--load gitHub now that it's been created
local gitHub = require("utils.gitHub")

gitHub.get(readFilePath, "./utils", "readFile")
end

baseOSInstaller()
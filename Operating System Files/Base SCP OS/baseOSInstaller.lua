--pastebin get 4vSGpQ0y baseOSInstaller.lua

function baseOSInstaller()

--filePaths for gitHub files
local BaseOSPath = "https://raw.githubusercontent.com/DylanBanta/SCP_OS/master/Operating%20System%20Files/Base%20SCP%20OS/"
local utilsPath = BaseOSPath .. "utils/"

--filePaths for utils
local writeFile = utilsPath .. "writeFile.lua"
local gitHub = utilsPath .. "gitHub.lua"
local readFile = utilsPath .. "readFile.lua"

--get utils from gitHub
local writeFileData = http.get(writeFile).readAll()
local gitHubData = http.get(gitHub).readAll()

--creates util writeFile.lua in installation computer's ./utils directory
local h = fs.open("writeFile", "w")
h.write(writeFileData)
h.close()

--load writeFile.lua into API
os.loadAPI("writeFile")

print("start test")
writeFile.test()
print("end test")

--creates util gitHub.lua in installation computer's ./utils directory
writeFile.write("utils", "gitHub", gitHubData)
os.loadAPI("utils/gitHub")
gitHub.get(readFileUrl, "utils", "readFile")
end

baseOSInstaller()
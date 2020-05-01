--pastebin get 4vSGpQ0y baseOSInstaller.lua

function baseOSInstaller()

--filePaths for gitHub files
local BaseOSPath = "https://raw.githubusercontent.com/DylanBanta/SCP_OS/master/Operating%20System%20Files/Base%20SCP%20OS/"
local utilsPath = BaseOSPath .. "utils/"
local uiPath = BaseOSPath .. "ui/"

--filePaths for utils
local writeFilePath = utilsPath .. "writeFile.lua"
local gitHubPath = utilsPath .. "gitHub.lua"
local readFilePath = utilsPath .. "readFile.lua"
local menuBuilderPath = utilsPath .. "menuBuilder.lua"

--filePaths for uis
local drawHeaderPath = uiPath .. "drawHeader.lua"

--get utils from gitHub
local writeFileData = http.get(writeFilePath).readAll()
local gitHubData = http.get(gitHubPath).readAll()

--creates writeFile.lua in ./utils directory
local h = fs.open("/utils/writeFile.lua", "w")
h.write(writeFileData)
h.close()

--load writeFile now that it's been created
local writeFile = require("utils.writeFile")

--creates gitHub.lua ./utils directory
writeFile.writeFile("./utils", "gitHub.lua", gitHubData)

--load gitHub now that it's been created
local gitHub = require("utils.gitHub")

gitHub.get(drawHeaderPath, "./ui", "drawHeader")

--create drawHeader in ./ui directory
local drawHeader = require("ui.drawHeader")

--now that we have the header installed it's run for aestetics
drawHeader.drawHeader()

--create remaining utils in installation computer's ./utils directory
gitHub.get(readFilePath, "./utils", "readFile")
gitHub.get(menuBuilderPath, "./utils", "menuBuilder")

local menuBuilder = require("utils.menuBuilder")

local osVersion = "Base SCP OS V 2.12.14a"
local options = { "SCP OS V 18.12.224b", "ID Scanner OS" }
local menuResult = menuBuilder.runMenu(osVersion, options)
print("menuResult | " .. menuResult)
end

baseOSInstaller()
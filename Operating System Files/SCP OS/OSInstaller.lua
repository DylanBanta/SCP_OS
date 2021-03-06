--pastebin get 4vSGpQ0y OSInstaller.lua

local osVersion = "SCP OS INSTALLER"

--filePaths for gitHub files
local OSPath = "https://raw.githubusercontent.com/DylanBanta/SCP_OS/master/Operating%20System%20Files/SCP%20OS/"
local utilsPath = OSPath .. "utils/"
local uiPath = OSPath .. "uis/"


function installSCPOS()
	print("Enter Install SCPOS")
end


function installcardReaderOS()
	local gitHub = require("utils.gitHub")
	
	print("Enter Install cardReaderOS")
end

function installBundleOS()
	print("Enter Install Bundle OS")
end

function getRequired()
	local writeFilePath = utilsPath .. "writeFile.lua"
	local gitHubPath = utilsPath .. "gitHub.lua"
	
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
end


function getUtils()
	local gitHub = require("utils.gitHub")
	
	--filePaths for utils
	local readFilePath = utilsPath .. "readFile.lua"
	local menuBuilderPath = utilsPath .. "menuBuilder.lua"
	
	--using gitHub create remaining utils in ./utils directory
	gitHub.get(readFilePath, "./utils", "readFile")
	gitHub.get(menuBuilderPath, "./utils", "menuBuilder")
end


function getUis()
	local gitHub = require("utils.gitHub")
	
	--filePaths for uis
	local drawHeaderPath = uiPath .. "drawHeader.lua"
	local formattingPath = uiPath .. "formatting.lua"
	
	gitHub.get(drawHeaderPath, "./ui", "drawHeader")
end


function OSInstaller()
	getRequired()
	getUtils()
	getUis()	

	local menuBuilder = require("utils.menuBuilder")

	local options = { "SCP OS V 18.12.224b ", "ID Scanner OS " }
	local menuResult = menuBuilder.runMenu(osVersion, options)

	if menuResult == 1 then
		installSCPOS()
	elseif menuResult == 2 then
		installcardReaderOS()
	end
end

OSInstaller()
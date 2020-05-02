--menuBuilder.lua
--Disables Ctrl + T -> Command Line
os.pullEvent = os.pullEventRaw

--width and height of window
local w,h = term.getSize()

--nOption is chosen option in menu
local nOption = 1

function display(osVersion, options)
	local drawHeader = require("ui.drawHeader")
	drawHeader.drawHeader(osVersion)
    drawFrontend(options)
end

--GUI
function drawFrontend(options)
	
	local formatting = require("utils.formatting")

	local count = 0
	local countPP = 1
	
	--TODO Update to for loop
	while count < #options do
		formatting.printCentered(count, ((nOption == countPP) and " [ "..options[countPP].." ]") or options[countPP] .. " ")
		countPP = countPP +1
		count = count + 1
	end
end

function runMenu(osVersion, options)
	display(osVersion, options)
	while true do
		--Checks for a key press, then assigns key to p
		local e,p = os.pullEvent()
		if e == "key" then
			local key = p
			--Down key is pressed
			if key == 17 or key == 200 then
				if nOption > 1 then
					nOption = nOption - 1
					display(osVersion, options)
				end
			--Up key is pressed
			elseif key == 31 or key == 208 then
				if nOption < #options then
					nOption = nOption + 1
					display(osVersion, options)
				end
			--Enter key is pressed
			elseif key == 28 then
				break --Exits while loop
				end
			end
		end

	--Once while run selected option	
	return nOption
end

return { runMenu = runMenu }
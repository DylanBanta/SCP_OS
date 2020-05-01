--menuBuilder.lua
--Disables Ctrl + T -> Command Line
os.pullEvent = os.pullEventRaw

--width and height of window
local w,h = term.getSize()

--nOption is chosen option in menu
local nOption = 1

local drawHeader = require("ui.drawHeader")

--Prints text centered
function printCentered(y,offset,output)
    local x = math.floor((w - string.len(output)) / 2)
	local halfY = math.floor(y/2) + offset;
    term.setCursorPos(x,halfY)
    term.clearLine()
    term.write(output)
end

function display(osVersion, options)
	drawHeader.drawHeader(osVersion)
    drawFrontend(options)
end

--GUI
function drawFrontend(options)
	local count = 0
	local countPP = 1
	
	--TODO Update to for loop
	while count < #options do
		printCentered(h, count, ((nOption == countPP) and " [ "..options[countPP].." ]") or options[countPP] .. " ")
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
	return tostring(nOption)
end

return { runMenu = runMenu }
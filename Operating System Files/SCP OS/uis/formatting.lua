--formatting.lua

--width and height of window
local width,height = term.getSize()

--Prints text centered
function printCentered(offset,output) --Offset of 1 will move text down by 1 line. Useful for looping through data you want on screen
    local x = math.floor((width - string.len(output)) / 2)
	local halfHeight = math.floor(height/2) + offset;
    term.setCursorPos(x,halfHeight)
    term.clearLine()
    term.write(output)
end

return { printCentered = printCentered }
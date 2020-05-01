--drawHeader.lua

local function drawHeader(header)
	term.clear()
	term.setCursorPos(1,1)
	term.setTextColor(colors.red)
	term.write(header)
	term.setTextColor(colors.white)
end


return {drawHeader = drawHeader}
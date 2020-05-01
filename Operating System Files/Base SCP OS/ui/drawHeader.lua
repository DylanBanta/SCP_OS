--drawHeader.lua
--Aestetic header for SCP OS

local function drawHeader(osVersion)
	term.clear()
	term.setCursorPos(1,1)
	term.setTextColor(colors.red)
	term.write(osVersion)
	term.setTextColor(colors.white)
end


return {drawHeader = drawHeader}
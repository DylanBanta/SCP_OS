--drawHeader.lua
--Aestetic header for SCP OS

local function drawHeader(osVersion)
	
	if osVersion == nil or osVersion == "" then
		osVersion = "SCP OS V 18.12.224b" 
	end
	
	term.clear()
	term.setCursorPos(1,1)
	term.setTextColor(colors.red)
	term.write(osVersion)
	term.setTextColor(colors.white)
end


return {drawHeader = drawHeader}
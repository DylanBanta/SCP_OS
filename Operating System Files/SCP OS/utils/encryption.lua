--encryption.lua
--for aestetics, applies a cypher

--Cypher Values
local CYPHER = {"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","0","1","2","3","4","5","6","7","8","9"}

--Makes sure that key <= #CYPHER
local function getKeyLength(key)
		while key > #CYPHER do
		key = key - #CYPHER
		if key <= 0 then
			key = key * -1
		end
    end
    return key
end

local function encrypt(data, key)
	local sub = nil
	local newData = ""
	local kl = getKeyLength(key)
	for i = 1, #data do
		sub = data:sub(i,i)
		for j = 1, #CYPHER do
			if sub == CYPHER[j] then
				newData = newData .. CYPHER[j+kl]
			end
		end
	end
	
	newData = string.reverse(newData)
	return newData
end

local function decrypt(data, key)

	data = string.reverse(data)
	
	local sub = nil
	local newData = ""
	local kl = getKeyLength(key)
	for i = 1, #data do
		sub = data:sub(i,i)
		for j = 1, #CYPHER do
			if sub == CYPHER[j] then
				newData = newData .. CYPHER[j-kl]
			end
		end
	end
	
	return newData
end

return { encrypt = encrypt, decrypt = decrypt }
local ServerStorage = game:GetService("ServerStorage")

local targetParts = 10 
local START_POSITION = Vector3.new(0, 5, 0)

local function genParts()
	for i=1 , targetParts do
		local part = Instance.new("Part")
		part.Size = Vector3.new(math.random(2, 10), 1, 1) -- Taille X aléatoire
		part.Position = Vector3.new(math.random(-50, 50), 5, math.random(-50, 50)) -- Position aléatoire
		part.Anchored = true
		part.Parent = ServerStorage
		part.Name = "Object n°" .. i
	end
end

local function bubbleSort(partsList)
	local self = #partsList
	for currentPass = 1, self - 1 do 
		for currentIndex = 1, self - currentPass do 
			local isLarger =   partsList[currentIndex].Size.X > partsList[currentIndex + 1].Size.X 
			if isLarger then partsList[currentIndex], partsList[currentIndex + 1] = partsList[currentIndex + 1], partsList[currentIndex] end
			end
	end
end

local function alignParts(parts)
	local currentX = START_POSITION.X
	for _, part in ipairs(parts) do
		part.Parent = workspace
		part.Position = Vector3.new(currentX, START_POSITION.Y, START_POSITION.Z)
		currentX = currentX + part.Size.X + 1 -- Espacement basé sur la taille
	end
end

genParts()
task.wait(.5)

local partsList = {}
for _, part in pairs(ServerStorage:GetChildren()) do
	table.insert(partsList, part)
end

bubbleSort(partsList)
alignParts(partsList)

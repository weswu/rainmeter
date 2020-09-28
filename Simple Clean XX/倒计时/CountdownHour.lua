
PROPERTIES = {year=0, month=0, day=0, hour=0, min=0, sec=0, fintext=""}

function Initialize()

	RELEASEDATE = {}
	setmetatable(RELEASEDATE, getmetatable(PROPERTIES))
	for k,v in pairs(PROPERTIES) do
		if k ~= fintext then
			RELEASEDATE[k] = v
		end
	end
	RELEASEDATE.isdst = true

	RELEASETEXT = PROPERTIES.fintext or ""

end

function GetTimeLeft()
	local dif = os.time(RELEASEDATE) - os.time()
	local timeleft = {
		[1] = math.floor(dif/60/60/24),	
		[2] = math.floor(dif/60/60)%24,	
		[3] = math.floor(dif/60)%60,	
		[4] = math.floor(dif)%60		
	}
	return tostring(timeleft[2])
end

function Update()
end

function GetStringValue()

	return GetTimeLeft()

end
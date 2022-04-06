local menubar = hs.menubar.new()
menubar:setTitle('⌛')
local titleIcon = "⏱" .. " "

local conf = "ASE"
local day = 7
local month = 5
local year = 2022

local function timeDiff(start_time, end_time)
    local t1 = os.date("%Y%m%d", start_time)
    local t2 = os.date("%Y%m%d", end_time)
    local day1 = {}
    local day2 = {}
    day1.year,day1.month,day1.day = string.match(t1,"(%d%d%d%d)(%d%d)(%d%d)")
    day2.year,day2.month,day2.day = string.match(t2,"(%d%d%d%d)(%d%d)(%d%d)")
    local numDay1 = os.time(day1)
    local numDay2 = os.time(day2)
    return (numDay2 - numDay1)/(3600*24)
end

local function updateMenubar()
    local targetDate = os.time({year=year,month=month,day=day})
    menubar:setTooltip("Due: " .. os.date("%Y-%m-%d", targetDate))
    local dateDiff = timeDiff(os.time(), targetDate)
    local weekLeft = math.floor(dateDiff / 7)
    local dayLeft = math.floor(dateDiff % 7)
    if weekLeft > 0 then
        menubar:setTitle(titleIcon .. conf .. ": " .. weekLeft .. "w" .. dayLeft .. "d")
    else
        menubar:setTitle(titleIcon .. conf .. ": " .. dayLeft .. "days")
    end
end

updateMenubar()
timer = hs.timer.doEvery(3600, function() updateMenubar() end )
timer:start()

local function openWebsite()
    os.execute("open https://yttty.github.io/conf-deadlines/?sub=ML,SE,OS,DM,NLP")
end

menubar:setClickCallback(openWebsite)

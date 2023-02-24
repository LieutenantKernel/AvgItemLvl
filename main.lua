_G["BINDING_HEADER_AVG_ITEM_LVL"] = "AvgItemLvl"
_G["BINDING_NAME_INSPECT_TARGET"] = "Inspect Target"
local alreadyInitialized = false
local InspectFontStrings = {}

local function initialize()
    if InspectModelFrame == nil then
        return
    end

    InspectFontStrings["avg"] = InspectModelFrame:CreateFontString(nil, "OVERLAY")
    InspectFontStrings["avg"]:SetPoint("TOPRIGHT", -5, -5)
    InspectFontStrings["avg"]:SetFont("Fonts\\FRIZQT__.ttf", 24, "OUTLINE")
    InspectFontStrings["avg"]:SetTextColor(0, 1, 0)

    alreadyInitialized = true
end

local function updateText()
    if InspectModelFrame == nil then
        return
    end

    local avgilvl = C_PaperDollInfo.GetInspectItemLevel("target")
    InspectFontStrings["avg"]:SetText(avgilvl)
    InspectFontStrings["avg"]:SetTextColor(255, 255, 0)
end

local function main()
    if CanInspect("target") then
        if not (alreadyInitialized) then
            initialize()
        end
        updateText()
    end
end
local inspectEventHandler = CreateFrame("Frame", nil, UIParent)
inspectEventHandler:RegisterEvent("INSPECT_READY")
inspectEventHandler:SetScript("OnEvent", main)

local frame = CreateFrame("Frame")
frame:RegisterEvent("NAME_PLATE_UNIT_ADDED")
frame:RegisterEvent("NAME_PLATE_UNIT_REMOVED")
frame:RegisterEvent("PLAYER_REGEN_ENABLED")

local function uhbc()
    for _, nameplate in pairs(C_NamePlate.GetNamePlates()) do
        local unit = nameplate.UnitFrame
        if unit and unit.unit then
            local ut = utSituation(unit.unit)
            local mt = utSituation("player")

            if ut and mt then
                local threatp = utpageOfLead(unit.unit) or 0
                local r, g, b

                if threatp >= 90 then
				    r, g, b = 1.0, 0.5, 0

                unit.HealthBar:SetStatusBarColor(r, g, b)
                end
            end
        end
    end
end

frame:SetScript("OnEvent", uhbc)

local updFrame = CreateFrame("Frame")
updFrame:SetScript("OnUpdate", uhbc)

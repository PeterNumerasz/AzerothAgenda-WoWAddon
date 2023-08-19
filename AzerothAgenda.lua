print("AzerothAgenda is loaded")

local AzerothAgendaMainFrame = CreateFrame("Frame", "AzerothAgendaMainFrame", UIParent)
AzerothAgendaMainFrame:SetSize(350, 500)
AzerothAgendaMainFrame:SetPoint("CENTER")
AzerothAgendaMainFrame:RegisterEvent("PLAYER_LOGIN")

local title = AzerothAgendaMainFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
title:SetPoint("TOP", 0, -10)
title:SetText("Azeroth Agenda - Daily Tasks:")


local tasks = {
    "Valiant Of Your Race: Defeat 3 Valiants in duels.",
    "A Blade Fit For A Champion: Fetch a blade from Lake Wintergrasp.",
    -- ... Add all other tasks here
}

local previousButton = nil
for i, taskText in ipairs(tasks) do
    local button = CreateFrame("CheckButton", "AzerothAgendaTask" .. i, AzerothAgendaMainFrame, "UICheckButtonTemplate")
    button:SetPoint("TOPLEFT", 10, -30 - (i-1)*30)  -- Adjust the positioning as needed
    _G[button:GetName() .. "Text"]:SetText(taskText)
    previousButton = button

    button:SetScript("OnClick", function(self)
        if self:GetChecked() then
            print("Task completed: " .. taskText)
        else
            print("Task unmarked: " .. taskText)
        end
    end)
end


local function eventHandler(self, event, ...)
    print("Event triggered: " .. event)
end

AzerothAgendaMainFrame:SetScript("OnEvent", eventHandler)

AzerothAgendaDB = AzerothAgendaDB or {}

local function OnTaskChecked(self)
    AzerothAgendaDB[self:GetName()] = self:GetChecked()
end

for task, isChecked in pairs(AzerothAgendaDB) do
    -- Load tasks and check them off if 'isChecked' is true
end
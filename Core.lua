
local F = CreateFrame("Frame")
F:Hide()
F:SetScript("OnEvent", function(self, event, msg)
	local action, quest = TourGuide:GetObjectiveInfo()

	if action == "TURNIN" then
		local string = quest:gsub(" %(Part %d%)", "") -- strip out part number

		local _, _, text = msg:find("^(.-) completed%.$")

		if type(text) == 'string' and string == text then
			TourGuide:CompleteQuest(quest)
			TourGuide:UpdateStatusFrame()
		end
	end
end)

F:RegisterEvent("CHAT_MSG_SYSTEM")

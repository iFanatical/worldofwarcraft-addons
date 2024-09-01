local uiSetup = CreateFrame("Frame")
uiSetup:RegisterEvent("PLAYER_ENTERING_WORLD")
uiSetup:SetScript("OnEvent", function(self)
		
		--Hide StanceBar
		StanceBar:Hide()

		--Hide XP Bar
		MainStatusTrackingBarContainer:HookScript("OnShow", MainStatusTrackingBarContainer.Hide)
		MainStatusTrackingBarContainer:Hide()
        
        --Focus Target of Target Frame
		FocusFrameToT:ClearAllPoints()
        FocusFrameToT:SetPoint("CENTER",FocusFrame,"CENTER", 80,-55)
        --FocusFrameToT.SetPoint = function() end
        FocusFrameToT:SetScale(1)
        
		--Target of Target Frame
		TargetFrameToT:ClearAllPoints()
        TargetFrameToT:SetPoint("CENTER",TargetFrame,"CENTER", 80,-55)
        --TargetFrameToT.SetPoint = function() end
        TargetFrameToT:SetScale(1)

        -- Party frame setup
        CompactPartyFrame:ClearAllPoints()
        CompactPartyFrame:SetScale(1.2)
        
        -- Rune frame setup
        RuneFrame:HookScript("OnShow", RuneFrame.Hide)
        RuneFrame:Hide()
        RuneFrame:ClearAllPoints()
        
        -- Essence frame setup
        EssencePlayerFrame:HookScript("OnShow", RuneFrame.Hide)
        EssencePlayerFrame:Hide()
        EssencePlayerFrame:ClearAllPoints()
        
        -- Combo Point Druid Player frame setup
        DruidComboPointBarFrame:HookScript("OnShow", DruidComboPointBarFrame.Hide)
        DruidComboPointBarFrame:Hide()
        DruidComboPointBarFrame:ClearAllPoints()
        
        -- Monk Harmony Bar frame setup
        
        --MonkHarmonyBarFrame:HookScript("OnShow", MonkHarmonyBarFrame.Hide)
        --MonkHarmonyBarFrame:Hide()
        --MonkHarmonyBarFrame:ClearAllPoints()

        -- Monk Stagger Bar frame setup
        
        --MonkStaggerBar:HookScript("OnShow", MonkStaggerBar.Hide)
        --MonkStaggerBar:Hide()
        --MonkStaggerBar:ClearAllPoints()
        
        --Paladin PowerBar Settings
		PaladinPowerBarFrame:HookScript("OnShow", PaladinPowerBarFrame.Hide)
        PaladinPowerBarFrame:Hide()
        PaladinPowerBarFrame:ClearAllPoints()
        
        --AlternatePowerBar Settings
        --PlayerFrameAlternatePowerBarArea:Hide()
        --PlayerFrameAlternatePowerBarArea:HookScript("OnShow", PlayerFrameAlternatePowerBarArea.Hide)
        --PlayerFrame.PlayerFrameContainer.AlternatePowerFrameTexture:Hide()
        --PlayerFrame.PlayerFrameContainer.AlternatePowerFrameTexture:HookScript("OnShow", PlayerFrame.PlayerFrameContainer.AlternatePowerFrameTexture.Hide)
        --PlayerFrame.PlayerFrameContainer.AlternatePowerFrameTexture:HookScript("OnShow", PlayerFrame.PlayerFrameContainer.Show)
        --PlayerFrame.PlayerFrameContainer:Show()
        --AlternatePowerBar.Border:Hide()
        --AlternatePowerBar.Border:HookScript("OnShow", AlternatePowerBar.Border.Hide)
        --AlternatePowerBar.Background:Hide()
        --AlternatePowerBar.Background:HookScript("OnShow", AlternatePowerBar.Background.Hide)
        
        --Hide Class Totem Frame
        TotemFrame:UnregisterAllEvents()
		TotemFrame:HookScript("OnShow", TotemFrame.Hide)
		TotemFrame:Hide()
        
		self:UnregisterAllEvents()
end)


--UI Scale to fit 1440p

local uiScale = CreateFrame("Frame")
uiScale:SetScript("OnEvent", function()
    UIParent:SetScale(0.53333333333333333333333333)
--	ShadowUF.Layout:Reload()
end)
uiScale:RegisterEvent('PLAYER_ENTERING_WORLD')


--Modify Chat Frames

local function ModifyChatFrames()
    for i = 1, NUM_CHAT_WINDOWS do
        local chatFrame = _G["ChatFrame"..i]

        if chatFrame then
            local background = _G["ChatFrame"..i.."Background"]
            local editBox = _G["ChatFrame"..i.."EditBox"]
            local editBoxMid = _G["ChatFrame"..i.."EditBoxMid"]
            local editBoxRight = _G["ChatFrame"..i.."EditBoxRight"]
            local editBoxLeft = _G["ChatFrame"..i.."EditBoxLeft"]
            local rightTexture = _G["ChatFrame"..i.."RightTexture"]
            local leftTexture = _G["ChatFrame"..i.."LeftTexture"]
            local topTexture = _G["ChatFrame"..i.."TopTexture"]
            local bottomTexture = _G["ChatFrame"..i.."BottomTexture"]
            local buttonFrame = _G["ChatFrame"..i.."ButtonFrame"]
            local font, size, _ = chatFrame:GetFont()


            if background then background:Hide() end
            if editBoxMid then editBoxMid:Hide() end
            if editBoxRight then editBoxRight:Hide() end
            if editBoxLeft then editBoxLeft:Hide() end
            if rightTexture then rightTexture:Hide() end
            if leftTexture then leftTexture:Hide() end
            if topTexture then topTexture:Hide() end
            if bottomTexture then bottomTexture:Hide() end

            if buttonFrame then buttonFrame:Hide() end

            if editBox then
                editBox:ClearAllPoints()
                editBox:SetPoint("CENTER", chatFrame, "CENTER", 0, 165)

                -- Set a proper width and height for the EditBox
                editBox:SetWidth(480)  -- You can adjust the width as needed
                editBox:SetHeight(20)  -- You can adjust the height as needed
            end
            if chatFrame then
                chatFrame:SetFont(font, 14, "OUTLINE")  -- Add outline to the font
                chatFrame:SetShadowOffset(0, 0)  -- Remove shadow
            end
        end
    end
end

-- Call the function when the addon is loaded
ModifyChatFrames()


--remove chat tab textures
local function ModifyChatTabs()
    for i = 1, NUM_CHAT_WINDOWS do
        local chatTab = _G["ChatFrame"..i.."Tab"]
        local fontString = chatTab:GetFontString()
        local font, size, _ = fontString:GetFont()

        if chatTab then
            chatTab.Right:Hide()
            chatTab.Left:Hide()
            chatTab.Middle:Hide()

            chatTab.ActiveLeft:SetAlpha(0)
            chatTab.ActiveRight:SetAlpha(0)
            chatTab.ActiveMiddle:SetAlpha(0)

            chatTab.HighlightLeft:SetTexture(nil)
            chatTab.HighlightRight:SetTexture(nil)
            chatTab.HighlightMiddle:SetTexture([[Interface\BUTTONS\CheckButtonGlow]])
            chatTab.HighlightMiddle:SetWidth(76)
            chatTab.HighlightMiddle:SetTexCoord(0, 0, 1, 0.5)
        end
        -- Modify the chat tab font
        if fontString then
            fontString:SetFont(font, 14, "OUTLINE")  -- Add outline to the tab text
            fontString:SetShadowOffset(0, 0)  -- Remove shadow from the tab text
        end
    end
end


-- Call the function when the addon is loaded
--local CallModifyChatTabs = CreateFrame("Frame")
--CallModifyChatTabs:RegisterEvent('CHAT_MSG_WHISPER')
--CallModifyChatTabs:RegisterEvent('CHAT_MSG_CHANNEL')
--CallModifyChatTabs:SetScript("OnEvent", function()
--    if event == 'CHAT_MSG_WHISPER' or event == 'CHAT_MSG_CHANNEL' then
--    ModifyChatTabs()
--    ModifyChatFrames()
--    end
--end)


--Load ModifyChatTabs
ModifyChatTabs()


local function ModifyPlayerName()
    local playerUnitName = _G["PlayerName"]
    local playerUnitLevel = _G["PlayerLevelText"]
    local font, size, _ = playerUnitName:GetFont()

    if playerUnitName then
        playerUnitName:SetFont(font, size, "OUTLINE")  -- Add outline to the font
        playerUnitName:SetShadowOffset(0, 0)  -- Remove shadow
        playerUnitName:SetTextColor(1, 1, 1)
    end

    if playerUnitLevel then
        playerUnitLevel:SetFont(font, size, "OUTLINE")  -- Add outline to the font
        playerUnitLevel:SetShadowOffset(0, 0)  -- Remove shadow
    end
end

--Load ModifyPlayerName
ModifyPlayerName()


local function ModifyPetName()
    local petUnitName = _G["PetName"]
    local font, size, _ = petUnitName:GetFont()

    if petUnitName then
        petUnitName:SetFont(font, size, "OUTLINE")  -- Add outline to the font
        petUnitName:SetShadowOffset(0, 0)  -- Remove shadow
        petUnitName:SetTextColor(1, 1, 1)
    end
end

--Load ModifyPetName
ModifyPetName()


local function ModifyTargetName()
    local targetFrameName = TargetFrame.TargetFrameContent.TargetFrameContentMain.Name
    local targetFrameLevelText = TargetFrame.TargetFrameContent.TargetFrameContentMain.LevelText
    local font, size, _ = targetFrameName:GetFont()

    if targetFrameName then
        targetFrameName:SetFont(font, size, "OUTLINE")  -- Add outline to the font
        targetFrameName:SetShadowOffset(0, 0)  -- Remove shadow
        targetFrameName:SetTextColor(1, 1, 1)
    end

    if targetFrameLevelText then
        targetFrameLevelText:SetFont(font, size, "OUTLINE")  -- Add outline to the font
        targetFrameLevelText:SetShadowOffset(0, 0)  -- Remove shadow
    end
end

-- Load ModifyTargetName
ModifyTargetName()

local function ModifyToTName()
    local targetToTName = TargetFrameToT.Name
    local font, size, _ = targetToTName:GetFont()

    if targetToTName then
        targetToTName:SetFont(font, size, "OUTLINE")  -- Add outline to the font
        targetToTName:SetShadowOffset(0, 0)  -- Remove shadow
        targetToTName:SetTextColor(1, 1, 1)
    end
end

local targetNameEvent = CreateFrame("Frame")
targetNameEvent:RegisterEvent("ADDON_LOADED")
targetNameEvent:RegisterEvent("PLAYER_LOGIN")
targetNameEvent:RegisterEvent("PLAYER_ENTERING_WORLD")
targetNameEvent:RegisterEvent("PLAYER_TARGET_CHANGED")
targetNameEvent:RegisterEvent("UNIT_TARGET")
targetNameEvent:SetScript("OnEvent", function()
    if event == 'PLAYER_TARGET_CHANGED' then
    ModifyTargetName()
    ModifyToTName()
    end
end)


local function ModifyFocusName()
    local focusFrameName = FocusFrame.TargetFrameContent.TargetFrameContentMain.Name
    local focusFrameLevelText = FocusFrame.TargetFrameContent.TargetFrameContentMain.LevelText
    local focusFrameToT = FocusFrameToT
    local font, size, _ = focusFrameName:GetFont()

    if focusFrameName then
        focusFrameName:SetFont(font, size, "OUTLINE")  -- Add outline to the font
        focusFrameName:SetShadowOffset(0, 0)  -- Remove shadow
        focusFrameName:SetTextColor(1, 1, 1)
    end

    if focusFrameLevelText then
        focusFrameLevelText:SetFont(font, size, "OUTLINE")  -- Add outline to the font
        focusFrameLevelText:SetShadowOffset(0, 0)  -- Remove shadow
    end
end

local focusNameEvent = CreateFrame("Frame")
focusNameEvent:RegisterEvent("ADDON_LOADED")
focusNameEvent:RegisterEvent("PLAYER_LOGIN")
focusNameEvent:RegisterEvent("PLAYER_ENTERING_WORLD")
focusNameEvent:RegisterEvent("PLAYER_FOCUS_CHANGED")
focusNameEvent:SetScript("OnEvent", function()
    if event == 'PLAYER_FOCUS_CHANGED' then
    ModifyFocusName()
    end
end)

--Load ModifyFocusName
ModifyFocusName()


local function ModifyPartyStatus()
    for i = 1, 5 do
        local partyStatus = _G["CompactPartyFrameMember"..i.."StatusText"]
        local font, size, _ = partyStatus:GetFont()
        
        if partyStatus then
            partyStatus:SetFont(font, size, "OUTLINE")  -- Add outline to the font
            partyStatus:SetShadowOffset(0, 0)  -- Remove shadow         
            partyStatus:SetTextColor (1, 1, 1)  
        end
    end
end

--Load ModifyPartyStatus
ModifyPartyStatus()


local function ModifyPartyNames()
    for i = 1, 5 do
        local partyName = _G["CompactPartyFrameMember"..i.."Name"]
        local font, size, _ = partyName:GetFont()
        
        if partyName then
            partyName:SetFont(font, size, "OUTLINE")  -- Add outline to the font
            partyName:SetShadowOffset(0, 0)  -- Remove shadow           
        end
    end
end

--Load ModifyPartyNames
ModifyPartyNames()


local function ChangeRaidFrameFont()
    local newFont = "Fonts\\FRIZQT__.TTF"  -- Path to the desired font
    local fontSizeName = 12  -- Desired font size
    local fontSizeText = 18  -- Desired font size
    local fontStyle = "OUTLINE"  -- Desired font style (e.g., "OUTLINE", "THICKOUTLINE", "")

    -- Change the font of the raid frame unit names
    for i = 1, 8 do  -- 8 groups in a raid
        for j = 1, 5 do  -- 5 players per group
            local nameFrame = _G["CompactRaidGroup"..i.."Member"..j.."Name"]
            local statusFrame = _G["CompactRaidGroup"..i.."Member"..j.."StatusText"]
            if nameFrame then
                nameFrame:SetFont(newFont, fontSizeName, fontStyle)
                nameFrame:SetShadowOffset(0, 0)  -- Remove shadow
                nameFrame:SetTextColor(1, 1, 1)
            end
            if statusFrame then
                statusFrame:SetFont(newFont, fontSizeText, fontStyle)
                statusFrame:SetShadowOffset(0, 0)  -- Remove shadow
                statusFrame:SetTextColor(1, 1, 1)
            end
        end
    end

    -- Change the font of individual raid members outside of groups
    for i = 1, 40 do  -- 40 is the maximum number of raid members
        local nameFrame = _G["CompactRaidFrame"..i.."Name"]
        local statusFrame = _G["CompactRaidFrame"..i.."StatusText"]
        if nameFrame then
            nameFrame:SetFont(newFont, fontSizeName, fontStyle)
            nameFrame:SetShadowOffset(0, 0)  -- Remove shadow
            nameFrame:SetTextColor(1, 1, 1)
        end
        if statusFrame then
            statusFrame:SetFont(newFont, fontSizeText, fontStyle)
            statusFrame:SetShadowOffset(0, 0)  -- Remove shadow
            statusFrame:SetTextColor(1, 1, 1)
        end
    end
end

-- Hook into the function that updates the raid frames
hooksecurefunc("CompactUnitFrame_UpdateName", ChangeRaidFrameFont)
hooksecurefunc("CompactUnitFrame_UpdateStatusText", ChangeRaidFrameFont)

-- Apply font changes when the addon is loaded
local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:SetScript("OnEvent", function(self, event, addonName)
    if addonName == "Blizzard_CompactRaidFrames" then
        ChangeRaidFrameFont()
    end
end)


--Short actionbar hotkeys
local patterns = { 
	-- ["Original text"] = "Change to",	
	["Middle Mouse"] = "M3",	
	["Mouse Wheel Down"] = "WD",
	["Mouse Wheel Up"] = "WU",
	["Mouse Button "] = "M", -- M4, M5
	["Num Pad "] = "N",
	["a%-"] = "A", -- alt
	["c%-"] = "C", -- ctrl
	["s%-"] = "S", -- shift
}

local bars = {
	"ActionButton",
	"MultiBarBottomLeftButton",
	"MultiBarBottomRightButton",
	"MultiBarLeftButton",
	"MultiBarRightButton",
    "MultiBar5Button",
}

local FONT_SIZE = 13
local FONT_OUTLINE = "OUTLINE"

local function UpdateHotkey(self, actionButtonType)
	local hotkey = self.HotKey
	local text = hotkey:GetText()
	for k, v in pairs(patterns) do
		local modified = text:gsub(k, v)
		if modified ~= text then
			text = modified
		end
	end
	hotkey:SetText(text)
	hotkey:SetVertexColor(1,1,1,0.8)
	hotkey:SetFont("Fonts\\FRIZQT__.TTF", FONT_SIZE, FONT_OUTLINE)
end

for _, bar in pairs(bars) do
	for i = 1, NUM_ACTIONBAR_BUTTONS do
		local button = _G[bar..i]
		hooksecurefunc(button, "UpdateHotkeys", UpdateHotkey)
	end
end

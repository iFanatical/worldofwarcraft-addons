-------------
--UI SETTINGS
-------------
local uiSetup = CreateFrame("Frame")
uiSetup:RegisterEvent("PLAYER_ENTERING_WORLD")
uiSetup:SetScript("OnEvent", function(self)
    --Hide EncounterBar
    EncounterBar:Hide()

    --Hide XP Bar
    MainStatusTrackingBarContainer:HookScript("OnShow", MainStatusTrackingBarContainer.Hide)
    MainStatusTrackingBarContainer:Hide()

    --Player Frame Adjustment
    PlayerFrameGroupIndicatorMiddle:SetTexture(nil)
    PlayerFrameGroupIndicatorLeft:SetTexture(nil)
    PlayerFrameGroupIndicatorRight:SetTexture(nil)
    PlayerFrameGroupIndicatorText:SetShadowOffset(0,0)
    PlayerFrameGroupIndicatorText:SetFont("Fonts\\2002.TTF", 10, "OUTLINE")
    PlayerFrameGroupIndicatorText:SetTextColor(1, 1, 1)

    --Focus Target of Target Frame
    FocusFrameToT:ClearAllPoints()
    FocusFrameToT:SetPoint("CENTER",FocusFrame,"CENTER", 80,-55)
    FocusFrameToT:SetScale(1)

    --Target of Target Frame
    TargetFrameToT:ClearAllPoints()
    TargetFrameToT:SetPoint("CENTER",TargetFrame,"CENTER", 80,-55)
    TargetFrameToT:SetScale(1)

    --Party frame setup
    CompactPartyFrame:ClearAllPoints()
    CompactPartyFrame:SetScale(1.2)

    --Arena frame setup
    CompactArenaFrame:SetScale(1.2)
        
    --Rune frame setup
    RuneFrame:HookScript("OnShow", RuneFrame.Hide)
    RuneFrame:Hide()
    RuneFrame:ClearAllPoints()
        
    --Essence frame setup
    EssencePlayerFrame:HookScript("OnShow", RuneFrame.Hide)
    EssencePlayerFrame:Hide()
    EssencePlayerFrame:ClearAllPoints()
        
    --Combo Point Druid Player frame setup
    DruidComboPointBarFrame:HookScript("OnShow", DruidComboPointBarFrame.Hide)
    DruidComboPointBarFrame:Hide()
    DruidComboPointBarFrame:ClearAllPoints()

    --Monk Harmony Bar frame setup
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

----------
--UI SCALE
----------
local uiScale = CreateFrame("Frame")
uiScale:SetScript("OnEvent", function()
    UIParent:SetScale(0.53333333333333333333333333)
--	ShadowUF.Layout:Reload()
end)
uiScale:RegisterEvent('PLAYER_ENTERING_WORLD')

------------
--CHAT FRAME
------------
local function ModifyChatFrames()
    for i = 1, NUM_CHAT_WINDOWS do
        local chatFrame = _G["ChatFrame"..i]

        if chatFrame then
            local background = _G["ChatFrame"..i.."Background"]
            local editBox = _G["ChatFrame"..i.."EditBox"]
            local editBoxMid = _G["ChatFrame"..i.."EditBoxMid"]
            local editBoxRight = _G["ChatFrame"..i.."EditBoxRight"]
            local editBoxLeft = _G["ChatFrame"..i.."EditBoxLeft"]
            local editBoxFocusRight = _G["ChatFrame"..i.."EditBoxFocusRight"]
            local editBoxFocusMid = _G["ChatFrame"..i.."EditBoxFocusMid"]
            local editBoxFocusLeft = _G["ChatFrame"..i.."EditBoxFocusLeft"]
            local rightTexture = _G["ChatFrame"..i.."RightTexture"]
            local leftTexture = _G["ChatFrame"..i.."LeftTexture"]
            local topTexture = _G["ChatFrame"..i.."TopTexture"]
            local topRightTexture = _G["ChatFrame"..i.."TopRightTexture"]
            local topLeftTexture = _G["ChatFrame"..i.."TopLeftTexture"]
            local bottomTexture = _G["ChatFrame"..i.."BottomTexture"]
            local bottomRightTexture = _G["ChatFrame"..i.."BottomRightTexture"]
            local bottomLeftTexture = _G["ChatFrame"..i.."BottomLeftTexture"]
            local buttonFrame = _G["ChatFrame"..i.."ButtonFrame"]
            local font, size, _ = chatFrame:GetFont()

            --Remove ChatFrame background/textures
            if background then background:Hide() end
            if editBoxMid then editBoxMid:Hide() end
            if editBoxRight then editBoxRight:Hide() end
            if editBoxLeft then editBoxLeft:Hide() end
            if rightTexture then rightTexture:Hide() end
            if leftTexture then leftTexture:Hide() end
            if topTexture then topTexture:Hide() end
            if topRightTexture then topRightTexture:Hide() end
            if topLeftTexture then topLeftTexture:Hide() end
            if bottomTexture then bottomTexture:Hide() end
            if bottomRightTexture then bottomRightTexture:Hide() end
            if bottomLeftTexture then bottomLeftTexture:Hide() end

            --Removes small white border around editBox
            if editBoxFocusRight then editBoxFocusRight:SetTexture(nil) end
            if editBoxFocusMid then editBoxFocusMid:SetTexture(nil) end
            if editBoxFocusLeft then editBoxFocusLeft:SetTexture(nil) end

            if buttonFrame then buttonFrame:Hide() end

            if editBox then
                editBox:ClearAllPoints()
                editBox:SetPoint("CENTER", chatFrame, "CENTER", 0, 165)

                -- Set a proper width and height for the EditBox
                editBox:SetWidth(480)  -- You can adjust the width as needed
                editBox:SetHeight(24)  -- You can adjust the height as needed
            end
            if chatFrame then
                chatFrame:SetFont(font, 14, "OUTLINE")  -- Add outline to the font
                chatFrame:SetShadowOffset(0, 0)  -- Remove shadow
            end
        end
    end
end

--Load ModifyChatFrames
--ModifyChatFrames()

-----------
--CHAT TABS
-----------
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

--Load ModifyChatTabs
--ModifyChatTabs()

---------------
--EDITBOX FONTS
---------------
local function EditBoxFont()
    for i = 1, NUM_CHAT_WINDOWS do
        local editBox = _G["ChatFrame"..i.."EditBox"]
        local editBoxHeader = _G["ChatFrame"..i.."EditBoxHeader"]
        local font, size, _ = editBox:GetFont()

        if editBox then
            editBox:SetFont(font, size, "OUTLINE")  -- Add outline to the tab text
            editBox:SetShadowOffset(0, 0)  -- Remove shadow from the tab text
        end

        if editBoxHeader then
            editBoxHeader:SetFont(font, size, "OUTLINE")  -- Add outline to the tab text
            editBoxHeader:SetShadowOffset(0, 0)  -- Remove shadow from the tab text
        end
    end
end

--EditBoxFont()

--------------
--PLAYER FRAME
--------------
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

-----------
--PET FRAME
-----------
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

--------------
--TARGET FRAME
--------------
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

local targetNameEvent = CreateFrame("Frame")
targetNameEvent:RegisterEvent("ADDON_LOADED")
targetNameEvent:RegisterEvent("PLAYER_LOGIN")
targetNameEvent:RegisterEvent("PLAYER_ENTERING_WORLD")
targetNameEvent:RegisterEvent("PLAYER_TARGET_CHANGED")
targetNameEvent:RegisterEvent("UNIT_TARGET")
targetNameEvent:SetScript("OnEvent", function()
    if event == 'PLAYER_TARGET_CHANGED' then
    ModifyTargetName()
    end
end)

--Load ModifyTargetName
ModifyTargetName()


local function ModifyToTName()
    --local targetToTName = TargetFrameToT.Name
    local targetToTName = TargetFrameToT.Name
    local font, size, _ = targetToTName:GetFont()

    if targetToTName then
        targetToTName:SetFont(font, size, "OUTLINE")  -- Add outline to the font
        targetToTName:SetShadowOffset(0, 0)  -- Remove shadow
    end
end


local targetToTNameEvent = CreateFrame("Frame")
targetToTNameEvent:RegisterEvent("UNIT_CLASSIFICATION_CHANGED");
targetToTNameEvent:RegisterEvent("PLAYER_FLAGS_CHANGED");
targetToTNameEvent:SetScript("OnEvent", function()
    if event == 'PLAYER_FLAGS_CHANGED' then
    ModifyToTName()
    end
end)

--Load ModifyToTName
ModifyToTName()

-------------
--FOCUS FRAME
-------------
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
        focusFrameLevelText:SetTextColor(1, 1, 1)
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


local function ModifyFocusToTName()
    local focusToTName = FocusFrameToT.Name
    local font, size, _ = focusToTName:GetFont()

    if focusToTName then
        focusToTName:SetFont(font, size, "OUTLINE")  -- Add outline to the font
        focusToTName:SetShadowOffset(0, 0)  -- Remove shadow
        focusToTName:SetTextColor(1, 1, 1)
    end
end

local focusToTNameEvent = CreateFrame("Frame")
focusToTNameEvent:RegisterEvent("UNIT_CLASSIFICATION_CHANGED")
focusToTNameEvent:RegisterEvent("PLAYER_FLAGS_CHANGED")
focusToTNameEvent:SetScript("OnEvent", function()
    if event == 'PLAYER_FLAGS_CHANGED' then
    ModifyFocusToTName()
    end
end)

--Load ModifyToTName
ModifyFocusToTName()

--------------
--ARENA FRAMES
--------------
local function ModifyArenaStatus()
    for i = 1, 5 do
        local arenaStatus = _G["CompactArenaFrameMember"..i.."StatusText"]
        local font, size, _ = arenaStatus:GetFont()
        
        if arenaStatus then
            arenaStatus:SetFont(font, size, "OUTLINE")  -- Add outline to the font
            arenaStatus:SetShadowOffset(0, 0)  -- Remove shadow         
            arenaStatus:SetTextColor (1, 1, 1)  
        end
    end
end

local function ModifyArenaNames()
    for i = 1, 5 do
        local arenaName = _G["CompactArenaFrameMember"..i.."Name"]
        local font, size, _ = arenaName:GetFont()
        
        if arenaName then
            arenaName:SetFont(font, size, "OUTLINE")  -- Add outline to the font
            arenaName:SetShadowOffset(0, 0)  -- Remove shadow           
        end
    end
end

--Load ModifyPartyStatus and Names
ModifyArenaStatus()
ModifyArenaNames()

-------------
--BOSS FRAMES
-------------
local function SetBossFrameFonts(bossFrame)
    local font = "Fonts\\FRIZQT__.TTF"  -- Path to your desired font
    local fontSize = 10  -- Desired font size
    local fontOutline = "OUTLINE"  -- Font outline type (e.g., "OUTLINE", "THICKOUTLINE", or "" for no outline)

    local bossFrameName = bossFrame.TargetFrameContent.TargetFrameContentMain.Name
    if bossFrameName then
        bossFrameName:SetFont(font, fontSize, fontOutline)
        bossFrameName:SetShadowOffset(0, 0)
        bossFrameName:SetTextColor(1, 1, 1)
    end
end

local function HookBossFrames()
    for i = 1, 5 do
        local bossFrame = _G["Boss"..i.."TargetFrame"]
        if bossFrame then
            bossFrame:HookScript("OnShow", function(self)
                SetBossFrameFonts(self)
            end)
        end
    end
end

local SetBossFrameFontsEvent = CreateFrame("Frame")
SetBossFrameFontsEvent:RegisterEvent("PLAYER_ENTERING_WORLD")
SetBossFrameFontsEvent:SetScript("OnEvent", function(self, event, ...)
    HookBossFrames()
end)

--------------
--PARTY FRAMES
--------------
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

--Load ModifyPartyStatus and Names
ModifyPartyStatus()
ModifyPartyNames()

-------------
--RAID FRAMES
-------------
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
local ChangeRaidFrameFontEvent = CreateFrame("Frame")
ChangeRaidFrameFontEvent:RegisterEvent("ADDON_LOADED")
ChangeRaidFrameFontEvent:SetScript("OnEvent", function(self, event, addonName)
    if addonName == "Blizzard_CompactRaidFrames" then
        ChangeRaidFrameFont()
    end
end)


--local function ChangeObjTrackerFonts()
--    local thqFonts = _G["TRACKER_HEADER_QUESTS"]
--    local font, size, _ = FontString:GetFont()
--
--    if thqFonts then
--        thqFonts:SetFont(font, size, "OUTLINE")
--        thqFonts:SetShadowOffset(0,0)
--    end
--end
--
--ChangeObjTrackerFonts()

-------------
--ERROR FRAME
-------------
local function SetErrorFrameFont()
    local font = "Fonts\\FRIZQT__.TTF"  -- Path to your desired font
    local fontSize = 18  -- Desired font size
    local fontOutline = "OUTLINE"  -- Font outline type (e.g., "OUTLINE", "THICKOUTLINE", or "" for no outline)

    if font then
        UIErrorsFrame:SetFont(font, fontSize, fontOutline)
        UIErrorsFrame:SetShadowOffset(0, 0)
    end
end

-- Apply the font settings when the player logs in or reloads the UI
local errorFrameEvent = CreateFrame("Frame")
errorFrameEvent:RegisterEvent("PLAYER_LOGIN")
errorFrameEvent:SetScript("OnEvent", SetErrorFrameFont)

-- Run the function initially when the UI loads
SetErrorFrameFont()

--------------------
--ACTION BAR HOTKEYS
--------------------
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

------------------------
--PET ACTION BAR HOTKEYS
------------------------
local function UpdatePetActionButtonText()
    for i = 1, NUM_PET_ACTION_SLOTS do
        local button = _G["PetActionButton"..i]
        local hotkey = _G[button:GetName().."HotKey"]
        local keyText = hotkey:GetText()

        -- Replace the text as needed
        if keyText then
            keyText = keyText:gsub("a%-", "A")
            keyText = keyText:gsub("s%-", "S")
            hotkey:SetText(keyText)
        end
    end
end

-- Apply the changes when the player logs in or reloads the UI
local petActionButtonEvent = CreateFrame("Frame")
petActionButtonEvent:RegisterEvent("PLAYER_ENTERING_WORLD")
petActionButtonEvent:RegisterEvent("UPDATE_BINDINGS")
petActionButtonEvent:RegisterEvent("PET_BAR_UPDATE")
petActionButtonEvent:SetScript("OnEvent", function()
    C_Timer.After(0.1, UpdatePetActionButtonText)  -- Delay to ensure all buttons are updated
end)

UpdatePetActionButtonText()

-------------
--DAMAGE TEXT
-------------
--DAMAGE_TEXT_FONT = "Interface\\AddOns\\!FanaticalMedia\\fonts\\PEPSI_pl.ttf"

--------------------------------
----REMOVE BW QUEUE TIMER BORDER
--------------------------------
--local function bwQTHide()
--    if BigWigsLoader then
--        print("BigWigs' Queue Timer frame hidden!")
--        BigWigsLoader.RegisterMessage('!FanaticalCustomUI', "BigWigs_FrameCreated", function(event, frame, name)
--            if name == "QueueTimer" then
--                frame:SetTexture(nil)
--            end
--        end)
--    end
--end
--
--local bwQTEvent = CreateFrame("Frame")
--bwQTEvent:SetScript("OnEvent", function()
--    if event == 'ADDON_LOADED' and addon == 'BigWigs' then
--    bwQTHide()
--    end
--end)

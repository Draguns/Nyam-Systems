--
-- Project: Magic Fly School by Nyam Systems
-- Description: Designed and Produced by Nyam Systems®
--
-- Version: 1.0
-- Managed with http://CoronaProjectManager.com
--
-- Copyright 2013 . All Rights Reserved.
-- 
local storyboard = require("storyboard")
display.setStatusBar(display.HiddenStatusBar)
--print("Nyam System presents... 		-=Magic Fly School=-")
centerX = display.contentWidth * .5
centerY = display.contentHeight * .5 
storyboard.gotoScene ( "main_start", { effect = "fade" } )
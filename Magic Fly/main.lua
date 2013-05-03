--
-- Project: Test
-- Description: 
--
-- Version: 1.0
-- Managed with http://CoronaProjectManager.com
--
-- Copyright 2013 . All Rights Reserved.
-- 

local storyboard = require("storyboard")
display.setStatusBar(display.HiddenStatusBar)
print("Wola")
centerX = display.contentWidth * .5
centerY = display.contentHeight * .5 
storyboard.gotoScene ( "start", { effect = "fade" } )


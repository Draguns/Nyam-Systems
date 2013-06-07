--
-- Project: Magic Fly School by Nyam Systems
-- Description: Designed and Produced by Nyam Systems®
--
-- Version: 1.0
-- Managed with http://CoronaProjectManager.com
--
-- Copyright 2013 . All Rights Reserved.
-- 
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- NEW SCENE
-- local forward references should go here
----------------------------------------------------------------------------------------------------------------------------------------------------------------------

require ("buttons")
--local widget = require("widget")
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()


local function tapBtn(param)
	print("De main_start go to ABC")
	storyboard.gotoScene( param, { effect="slideUp" } )
end

--[[
local btn_start = widget.newButton{
	default = "images/bird_blue.png",
	--over = "images/1.png",
	width = 40,
	height = 60,
	onRelease = tapBtn
}
]]--

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CREATE SCENE
-- Called when the scene's view does not exist:
----------------------------------------------------------------------------------------------------------------------------------------------------------------------

function scene:createScene( event )
	local group = self.view

	local background = display.newImage("images/background.png")
	background.x = centerX
	background.y = centerY
	group:insert(background)
	
	makeButton("START", 50, 50, tapBtn, "scn_abc", group)



end


----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ENTER SCENE
-- Called immediately after scene has moved onscreen:
-- (e.g. start timers, load audio, start listeners, etc.)
----------------------------------------------------------------------------------------------------------------------------------------------------------------------

function scene:enterScene( event )
        local group = self.view

      

end



----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- EXIT SCENE
-- Called when scene is about to move offscreen:
-- (e.g. stop timers, remove listeners, unload sounds, etc.)
----------------------------------------------------------------------------------------------------------------------------------------------------------------------

function scene:exitScene( event )
        local group = self.view



end



----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- DESTROY SCENE
-- Called prior to the removal of scene's "view" (display group)
-- (e.g. remove listeners, widgets, save state, etc.)
----------------------------------------------------------------------------------------------------------------------------------------------------------------------

function scene:destroyScene( event )
        local group = self.view

        --      INSERT code here (e.g. remove listeners, widgets, save state, etc.)

end



---------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
-- SCENE LISTENERS
---------------------------------------------------------------------------------

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )

-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )

-- "exitScene" event is dispatched before next scene's transition begins
scene:addEventListener( "exitScene", scene )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )


---------------------------------------------------------------------------------

return scene

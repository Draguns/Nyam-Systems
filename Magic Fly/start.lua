--
-- Project: config.lua
-- Description: 
--
-- Version: 1.0
-- Managed with http://CoronaProjectManager.com
--
-- Copyright 2013 . All Rights Reserved.
-- 
require("buttons")
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()


-- local forward references should go here --

local function tapBtn(param)

	print("de start a "..param)
	storyboard.gotoScene( "scn_abecedari", { effect="slideUp" } )
end


-- Called when the scene's view does not exist:
function scene:createScene( event )
	local group = self.view

	local bg = display.newImageRect("images/bg_up.jpg", 480, 320)
	bg.x = centerX
	bg.y = centerY
	group:insert(bg)
	
	local centerbx = 50
	local centerby = 50	
	
	makeButton("START", centerbx, centerby, tapBtn, "scn_abecedari", group)


end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
        local group = self.view

        --      INSERT code here (e.g. start timers, load audio, start listeners, etc.)

end


-- Called when scene is about to move offscreen:
function scene:exitScene( event )
        local group = self.view

        --      INSERT code here (e.g. stop timers, remove listeners, unload sounds, etc.)

end


-- Called prior to the removal of scene's "view" (display group)
function scene:destroyScene( event )
        local group = self.view

        --      INSERT code here (e.g. remove listeners, widgets, save state, etc.)

end



---------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
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

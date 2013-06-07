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
require("buttons")

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
math.randomseed(os.time())

local letras = {
	{  {160,280}, {160,230},{160,180},{200,180}, {240,180},{280,180}, {180,130},{300,130}, {200,80},{280,80}, {240,80},{320,180}, {320,230},{320,280}, {240,30} },--AR
	{  {160,280}, {160,230},{160,180},{160,130}, {160,80},{160,30}, {200,30},{240,30}, {280,55},{320,80}, {280,105},{240,130}, {200,130},{280,155}, {320,180},{320,230}, {240,280},{280,255}, {200,280} },--BR
	{  {200,255}, {160,230},{160,180},{160,130}, {160,80},{200,55}, {240,55},{280,55}, {320,80},{240,255}, {280,255},{320,230} }, --C
	{  {200,255}, {160,230},{160,180},{160,130}, {160,80},{200,55}, {240,55},{280,80}, {320,130},{240,255}, {280,230},{320,180} }, --D
	{  {200,255}, {160,230},{160,180},{160,130}, {160,80},{200,55}, {240,55},{280,55}, {320,55},{240,255}, {280,255},{320,255},{200,130}, {240,130},{280,130} }, --E
	{  {160,255}, {160,205},{160,155},{160,105}, {160,55},{200,55}, {240,55},{280,55}, {320,55},{200,130}, {240,130},{280,130} }, --F
	{  {200,255}, {160,230},{160,180},{160,130}, {160,80},{200,55}, {240,55},{280,55}, {320,80},{240,255}, {280,255},{320,230},{240,180}, {280,180},{320,180} }, --G
	{  { 5,6}, { 7,8} }, --H
	{  { 5,6}, { 7,8} }, --I
	{  { 5,6}, { 7,8} }, --J
	{  { 5,6}, { 7,8} }, --K
	{  { 5,6}, { 7,8} }, --L
	{  { 5,6}, { 7,8} }, --M
	{  { 5,6}, { 7,8} }, --N
	{  { 5,6}, { 7,8} }, --O
	{  { 5,6}, { 7,8} }, --P
	{  { 5,6}, { 7,8} }, --Q
	{  { 5,6}, { 7,8} }, --R
	{  { 5,6}, { 7,8} }, --S
	{  { 5,6}, { 7,8} }, --T
	{  { 5,6}, { 7,8} }, --U
	{  { 5,6}, { 7,8} }, --V
	{  { 5,6}, { 7,8} }, --W
	{  { 5,6}, { 7,8} }, --X
	{  { 5,6}, { 7,8} }, --Y
	{  { 5,6}, { 7,8} }, --Z
}
local bitxos = {}
local ibitxo = 1
local iletra = 1
local tamany
local ekis = 0
local bitxosgroup =display.newGroup ( )

local function tapBtn(param)
	print("De ABC go to "..param)
	storyboard.gotoScene( param )
end

local function makeBitxo() 
		local bitxo = display.newImageRect("images/bird_blue.png", 32, 50)
		bitxosgroup:insert(bitxo)
		bitxo.x, bitxo.y = 520, math.random(50, 270)
		transition.to(bitxo, { x= letras[iletra][ibitxo][1] , y=letras[iletra][ibitxo][2] })
		ibitxo = ibitxo+1
		bitxos[#bitxos+1] = bitxo
end

local function removeBitxo() 
	for i, bitxo in pairs(bitxos) do
		transition.to(bitxo, { x= -70 , y=y })
		--comentar if si da problemas
		if (bitxo.x == -60) then
			bitxo:removeSelf()
		end
	end
end
	
local function valuesrestart()
	ibitxo = 1
	ekis = 0
end

local function backgroundTouch( event )
	if event.phase == "moved" then
        ekis = (event.x - event.xStart) 

    end
	if (event.phase == "ended") then
		if (ekis > 0) then
			iletra = iletra - 1

        	if (iletra< 1) then
        		iletra = 26
        	end
        	print (iletra)
        	removeBitxo()
    		tamany = table.getn(letras[iletra] )
    		valuesrestart()
			timer.performWithDelay(5, makeBitxo, tamany)
	        else
        	if (ekis <= 0) then
        		iletra = iletra + 1
    			if (iletra >26) then
    			iletra =1
        		end
        		print (iletra)
        		removeBitxo()
        		tamany = table.getn(letras[iletra] )
    			valuesrestart()
				timer.performWithDelay(5, makeBitxo, tamany)
        	end

		end
	end
end

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CREATE SCENE
-- Called when the scene's view does not exist:
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
--print("ABC")
function scene:createScene( event )
		local group = self.view
	
		local background = display.newImageRect("images/background.png", 480, 320)
		background.x = centerX
		background.y = centerY
		bitxosgroup:insert(background)
		background:addEventListener("touch",backgroundTouch)
		makeButtonRect("images/btn_abc.png", 100,80, 60, 270, tapBtn, "scn_nums", bitxosgroup)

	

end


----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ENTER SCENE
-- Called immediately after scene has moved onscreen:
-- (e.g. start timers, load audio, start listeners, etc.)
----------------------------------------------------------------------------------------------------------------------------------------------------------------------

function scene:enterScene( event )
        local group = self.view

		tamany = table.getn(letras[iletra] )
		timer.performWithDelay(5, makeBitxo, tamany)

end


----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- EXIT SCENE
-- Called when scene is about to move offscreen:
-- (e.g. stop timers, remove listeners, unload sounds, etc.)
----------------------------------------------------------------------------------------------------------------------------------------------------------------------

function scene:exitScene( event )
        local group = self.view

		bitxosgroup:removeSelf()
        storyboard.removeScene("scn_abc")	

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

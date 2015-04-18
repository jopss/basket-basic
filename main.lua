local centerX = display.contentCenterX
local centerY = display.contentCenterY
_W = display.contentWidth
_H = display.contentHeight

local physics = require("physics")
physics.start()
--physics.setDrawMode( "hybrid" )

display.setStatusBar( display.HiddenStatusBar )
local background = display.newImage( "imagens/fundo-original.png", centerX, centerY, true )
local chao = display.newRect( _W/2, _H, _W, 10 )
local paredeDireita = display.newRect( _W, _H/2, 10, _W)
local paredeEsquerda = display.newRect( 0, _H/2, 10, _W )
local line = display.newRect( _W/2, 200, _W, 2 )
retry = nil
cesta = nil
bola = nil

line:setFillColor( 0,0,0 )

physics.addBody( chao, "static", { friction=0.5 })
physics.addBody( paredeDireita, "static", { friction=0.5 })
physics.addBody( paredeEsquerda, "static", { friction=0.5 })

local isTap = false

function criarBola(event)
	bola = require("modelos.bola")
	bola = bola:new{}
	bola:show(event.x, event.y)
	bola:inicializa(physics)
	cesta.imagem:toFront( )
end

function criarCesta() 
	cesta = require("modelos.cesta")
	cesta = cesta:new{}
	cesta:show()
	cesta:inicializa(physics)
end

function clickRetry( self, event )
	self:removeSelf()
	bola.imagem:removeSelf()
	cesta.imagem:removeSelf()
	criarCesta()
end

function onLocalCollision( self, event )
    if ( event.phase == "began" ) then
    	if ( event.other.nome == "bola") then
       		isTap =  false
			retry = display.newImage( "imagens/retry.png", centerX, centerY, true )
			retry.tap = clickRetry
			retry:addEventListener( "tap", retry )
   		end
    end
end

function clickCriaBola( event )
	if (isTap or event.y > 200) then
		return 
	end
	isTap = true
	criarBola(event)
end

background:addEventListener( "tap", clickCriaBola )
chao.collision = onLocalCollision
chao:addEventListener( "collision", chao )

criarCesta()
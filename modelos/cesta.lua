cesta = {}
cesta.__index=cesta

function cesta.new(obj)
	return setmetatable( obj, self );
end

function cesta:inicializa(fisica)
	
	local shapeCesta = require("imagens.cesta").physicsData(1.0)
	fisica.addBody(self.imagem, "static", shapeCesta:get("cesta"))	

end

function cesta:show()

	local position = math.random( 100,_W-100 )
	self.imagem = display.newImage( "imagens/cesta_ok.gif", position, _H-95, true )
	self.imagem:toFront()
	self.imagem.nome = "cesta"

end

return cesta
bola = {}
bola.__index=bola

function bola.new(obj)
	return setmetatable( obj, self );
end

function bola:inicializa(fisica)
	fisica.addBody(self.imagem, "dynamic", {radius= 30, density=2.9, friction=0.5, bounce=0.7})
end

function bola:show(x, y)
	self.imagem = display.newImage( "imagens/bola.png", x, y, true )
	self.imagem.nome = "bola"
end

return bola
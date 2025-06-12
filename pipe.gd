extends StaticBody2D

@export var speed: float = 230.0 # Velocidade de movimento do pipe para a esquerda

func _process(delta):
	# Move o pipe para a esquerda
	position.x -= speed * delta

	# Destrói o pipe quando ele sai da tela pela esquerda
	# Ajuste o '-50' se o seu pipe for muito grande e demorar para sumir
	if position.x < -1100: # Exemplo: -200. Tente -100, -150, -250...
		queue_free()# Libera o nó da memória

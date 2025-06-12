extends CharacterBody2D

signal died # Este sinal sera emitido quando o player morrer

@export var gravity: float = 800.0
@export var jump_force: float = -300.0

var _velocity: Vector2 = Vector2.ZERO # Usaremos esta variável para nossa velocidade interna

func _physics_process(delta):
	# Aplicar gravidade
	_velocity.y += gravity * delta

	# Detectar pulo (clique do mouse ou toque)
	if Input.is_action_just_pressed("ui_accept"):
		_velocity.y = jump_force

	# --- PASSE A VELOCIDADE PARA move_and_slide() ---
	velocity = _velocity # Copia nossa velocidade interna para a propriedade do nó.

	var collision = move_and_slide() # move_and_slide() irá usar 'self.velocity'

	# --- Lógica de Morte por Colisão com Obstáculos ---
	if collision:
		print("Player colidiu!")
		# Estes prints são para depuração, você pode removê-los depois
		for i in get_slide_collision_count():
			var collision_data = get_slide_collision(i)
			print("Colidiu com:", collision_data.get_collider().name)
			print("Tipo do colisor:", collision_data.get_collider().get_class())
		
		# --- AÇÃO DE MORTE APÓS COLISÃO ---
		emit_signal("died") # Avisa à cena principal que o player morreu
		_velocity = Vector2.ZERO # Zera a velocidade
		set_physics_process(false) # Para o processamento de física
		# Se tiver animação de morte, adicione aqui: animated_sprite.play("dead") 
	else:
		print("Player não colidiu.")

	# --- Lógica de Morte por Limites da Tela ---
	# Morte por cair abaixo da tela
	if position.y > get_viewport_rect().size.y + 100: # +100 para dar uma margem maior abaixo da tela
		print("MORTE: Caiu para fora da tela!") # Print para depuração
		emit_signal("died")
		_velocity = Vector2.ZERO
		set_physics_process(false)
		# Se tiver animação de morte, adicione aqui: animated_sprite.play("dead") 

	# Morte por sair por cima da tela
	if position.y < -100: # -100 para dar uma margem maior acima da tela
		print("MORTE: Saiu por cima da tela!") # Print para depuração
		emit_signal("died")
		_velocity = Vector2.ZERO
		set_physics_process(false)
		# Se tiver animação de morte, adicione aqui: animated_sprite.play("dead")

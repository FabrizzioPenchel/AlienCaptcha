extends Node2D

@onready var player = $"Player" # Garanta que o nome do seu nó Player é "Player"
@onready var game_over_label = $"CanvasLayer/Label" # Caminho para o Label
@onready var restart_button = $"CanvasLayer/Button" # Caminho para o Button
@onready var pipe_spawner = $"PipeSpawner" # Caminho para o seu Pipe Spawner

func _ready():
	# Esconda a UI de Game Over no início
	game_over_label.visible = false
	restart_button.visible = false

	# Conectar o sinal 'died' do player a uma função neste script
	player.died.connect(_on_player_died)

func _on_player_died():
	print("GAME OVER! Player morreu.")
	# Mostrar a UI de Game Over
	game_over_label.visible = true
	restart_button.visible = true
	

	# Parar o Spawner de criar mais pipes
	pipe_spawner.set_process(false)
	pipe_spawner.timer = 0 # Reinicia o timer para a próxima partida

	# Pausar o jogo inteiro (opcional, mas comum)
	get_tree().paused = true


func _on_restart_button_pressed():
	print(">>> FUNÇÃO REINICIAR CLICADA! <<<")
	print("Reiniciando jogo...")
	get_tree().paused = false # Despausa o jogo
	get_tree().reload_current_scene() # Recarrega a cena atual


func _on_button_pressed() -> void:
	pass # Replace with function body.

extends Control

# Referências aos botões na cena do menu principal
@onready var play_button = $"PlayButton" # Ajuste o nome se necessário (ex: $"Button")

# Referência ao botão do Easter Egg
@onready var easter_egg_button = $"EasterEgg" # Ajuste o nome se necessário

# Contador para o Easter Egg
var easter_egg_click_count = 0 


func _ready():
	# Conecta o sinal 'pressed' do botão Play
	play_button.pressed.connect(_on_play_button_pressed)
	
	# Conecta o botão do Easter Egg
	easter_egg_button.pressed.connect(_on_easter_egg_button_pressed)


# Função chamada quando o botão "PLAY" é pressionado
# Esta função deve apenas iniciar o jogo, sem lógica de Easter Egg aqui.
func _on_play_button_pressed():
	print("Iniciando o jogo...")
	get_tree().change_scene_to_file("res://Main..tscn") # Muda para a cena principal

# --- FUNÇÃO DO BOTÃO DEDICADO AO EASTER EGG ---
func _on_easter_egg_button_pressed(): # Esta é a função para o botão clicado 5 vezes
	easter_egg_click_count += 1
	print("Cliques no Botão Easter Egg: ", easter_egg_click_count) # Para depuração

	if easter_egg_click_count >= 5:
		print("Carregando cena do Easter Egg!")
		get_tree().change_scene_to_file("res://easter_egg.tscn") # Carrega a cena do Easter Egg

		# OPCIONAL: Se quiser resetar o contador depois de abrir o Easter Egg
		easter_egg_click_count = 0 

# A função _on_sair_button_pressed() não está mais presente no script, pois não há botão "Sair" no menu.

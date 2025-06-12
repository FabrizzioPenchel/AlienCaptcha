extends Control

# Sinais personalizados (opcional, mas bom para comunicar ao menu que foi fechado)
signal closed_easter_egg

# Referências aos botões
@onready var back_button = $"Voltar" # Use o nome exato do seu botão "Voltar" (ótimo nome!)
# @onready var instagram_button = $"InstagramButton" # Se tiver botão para Instagram

func _ready():
	# Conecta o botão "Voltar"
	back_button.pressed.connect(_on_Voltar_pressed) 

	# Conecta botões de redes sociais (se houver)
	# if instagram_button:
	#   instagram_button.pressed.connect(_on_instagram_button_pressed)

func _on_Voltar_pressed():
	print("Voltando ao Menu Principal...") # Mensagem mais clara
	# emit_signal("closed_easter_egg") # Opcional: Se você usa este sinal para algo no menu.
	
	# --- ESTA É A LINHA CRUCIAL ---
	get_tree().change_scene_to_file("res://menu_principal.tscn") # Carrega a cena do menu principal
	
	# queue_free() # Geralmente não é necessário aqui, pois change_scene_to_file() já remove a cena atual
				  # O Godot automaticamente libera a cena anterior ao carregar uma nova com change_scene_to_file().

# Exemplo de função para botão de rede social
# func _on_instagram_button_pressed():
#   OS.shell_open("https://www.instagram.com/seunome/") # Abre a URL no navegador
#   print("Abrindo Instagram.")

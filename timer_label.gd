extends Label

var time_survived = 0.0
var game_over = false

func _process(delta):
	if game_over:
		return

	time_survived += delta
	self.text = "Tempo: " + str(time_survived).pad_decimals(2)

	if time_survived >= 80.0:
		game_over = true
		self.text = "✅ Você é humano!"
		get_tree().paused = true  # para o jogo

extends TextEdit

func _process(delta):
	self.set_text("puntos: " + str(global.puntaje_quiz1))

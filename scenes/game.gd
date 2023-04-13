extends Node

func _ready():
	G.game = self
	G.root_game = self
	G.gui =$gui
	G.load_level()
	G.pause(0)

func _process(delta):
	if Input.is_action_just_pressed('ui_pause'):
		G.pause()
		G.sub('menu_pause')
	elif Input.is_action_just_pressed('ui_pack'):
		G.pause()
		G.sub('pack')

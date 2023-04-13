extends Node

const skelet = preload("res://enemy/skelet2.tscn")

var level = 1
var root_level 
var root_game
var gui = null
var root_gui
var player = null
var game = null
var camera
var score = 0
var need_score = 0
var hp = 5

var colors={
	'unselected': '#814d639d',
	'selected' : '#2744a1'
}

func _ready():
	OS.center_window()

func to(scene):
	get_tree().change_scene("res://scenes/"+scene+".tscn")


func load_level():
	root_level = load("res://levels/level_"+str(level)+"/level.tscn").instance()
	root_game.get_node('level').add_child(root_level)

func pause(s=1):
	get_tree().paused = bool(s)
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED if !s else Input.MOUSE_MODE_VISIBLE)

func sub(s):
	var n = load("res://scenes/"+s+".tscn").instance()
	game.add_child(n)

func exit():
	get_tree().quit()

func add(o):
	root_level.add_child(o)

func reload():
	get_tree().reload_current_scene()
	score = 0
	need_score = 0

func message(msg):
	root_gui.message(msg)

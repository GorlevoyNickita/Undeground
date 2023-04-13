extends Control

var selected = null
var selected_key = ''

func _ready():
	for _i in P.get_all():
		var item = P.get(_i)
		if item.icon:
			var i = preload("res://sub_scene/pack_item.tscn").instance()
			i.get_node('icon').texture = load("res://pack_icons/" + item.icon +".png")
			i.connect("gui_input",self,'on_input_item',[i,_i])
			$pack/grid.add_child(i)

func _process(delta):
	if Input.is_action_just_pressed('ui_pause'):
		_on_exit_pressed()
	elif Input.is_action_just_pressed('ui_pack'):
		_on_exit_pressed()

func _on_exit_pressed():
	G.pause(0)
	queue_free()


func on_input_item(e,item,key):
	var i = P.get(key)
	if e is InputEventMouseMotion:
		if !selected:
			$pack/name.text= i.label
			$pack/desc.text = i.desc + '\nX: '+ str(i.count)
	elif e is InputEventMouseButton:
		if e.pressed:
			if selected:
				selected.color = G.colors.unselected
			item.color = G.colors.selected
			$pack/name.text= i.label
			$pack/desc.text = i.desc + '\nX: '+ str(i.count)
			selected = item
			selected_key = key
			$pack/buttons.show()


#func _on_get_pressed():
#	G.player.pack_item =selected_key
#	G.gui.upd_items()
#	_on_exit_pressed()

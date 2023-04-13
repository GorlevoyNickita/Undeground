extends Control


func _ready():
	G.gui = self
	G.root_gui= self

func message(msg):
	$message/text.text = msg
	$message/show.play("show")

func  alert(t=''):
	if $alert/label.text != t:
		$alert/label.text = t
	$alert.visible = bool(t)

func upd_items():
	var icon = ''
	if G.player.pack_item:
		var i = P.get(G.player.pack_item)
		if i.icon:
			icon = i.icon

	if icon:
		$pack_item.texture = load("res://pack_icons/" + icon + ".png")
		$pack_item.show()
	else:
		$pack_item.hide()

func on_bullet():
	$AnimationPlayer.play("on_bullet")
	$top/hp_count.text = str(G.hp - 1)


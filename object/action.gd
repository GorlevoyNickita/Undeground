extends Area

var type = 'action'

export var label = ''
export var on_parent = ''
export var on_remove = false
export var on_remove_parent = false

export var pack_item={
	'key': '',
	'label': '',
	'desc': '',
	'count': 1,
	'icon':''
}

func action():
	if pack_item.key:
		P.add(pack_item.key, pack_item.label, pack_item.desc, pack_item.count, pack_item.icon)
	
	if on_parent:
		get_parent().call(on_parent)

	if on_remove_parent:
		get_parent().queue_free()

	else:
		if on_remove:
			queue_free()

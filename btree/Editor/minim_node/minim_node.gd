tool
extends GraphNode

const type = 99
var data

func _ready():
	connect("close_request", self, "close_request")
	connect("resize_request", self, "resize_request")
	$expand.connect("pressed", self, "pressed")
	return

func search_token():
	return $slot0/label.text

func _enter_tree():
	title = name
	return

func get_data():
	var ret_data = {
		"offset":offset,
		"size":rect_size,
		"data":data,
		"label": $slot0/label.text
	}
	return ret_data

func set_data(ndata):
	offset = ndata.offset
	rect_size = ndata.size
	data = ndata.data
	if  ndata.has("label"):
		$slot0/label.text = ndata.label
	else:
		ndata.label = ""
	return

func pressed():
	get_parent().maximize_node(self)
	return

func close_request():
	get_parent().child_delete(self)
	return

func resize_request(min_size):
	rect_size = min_size
	return
extends Button

var position
var icons
var mine =false
var flag =false
var icon_index
var left_clickable = true
var right_clickable = false
func _ready():
	rect_size.x=30
	rect_size.y=30
	icons =[preload("res://assets//favicon.png"),preload("res://assets//flag_icon.png")]
	icon_index = 0
	self.icon=icons[icon_index]
func height():
	return rect_size.y
func width():
	return rect_size.x
	
func disable_input():
	self.right_clickable=false
	self.left_clickable=false
	
func process_input(e):
	if e is InputEventMouseButton and e.pressed:
		if e.button_index == BUTTON_LEFT and left_clickable:
			get_parent().left_click(self,e)
		if e.button_index == BUTTON_RIGHT and right_clickable:
			icon_index = (icon_index + 1) % 2
			left_clickable = icon_index == 0
			flag = not left_clickable
			if flag:
				get_parent().reduce_mine_count()
			else:
				get_parent().increase_mine_count()
			self.icon = icons[icon_index]

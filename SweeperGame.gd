extends Node2D

var size 
var bombs
var field
var first_click

func _ready():
	size = Globals.board_size()
	bombs= Globals.bomb_count()
	field=Util.arr(int(size.x))
	first_click = true
	for i in int(size.x):
		field[i]=Util.arr(int(size.y))
		for j in int(size.y):
			var newSquare = $SquarePrototype.duplicate()
			newSquare.set_position(Vector2(100+i*$SquarePrototype.width(),100+j*$SquarePrototype.height()))
			newSquare.visible = true
			newSquare.position=[i,j]
			add_child(newSquare)
			field[i][j]=newSquare
			newSquare.connect("gui_input",newSquare,"inp")

func left_click(square,e):
	place_mines_on_first_click(square.position)
#
	square.right_clickable=false
	square.left_clickable=false
	if square.mine:
		print("you lose")
		back()
	else:
		square.icon = null
		var count = count_adjacent_mines(square.position)
		if count == 0 :
			square.text = " "
			click_neighbours(square.position,e)
		else:
			square.text = str(count)

func place_mines_on_first_click(position):
	if first_click:
		first_click = false
		put_mines(position)
		
func put_mines(exclude):
	var coords=[]
	for i in int(size.x):
		for j in int(size.y):
			coords.append([i,j])
			
	coords.erase(exclude)
	
	var temp = null 
	for coord in neigbours(exclude):
		coords.erase(coord)
		temp=coord
	
	for coord in neigbours(temp):
		coords.erase(coord)
		
	while(coords.size()>bombs):
		coords.remove(randi() % coords.size())
	for point in coords:
		field[point[0]][point[1]].mine=true
		
func neigbours(pos):
	var rv = []
	for point in Util.around(pos):
		if(on_board(point)):
			rv.append(point)
	return rv
	
func on_board(point):
	return point[0]>=0 and point[0] < size.x and point[1]>=0 and point[1]<size.y

func count_adjacent_mines(pos):
	var count = 0
	for point in neigbours(pos):
		if field[point[0]][point[1]].mine:
			count += 1
	return count
func click_neighbours(pos,e):
#	print("neighboers" + str(pos))
	for neighbour in neigbours(pos):
		field[neighbour[0]][neighbour[1]].inp(e)
func back():
	Util.goto_scene("MineSweeperMenu.tscn")
func reduce_mine_count():
	bombs = bombs - 1
	$count.text = str(bombs)
func increase_mine_count():
	bombs = bombs + 1
	$count.text = str(bombs)


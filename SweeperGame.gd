extends Node2D

var size 
var bombs
var flags
var field
var first_click
func _ready():
	size = Globals.board_size()
	bombs= Globals.bomb_count()
	flags=0
	field=Util.arr(size[0])
	first_click = true
	for i in size[0]:
		field[i]=Util.arr(size[1])
		for j in size[1]:
			var newSquare = $SquarePrototype.duplicate()
			newSquare.set_position(Vector2(100+i*$SquarePrototype.width(),100+j*$SquarePrototype.height()))
			newSquare.visible = true
			newSquare.position=[i,j]
			add_child(newSquare)
			field[i][j]=newSquare
			newSquare.connect("gui_input",newSquare,"inp")
#	put_mines()
func put_mines(exclude):
	
	var coords=[]
	for i in size[0]:
		for j in size[1]:
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
#	print(pos)
	var x = pos[0]
	var y = pos[1]
	
	var all_neigbours = [[x-1,y-1],[x-1,y],[x-1,y+1],[x,y+1],[x+1,y+1],[x+1,y],[x+1,y-1],[x,y-1]]

	var rv = []
	for point in all_neigbours:
		if(point[0]>=0 and point[0] < size[0] and point[1]>=0 and point[1]<size[1]):
			rv.append(point)
#	print(rv)
	return rv
func adjacent_mines(pos):
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


extends Resource

#
# T/B | L/R | Enum
#  0  |  0  | TOP_LEFT
#  0  |  1  | TOP_RIGHT
#  1  |  0  | BOTTOM_LEFT
#  1  |  1  | BOTTOM_RIGHT
#
enum Anchors { TOP_LEFT, TOP_RIGHT, BOTTOM_LEFT, BOTTOM_RIGHT }

@export_category("Layout")
@export var horizontal_margin = 32
@export var vertical_margin = 32
@export_range(0, 2) var scale: float = 1.0
@export var anchor: Anchors = 2

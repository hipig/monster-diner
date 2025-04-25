extends Item
class_name FoodItem

@export var price_range: Vector2i = Vector2i(5, 10)
@export var stock_range: Vector2i = Vector2i(1, 5)
@export var related_rates: Array[MonsterLoader.RateType]

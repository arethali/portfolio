extends Control

@export var skill : String = "SKILL"
@export_enum("1", "2", "3", "4", "5") var level : String = "1"
@export var separation : int = 80


@onready var skill_level = %"Skill Level"
@onready var skill_name = %"Skill Name"

func _ready():
	match level:
		"1":
			skill_level.texture = load("res://Assets/UI/Skills/Skill1_updated.png")
		"2":
			skill_level.texture = load("res://Assets/UI/Skills/Skill2_updated.png")
		"3":
			skill_level.texture = load("res://Assets/UI/Skills/Skill3_updated.png")
		"4":
			skill_level.texture = load("res://Assets/UI/Skills/Skill4_updated.png")
		"5":
			skill_level.texture = load("res://Assets/UI/Skills/Skill5_updated.png")
	skill_name.text = skill
	add_theme_constant_override("separation", separation)
	#await get_tree().process_frame
	#await get_tree().process_frame
	#size.x = 

extends VBoxContainer

@export_enum("Experience", "Education") var type : String = ""
@export var role : String = "ROLE"
@export var company : String = "COMPANY"
@export var time : String = "TIME-TIME"
@export var location : String = "LOCATION"
@export var school : String = "SCHOOL"
@export_multiline var major : String = "MAJOR"
@export var classof : String = "GRADUATION TIME"
@export var gpa : String = "GPA"
@export_multiline var details : String 
@export var separation : int = 8
@onready var role_label = %Role
@onready var time_label = %Time
@onready var details_label = %Details

func _ready():
	match type:
		"Experience":
			role_label.text = "[b]" + role + " | " + company + "[/b]"
			#time_label.text = "[b]" + time + " | " + location + "[/b]"
			time_label.text = (time + " | " + location).to_upper()
			details_label.text = details
			add_theme_constant_override("separation", separation)
		"Education":
			role_label.text = "[b]" + school + "[/b]"
			#time_label.text = "[b]" + time + " | " + location + "[/b]"
			time_label.text = (time + " | " + location).to_upper()
			details_label.text = major + "\n[color=#858d5e]GPA: " + gpa +"[/color]"
			add_theme_constant_override("separation", separation)

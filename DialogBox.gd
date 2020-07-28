extends Control

var dialog = [
	'Duga duga niezłe siupy!',
	'Ale proszę pana, Harry mi ukradł książki',
	'i jeszcze mi ukradł łóżko i teraz muszę spać w szufladzie.'
]

var dialog_index = 0
var finished = false

func _ready():
	load_dialog()

func _process(delta):
	$"next-indicator".visible = finished
	if Input.is_action_just_pressed("ui_accept"):
		load_dialog()

func load_dialog():
	# That's just for displaying dialog one line at a time
	# with this typewriter/yakuza effect
	
	if dialog_index < dialog.size():
		finished = false
		$RichTextLabel.bbcode_text = dialog[dialog_index]
		$RichTextLabel.percent_visible = 0
		$Tween.interpolate_property(
			$RichTextLabel, "percent_visible", 0, 1, 1,
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		$Tween.start()
	else:
		queue_free()
	dialog_index += 1




func _on_Tween_tween_completed(object, key):
	finished = true

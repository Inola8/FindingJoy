class_name Quest

enum State { available, started, completed }

var data: QuestData
var state := State.available

# Gets created when an instance is made in QuestEvents (with .new)
func _init(data_ref: QuestData):
	data = data_ref

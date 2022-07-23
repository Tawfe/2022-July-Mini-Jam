if global.door_opened _scalable = true

if _scalable
{
	y--
	if y - y_prev <= -20 {_scalable = false global.door_opened = false}
	show_debug_message("ME")
}


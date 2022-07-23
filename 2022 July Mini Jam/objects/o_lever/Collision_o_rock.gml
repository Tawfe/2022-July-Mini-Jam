if image_index == 0
{
	image_index = 1
}
else if image_index == 1
{
	image_index = 0
	global.vinegate_open = true
}

instance_destroy(other)
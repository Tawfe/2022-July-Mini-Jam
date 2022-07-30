if keyboard_check(ord("T")) && !o_selection_wheel.release_trigger
_alpha = lerp(_alpha,1,0.1)
else _alpha = lerp(_alpha,0,0.1)
if o_selection_wheel.release_trigger && _alpha < 0.5 instance_destroy()
if choose_trigger && instance_exists(self)
{
	choose_trigger = false
	instance_destroy(o_cp_parent)
}
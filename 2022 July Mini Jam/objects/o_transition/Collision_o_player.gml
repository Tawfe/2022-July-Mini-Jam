//setting the target value in the object's creation code	

if !_levelcomplete_fxcontrol
{
	_levelcomplete_fxcontrol = true
	audio_play_sound(Level_complete,10,false)
}
TransitionStart(target, sqFadeOut, sqFadeIn)
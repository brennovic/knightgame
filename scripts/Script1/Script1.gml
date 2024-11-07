// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function create_light(_x,_y,_color,_intensity, _xscale, _yscale,_alvo){
	var _luz = instance_create_depth(_x,_y,0,obj_luz_2)
_luz.image_blend = _color
_luz.image_xscale = _xscale
_luz.image_yscale = _yscale
_luz.image_alpha = _intensity
_luz.alvo = _alvo
}
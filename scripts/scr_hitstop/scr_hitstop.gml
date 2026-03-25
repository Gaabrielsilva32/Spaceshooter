//var de controle do hitstop
global.hitstop = false;

//metodo pra chamar o hitstop
function chama_hitstop(_tempo)
{
	//o hitstop fica true
	global.hitstop = true;
	
	//var que diz se o obj existe na room
	var _exist = instance_exists(obj_hitstop_maneger);
	
	//verificando se o obj está na room
	//se o obj não existir
	//eu crio ele
	//uso o depth, pois ele não precisa de uma layer especifica
	if (!_exist) instance_create_depth(0, 0, 0, obj_hitstop_maneger);
	
	//dizendo que o tempo que o hitstop terá
	obj_hitstop_maneger.timer_hitstop = _tempo;
}
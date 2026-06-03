

function cria_particulas(_vida_min = 30, _vida_max = 60, _x = 0, _y = 0, _velh = 0, _velv = 0)
{
	//se o obj não existe, eu crio ele
	if (!instance_exists(obj_part_manager)) instance_create_depth(0, 0, 0, obj_part_manager);
	
	//a partir daqui o obj existe
	
	//com o obj da particula
	with (obj_part_manager)
	{
		//qnt de particulas
		var _qtd	= random_range(10, 20);
		var _vel	= abs(_velh) + abs(_velv);
		var _dir	= point_direction(0, 0, _velh, _velv)
		
	
		
		repeat(_qtd)
		{
			
			//cria a instancia do obj
			var _part = instance_create_layer(_x, _y, "particulas", obj_particula_tiro2);
			
			//dando uma variada na direção
			var _dir_part = _dir + random_range(-30, 30);
			var _tam = random_range(.2, .5);
			
			
			//descobrindo a velocidade necesaria para ir na direção correta
			_part.velh_original = lengthdir_x(_vel, _dir_part);
			_part.velv_original = lengthdir_y(_vel, _dir_part);
			
			_part.image_xscale	= _tam;
			_part.image_yscale	= _tam;
			_part.image_angle	= _dir_part;
			
			var _vida = random_range(60, 120);
			
			_part.vida_max		= _vida;
			_part.vida_atual	= _vida;
		}
	}
}
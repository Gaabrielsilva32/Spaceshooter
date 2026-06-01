

function cria_particulas(_x = 0, _y = 0)
{
	//se o obj não existe, eu crio ele
	if (!instance_exists(obj_part_manager)) instance_create_depth(0, 0, 0, obj_part_manager);
	
	//a partir daqui o obj existe
	
	//com o obj da particula
	with (obj_part_manager)
	{
		//qnt de particulas
		
		var _qtd = random_range(10, 20);
		
		repeat(_qtd)
		{
			//cria a instancia do obj
			instance_create_layer(_x, _y, "particulas", obj_particula_tiro2);
		}
	}
	
}
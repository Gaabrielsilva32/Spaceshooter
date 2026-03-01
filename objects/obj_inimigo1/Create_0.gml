//mantendo as seeds aleatórias
randomize();

#region variaveis

//tempo de espera do tiro
espera_tiro = random_range(1, 2) * game_get_speed(gamespeed_fps);

//timer do tiro
timer_tiro = 0;

//var para verificar se estou em uma sequencia
na_sequencia = in_sequence;

//iniciando o ef mola
inicio_ef_mola();

#endregion

#region métodos

atirar = function()
{
	//se o timer do tiro for igual a 0
	if (timer_tiro <= 0)
	{
		//crio a instância do tiro
		instance_create_layer(x, y , "tiro", obj_tiro_inimigo1);
		
		ef_mola(0.9, 1.3);
		
		//som do laser
		efeito_som(sfx_laser2);
		
		//e reseto o timer
		timer_tiro = espera_tiro;
	}
}

morrendo = function()
{
	//particula e destura a instancia
	se_destrua(obj_part_expl_inimigo)
	
	efeito_som(sfx_explosion);
	
	//chance de dropar o power up
	_chance = random(100);
	
	//se chance for maior que 60
	//(tenho 20% de chance de aparecer o power up)
	if (_chance > 80)
	{
		instance_create_layer(x, y, layer, obj_power_up);
	}
	
	//screenshake
	screenshake(10);
}
#endregion

//chamando o método de atirar
//atirar();
alarm[0] = 120;
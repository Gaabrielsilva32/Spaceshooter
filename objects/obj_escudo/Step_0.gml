//se a animação reversa acabou
if (image_index < 0.2 && image_speed < 0)
{
	instance_destroy();
}

//x = obj_player.x
//y = obj_player.y

//diminuindo o timer 
timer_escudo--;

if (timer_escudo <= 0)
{
	//a animação volta
	//fica de trás pra frente
	image_speed = -.3
	
	//se eu não toquei o som do escudo
	if (!som_escudo)
	{
		//eu toco
		efeito_som(sfx_shieldDown, 0);
		
		//eu aviso que toquei
		som_escudo = true;
	}
	
}
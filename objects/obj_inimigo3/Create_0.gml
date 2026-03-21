#region variáveis
//variável das vidas
vida = 15;

//velocidade
vel = 2;

//variável que controla o meu estado
estado = "chegando";

//timer carregando
timer_carregando = game_get_speed(gamespeed_fps) * 2;

//contador de tiros
contador = 0

inicio_ef_mola();

inicia_ef_branco();



#endregion

#region métodos

//maquina de estados
maquina_de_estados = function()
{
	//switch - variavel que eu tô verificando
	switch(estado)
	{
		//primeiro caso
		case "chegando": 
		{
			//enquanto o y dele for menor que 160
			if (y < 160)
			{
				vspeed = vel;
			}
			//senão, show message: "cheguei"
			else
			{
				//mudando para o estado carregando
				estado = "carregando";
			}
		}
		
		//terminei o case, avisando para ele parar de ler
		break;
		
		case "carregando": 
		{
			//vou parar 
			vspeed = 0;
			
			//ele vai esperar 3 segundos
			timer_carregando--;
			
			//depois de 3 segundo vai pro estado de atirar
			if (timer_carregando <= 0)
			{
				//mundando de estado
				estado = choose("atirando", "atirando 2");
				
				timer_carregando = 60;
			}
		}
		
		//terminei o case, avisando para ele parar de ler
		break;
		
		case "atirando": 
		{
			//achando a dir do player
			//verificando se o player existe
			if (instance_exists(obj_player))
			{
			var _dir = point_direction(x, y, obj_player.x, obj_player.y);
			
			//criando o tiro
			var _tiro = instance_create_layer(x, y, "tiro", obj_tiro_inimigo3_a);
			
			//salvando a vel padrão do tiro
			var _vel = 2;
			
			
			//descobrindo a vel que preciso
			//pro tiro sair no angulo certo
			
			//descobrindo a do eixo x
			var _velh = lengthdir_x(_vel, _dir)
			
			//descobrindo a do eixo y
			var _velv = lengthdir_y(_vel, _dir);
			
			//aplicando a vel no tiro
			//velocidade h do tiro
			_tiro.velh = _velh;
			
			//velocidade v do tiro
			_tiro.velv = _velv;
			
			//aplicando a dir 
			_tiro.direction = _dir
			
			//mudando o ângulo do tiro
			_tiro.image_angle = _dir + 90;
			
			//som laser
			efeito_som(sfx_laser2);
			
			contador += 1;
			
			//se ainda não passou do 3
			if (contador < 3)
			{
				estado = "carregando";
			}
			else
			{
				estado = "fugindo";
			}
			
			}
		}
		
		//terminei o case, avisando para ele parar de ler
		break;
		
		case "atirando 2":
		{
			//ângulo
			var _ang = 255;
			
			//repete o tiro 3 vezes
			repeat(3)
			{
				var _tiro = instance_create_layer(x, y, "tiro", obj_tiro_inimigo3_b);
			
				//salvando a vel do tiro
				var _vel = _tiro.vel;
			
				//descobrindo a vel certa pra cada angulo 
				//angulo x
				var _velh = lengthdir_x(_vel, _ang);
			
				//descobrindo a vel certa pro angulo y
				var _velv = lengthdir_y(_vel, _ang);
			
			
				//passando a vel certa 
				_tiro.velh = _velh;
				_tiro.velv = _velv;
			
				//direção
				_tiro.direction = _ang;
			
				//adiconando 15 ao ângulo a cada repetição
				_ang += 15;
			
			}
			
			//som laser
			efeito_som(sfx_laser2);
			
			contador += 1;
				
			//se ainda não passou do 3
			if (contador < 3)
			{
				estado = "carregando";
			}
			else
			{
				estado = "fugindo";
			}
		}
		
		break;
		
		case "fugindo":
		{
			vspeed = - 1;
			
			if (y < -32) instance_destroy();
		}
	
	}	
}

//auto-explicativa
morrendo = function()
{
	//perder vida
	vida--;
	
	timer_ef_branco(3);
	
	ef_mola(1.3, 0.9);
	
	
	//se ele ficou sem vida 
	if (vida < 1)
	{
		//ele se destroi
		instance_destroy();
		
		//som da explosão
		efeito_som(sfx_explosion)
		
		
		//chance de dropar o power up
		_chance = random(100);
	
		//se chance for maior que 60
		//(tenho 30% de chance de aparecer o power up)
		if (_chance > 70)
		{
			instance_create_layer(x, y, layer, obj_power_up);
		}
		
		//screenshake
		screenshake(20);
	
		//e cria a particula de explosão dele
		instance_create_layer(x, y, "particulas", obj_part_expl_inimigo);
	}
	
}
#endregion
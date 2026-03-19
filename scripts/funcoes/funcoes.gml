#region variáveis globais
global.debug = false;

//a room que vou após a transição
global.rm_destino = rm_inicio;

//var de controle - transição
global.transicao = false;

#endregion

#region funções 

function se_destrua(_particula = obj_particula_tiro)
{
	//eu me destruo
	instance_destroy();

	//chamo a explosão do inimigo
	instance_create_layer(x, y, layer, _particula);
	
	//screenchake
}

function screenshake(_treme = 0)
{
	//verificando se o obj_screenshake existe
	if (instance_exists(obj_screenshake))
	{
		//com with eu rodo o código dentro do obj
		with (obj_screenshake)
		{
			if (_treme > treme)
			{
				treme = _treme;
			}
		}
	}
	
}

//inicia o efeito mola
function inicio_ef_mola()
{
	//minha escala
	xscale = 1;
	yscale = 1;
}

function ef_mola(_xscale = 1, _yscale = 1)
{
	xscale = _xscale
	yscale = _yscale
}

function fim_ef_mola(_qt = 0.1)
{
	///voltando a escala normal
	xscale = lerp(xscale, 1, 0.1);
	yscale = lerp(yscale, 1, 0.1);
}

function desenhando_ef_mola()
{
	//me desenhando
	draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, image_angle, image_blend, image_alpha);
}

function inicia_ef_branco()
{
	tomei_dano = 0;
}

function timer_ef_branco(_tempo = 1)
{
	tomei_dano = _tempo;
}

function contador_ef_branco()
{
	if (tomei_dano > 0) tomei_dano--;
}

function desenha_efeito_branco(_funcao_desenho = draw_self)
{
	if (tomei_dano)
	{
		//efeito branco 
		shader_set(sh_branco);
		
		//faz a função escolida
		_funcao_desenho();
		
		//reseta o shader
		shader_reset();
	}
	else
	{
		_funcao_desenho();
	}
}

//funcão efeito explosão
function efeito_som(_sfx = sfx_explosion, _variacao = .1)
{	
	//var pra variar o valor do pitch
	var _pitch = random_range(1 + _variacao, 1 - _variacao);
	
	audio_play_sound(_sfx, 0, 0, , , _pitch);
}
#endregion


//muda de room de acordo com a transição
function muda_room_transicao()
{
	//a room que eu vou
	//é a minha rm destino
	room_goto(global.rm_destino)
}

function transicao_false()
{
	global.transicao = false;
}


//faz o power up sumir dps de um tempo
function power_up_sumir()
{
	
	//diminuindo o timer gradualmente
	timer--;
	
	//se o timer acabar
	if (timer <= 0)
	{
		//me destruo
		instance_destroy();
		
		//criando a particula do tiro
		var _part = instance_create_layer(x, y, "tiro", obj_particula_tiro);

		//personalizando a part
		_part.image_angle = random(359);

		//para de tocar o som do power up sumindo,
		//pra evitar que um som toque por cima do outro
		audio_stop_sound(sfx_twoTone);

		//tocando o som quando o player pegar o power up sumindo
		audio_play_sound(sfx_twoTone, 1, 0);
	}
	
}
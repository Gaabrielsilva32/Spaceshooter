//parando os sons
audio_stop_all();

//tocando musica
audio_play_sound(musica, 0, 1);

#region variáveis
//velocidade do player
vel = 2;

//tempo de espera do tiro
espera_tiro = 10;

//timer do tiro
timer_tiro = 0;

//criando a var do livel do tiro
level_tiro = 1

//minhas vidas
vidas = 3;

//meus escudos
escudos = 3;

//tá escrito
meu_escudo = noone;

//espera da invencibilidade
espera_invenci = 60;

//timer de invencibilidade
timer_invenci = 0;

inicia_ef_branco();

//iniciando o efeito mola
inicio_ef_mola();

#endregion

#region funções

//criando a movimentação do player
//função de controle do player
function controle_player()
{
	//pegando as teclas do player (wasd)
	//salvando em variáveis
	var _cima, _baixo, _esq, _dire, _atirar;
	
	_cima	= keyboard_check(ord("W")) or keyboard_check(vk_up);
	_baixo	= keyboard_check(ord("S"))or keyboard_check(vk_down);
	_dire	= keyboard_check(ord("D"))or keyboard_check(vk_right);
	_esq	= keyboard_check(ord("A"))or keyboard_check(vk_left);
	
	_atirar = keyboard_check(vk_space) or mouse_check_button(1);
	
	//se eu apertar E, perco 1 escudo
	if (keyboard_check_pressed(ord("E")))
	{
		usa_escudo();
	}
	
	tenho_escudo();
	
	//fazendo a movimentação
	//velocidade horizontal
	velh =(_dire - _esq)* vel;
	
	//limitando o player dentro da room
	//verificando se o x está fora do limite da room
	//if (x <= 24) x = 24 
	//else if (x >= 270) x = 270
	x = clamp(x, 21, 266);
	
	//velocidade vertical
	velv = (_baixo - _cima)* vel;
	
	//limitando o player dentro da room
	//verificando se o y está fora do limite da room
	//if (y <= 19) y = 20;
	//else if (y >= 492) y = 492;
	y = clamp(y, 19, 493)
	
	//aplicando as velocidades
	x += velh;
	y += velv;
	
	//zerando o timer do tiro gradualmente
	timer_tiro --;
	
	//zerando o timer da invencibilidade gradualmente
	timer_invenci--;
	
	//se eu apertar o botão de atirar e o timer do tiro estiver em 0
	if (_atirar && timer_tiro <= 0)
	{
		
		ef_mola(0.9, 1.3);
		
		//chamando o método de tiro
		if (level_tiro == 1) tiro_1();
		else if (level_tiro == 2) tiro_2();
		else if (level_tiro == 3) tiro_3();
		
		//parando som do tiro
		audio_stop_sound(sfx_laser1);
		
		//tocando o som do tiro
		efeito_som(sfx_laser1);
		
		//o timer recebe o valor da espera do tiro
		//ex: se tava 0 e a espera é 10, o timer vira 10
		timer_tiro = espera_tiro;
		
	}
	
	
}

//método do tiro 1
function tiro_1()
{
	//crio uma instancia do tiro na minha posição
	//e armazenado isso na minha var tiro
	var _tiro = instance_create_layer(x, y, "tiro", obj_tiro_player);
	
	//definindo a vel dos tiros
	//_tiro.vspeed -= 10;
}

//criando método do tiro 2
function tiro_2()
{
	//criando o primeiro tiro
	var _tiro = instance_create_layer(x - 10, y, "tiro", obj_tiro_player);
	
	//criando o segundo tiro
	var _tiro2 = instance_create_layer(x + 10, y, "tiro", obj_tiro_player);
		
	//definido a vel dos tiros
	//_tiro.vspeed -= 10;
	//_tiro2.vspeed -= 10;
}

function tiro_3()
{
	tiro_1();
	tiro_2();
}

//método pra ganhar level do tiro
function ganha_level_tiro()
{
	//incrementando +1 ao tiro
	level_tiro++;
	
	//limitando o level tiro
	level_tiro = clamp(level_tiro, 1, 3)
	
}

function desenha_icone(_icone = spr_gui_vida, _quant = vidas, _x = 0, _y = 0)
{

	//desenhando a spr da vida na tela
	//usando o laço de repetição repeat
	repeat(_quant)
	{
		draw_sprite_ext(_icone, 1, _x, _y, 2, 2, 0, c_white, .5);
		_x += 50
	}
}


//método de perder vida
function perde_vida()
{
	//se o timer é maior do que 0 
	//sai da função
	if (timer_invenci > 0) return;
	
	tomei_dano = 3;
	
	ef_mola(1.3, 0.9);
	
	//se vidas for maior do que 1
	if (vidas > 1)
	{
		//perco vida
		vidas--;
		
		timer_ef_branco(3);
		
		//chamando a função de tremer a tela 
		// e definindo o padrão como 20
		screenshake(10);
		
		//som da explosão
		efeito_som(sfx_explosion);
		
		//reseto o timer
		timer_invenci = espera_invenci;
	}
	else //ou seja, se for menor que 1
	{
		instance_destroy();
		
		
		//som da explosão
	//	efeito_som(sfx_explosion);
		efeito_som(sfx_explosion);
		
		//crio a particula
		instance_create_layer(x - 80, y - 80, "particulas", obj_part_explosao_player);
		
		//idem
		screenshake(30);
		
		//toca a transição 2
		layer_sequence_create("sq_transicao", room_width / 2, room_height / 2, sq_transicao1);
		
		global.transicao = true;
	}
}

//método de perder escudo
function usa_escudo()
{
	//se vidas for maior ou igual a do que 0
	//e o meu escudo for igual a noone
	if (escudos > 0 && meu_escudo == noone)
	{
		escudos--;
		
		efeito_som(sfx_shieldUp, 0);
		
		//guardando o escudo criado em Meu escudo
		meu_escudo = instance_create_layer(x, y, "escudo", obj_escudo);
	}
}

tenho_escudo = function()
{
	//se tenho escudo ele me segue
	//se a instance do escudo exite
	if (instance_exists(meu_escudo))
	{
		//ela me segue
		meu_escudo.x = x;
		meu_escudo.y = y;
	}
	else //caso contrário
	{
		//meu escudo volta a ser noone
		meu_escudo = noone;
	}

}
#endregion